//::///////////////////////////////////////////////
//:: Name act_q6man_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Have Dying Man stand up because he's cured.
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
    ActionPauseConversation();
    effect eEffect = GetFirstEffect(oMan);
    DelayCommand(5.0, RemoveEffect(oMan, eEffect));

    SetLocalInt(oMan, "nCured", 1);
    AssignCommand(oMan, PlayAnimation(ANIMATION_LOOPING_PAUSE_DRUNK,1.0, 1.5));
    //AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW,1.0, 1.0));
    DelayCommand(4.75, ActionResumeConversation());

}
