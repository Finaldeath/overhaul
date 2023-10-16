//::///////////////////////////////////////////////
//:: Name  act_q5arzig_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    MJK tries to run away, kobold guards kill him.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Mar 24/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oJumpTo = GetWaypointByTag("wp_q5masterjump_ent");
    object oGuard = GetObjectByTag("q5_arzigguard_1");
    object oMaster = GetObjectByTag("Q5_KLUMPH");

    ActionPauseConversation();
    AssignCommand(oMaster, ActionMoveToObject(oJumpTo, TRUE));
    AssignCommand(oGuard, ActionAttack(oMaster));
    DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(TRUE), oMaster));
    ActionResumeConversation();
}
