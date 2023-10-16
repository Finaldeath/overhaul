//::///////////////////////////////////////////////
//:: m2q3G Mayor Mobley Action Script #2
//:: m2q3G_MayorA2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Causes Mayor Mobley to disappear with an
    "evil" special effect.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Feb 13, 2002
//:://////////////////////////////////////////////

void main()
{
    location lLoc = GetLocation(OBJECT_SELF);

    ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_FIREBALL),lLoc);
    DestroyObject(OBJECT_SELF);
}
