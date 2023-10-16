//::///////////////////////////////////////////////
//:: Planar Portal Inventory Disturbed
//:: 2Q4D_PLANAR_INVD
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When the token and the celestial water
    are placed in the portal is will deactivate
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 16, 2002
//:://////////////////////////////////////////////

void main()
{
    object oDisturb = GetInventoryDisturbItem();

    if(GetInventoryDisturbType() == INVENTORY_DISTURB_TYPE_ADDED)
    {
        if(GetTag(oDisturb) == "2Q4_PLANAR_TOKEN")
        {
            SetLocalInt(OBJECT_SELF, "NW_2Q4_TOKEN", 1);
        }
        else if(GetTag(oDisturb) == "2Q4_GLOWSPHERE")
        {
            SetLocalInt(OBJECT_SELF, "NW_2Q4_GLOW", 1);
        }
    }
    else if((GetInventoryDisturbType() == INVENTORY_DISTURB_TYPE_REMOVED))
    {
        if(GetTag(oDisturb) == "2Q4_PLANAR_TOKEN")
        {
            SetLocalInt(OBJECT_SELF, "NW_2Q4_TOKEN", 0);
        }
        else if(GetTag(oDisturb) == "2Q4_GLOWSPHERE")
        {
            SetLocalInt(OBJECT_SELF, "NW_2Q4_GLOW", 0);
        }
    }

    /*
    object oToken = GetItemPossessedBy(OBJECT_SELF, "2Q4_PLANAR_TOKEN");
    object oGlow = GetItemPossessedBy(OBJECT_SELF, "2Q4_GLOWSPHERE");

    if(GetIsObjectValid(oToken) && GetIsObjectValid(oGlow))
    {
        effect eVis = EffectVisualEffect(VFX_FNF_DISPEL_DISJUNCTION);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eVis, GetLocation(OBJECT_SELF));
        DestroyObject(OBJECT_SELF, 2.0);
    }
    */
}
