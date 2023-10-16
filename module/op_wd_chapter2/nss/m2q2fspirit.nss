//::///////////////////////////////////////////////
//:: M2Q2FSPIRIT.NSS
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Does damage to the player standing in the trigger area.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    effect eExplode = EffectVisualEffect(VFX_FNF_PWKILL);
    effect eFire = EffectVisualEffect(VFX_IMP_POISON_S);
    effect eDam = EffectDamage(10, DAMAGE_TYPE_MAGICAL);
    location lLocal = GetLocation(GetWaypointByTag("WP_M2Q2F2SPIRIT"));

//*    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eExplode, lLocal);

    object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, 4.0, lLocal);
    while (GetIsObjectValid(oTarget))
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eFire, oTarget);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget);
        oTarget = GetNextObjectInShape(SHAPE_SPHERE, 4.0, lLocal);
    }
}
