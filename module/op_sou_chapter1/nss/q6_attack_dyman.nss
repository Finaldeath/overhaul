//::///////////////////////////////////////////////
//:: Default On Attacked
//:: q6_attack_dyman
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If already fighting then ignore, else determine
    combat round
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: March 26/03
//:://////////////////////////////////////////////



void main()
{
    effect eDeath = EffectDeath(TRUE);
    DelayCommand(2.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeath, OBJECT_SELF));
}
