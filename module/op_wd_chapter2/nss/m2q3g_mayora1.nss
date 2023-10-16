//::///////////////////////////////////////////////
//:: m2q3G Mayor Mobley Action Script #1
//:: m2q3G_MayorA1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Causes Mayor Mobley to disappear with a "good"
    special effect.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Feb 13, 2002
//:://////////////////////////////////////////////

void main()
{
    location lLoc = GetLocation(OBJECT_SELF);

    ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_PWSTUN),lLoc);
    DestroyObject(OBJECT_SELF);
}
