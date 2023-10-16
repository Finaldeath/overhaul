//::///////////////////////////////////////////////
//:: Name q2bn_ext_ppchest
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On Exit - despawn the chest at the far waypoint
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  June 18/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nDespawnActive") == 0)
        return;

    PlaySound("as_cv_metlprtop1");
    SetLocalInt(OBJECT_SELF, "nDespawnActive", 0);
    SetLocalInt(GetModule(),"X2_q2bn_chestspawned", 0);
    location lTarget = GetLocation(GetWaypointByTag("wp_q2bn_ppchest1"));
    effect eVis = EffectVisualEffect(VFX_IMP_HEALING_L);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, lTarget);
    object oChest = GetNearestObjectByTag("q2bn_ppchest");
    SetPlotFlag(oChest, FALSE);
    //Destroy the gold in the chest
    object oItem = GetFirstItemInInventory(oChest);
    while (oItem != OBJECT_INVALID)
    {
        DestroyObject(oItem);
        oItem = GetNextItemInInventory(oChest);
    }
    DestroyObject(oChest);

}
