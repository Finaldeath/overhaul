//::///////////////////////////////////////////////
//:: Name q2b_endcon_fairy
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The fairy monitor will fly off at the end of the conversation
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: July 9/03
//:://////////////////////////////////////////////

void main()
{
    object oFairy = OBJECT_SELF;
    DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDisappear(), oFairy));

}
