//::///////////////////////////////////////////////
//:: Conversation
//:: m2q3HeroFailed
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC answers the riddle incorrectly.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 20, 2001
//:://////////////////////////////////////////////

void main()
{
    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectDamage(5,DAMAGE_TYPE_FIRE),GetPCSpeaker());
    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_FLAME_S),GetPCSpeaker());
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_DIVINE_STRIKE_FIRE),GetLocation(OBJECT_SELF));
    SetLocalInt(GetArea(OBJECT_SELF),"NW_A_MaegalSpawn",0);
    DestroyObject(OBJECT_SELF);
}
