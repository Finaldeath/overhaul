//::///////////////////////////////////////////////
//:: Name act_q6man_6
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Nasty PC kills Dying Man...
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 12/03
//:://////////////////////////////////////////////

void main()
{
    object oMan = GetObjectByTag("dyingman");
    SetCommandable(TRUE, oMan);
    object oPC = GetPCSpeaker();
    AssignCommand(oPC, ActionMoveToObject(oMan));
    AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0, 1.5));

    effect eDeath = EffectDeath(TRUE);
    DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeath, oMan));
    AdjustAlignment(oPC, ALIGNMENT_EVIL, 5);
}
