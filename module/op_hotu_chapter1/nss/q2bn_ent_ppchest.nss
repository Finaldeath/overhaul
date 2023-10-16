//::///////////////////////////////////////////////
//:: Name q2bn_ent_ppchest
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On Enter - spawn the chest at the far waypoint
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  June 18/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(GetModule(), "X2_q2bn_chestspawned") == 1)
        return;

    if (GetLocalInt(GetModule(), "X2_q2bn_chest1taken") == 1)
        return;
    PlaySound("as_cv_shopmetal2");
    SetLocalInt(GetModule(),"X2_q2bn_chestspawned", 1);
    SetLocalInt(OBJECT_SELF, "nDespawnActive", 1);
    location lTarget = GetLocation(GetWaypointByTag("wp_q2bn_ppchest1"));
    effect eVis = EffectVisualEffect(VFX_IMP_BLIND_DEAF_M);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, lTarget);
    CreateObject(OBJECT_TYPE_PLACEABLE, "q2bn_ppchest", lTarget);

}
