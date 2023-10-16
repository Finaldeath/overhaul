//::///////////////////////////////////////////////
//:: Name q2b_dist_mirror
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When the inventory in a mirror is disturbed,
    it will shatter..
    Any inventory inside it will be destroyed
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: July 23/03
//:://////////////////////////////////////////////

void main()
{
    //if the PC adds a plot item to the mirror inventory - give it back to the PC
    //so it doesn't get destroyed.
    if (GetInventoryDisturbType() == INVENTORY_DISTURB_TYPE_ADDED)
    {
        object oItem = GetInventoryDisturbItem();
        //Do nothing for the relic of the reaper since it gets replaced when dropped automatically
        if (GetTag(oItem) == "x2_p_reaper")
            return;

        if (GetPlotFlag(oItem) == TRUE)
        {
            object oPC = GetLastDisturbed();
            string szResRef = GetResRef(oItem);
            DestroyObject(oItem);
            CreateItemOnObject(szResRef, oPC);
        }
    }
    else
    {
        location lSelf = GetLocation(OBJECT_SELF);
        object oPC = GetLastDisturbed();
        //VFX
        effect eVis = EffectVisualEffect(VFX_IMP_HEALING_G);
        effect eVis2 = EffectVisualEffect(VFX_IMP_MAGIC_PROTECTION);
        effect eLink = EffectLinkEffects(eVis, eVis2);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eLink, lSelf);

        object oItem = GetFirstItemInInventory();
        while (oItem != OBJECT_INVALID)
        {
            DestroyObject(oItem);
            oItem = GetNextItemInInventory();
        }
        DestroyObject(OBJECT_SELF, 0.5);
    }
}
