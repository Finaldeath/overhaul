//::///////////////////////////////////////////////
//:: Name act_q1hblake_10
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Have Walther stand up because he's cured.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 12/03
//:://////////////////////////////////////////////

void main()
{
    object oBlake = GetObjectByTag("q1hblake");
    object oPC = GetPCSpeaker();
    ActionPauseConversation();
    effect eEffect = GetFirstEffect(oBlake);
    DelayCommand(2.0, RemoveEffect(oBlake, eEffect));

    SetLocalInt(oBlake, "nCured", 1);
    AssignCommand(oBlake, PlayAnimation(ANIMATION_LOOPING_PAUSE_DRUNK,1.0, 1.5));
    AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW,1.0, 1.0));
    DelayCommand(2.75, ActionResumeConversation());

}
