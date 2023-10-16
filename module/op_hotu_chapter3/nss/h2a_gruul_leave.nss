//::///////////////////////////////////////////////
//:: Gru'ul the Quarry Boss, He Leaves (Action Script)
//:: H2c_Gruul_Leave.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Get rid of Gru'ul so players can't talk to
     him again.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 7, 2003
//:://////////////////////////////////////////////

void main()
{
    //Get rid of Gruul
    //effect eVFX = EffectVisualEffect(VFX_IMP_DIVINE_STRIKE_FIRE);
    effect eVFX = EffectDisappear();
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVFX, OBJECT_SELF);
    //DestroyObject(OBJECT_SELF, 0.5);
}
