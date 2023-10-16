//::///////////////////////////////////////////////
//:: Default On Attacked
//:: q2c_att_fleekobold
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If already fighting then ignore, else determine
    combat round
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 16, 2001
//:://////////////////////////////////////////////

#include "nw_i0_generic"

void main()
{
    DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), OBJECT_SELF));
}
