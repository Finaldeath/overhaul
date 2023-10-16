//::///////////////////////////////////////////////
//:: Name  act_q1aayala_8
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Ayala will check on Drogan
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 4/03
//:://////////////////////////////////////////////

void main()
{
    object oDrogan = GetObjectByTag("Drogan");
    object oAyala = GetObjectByTag("Ayala");
    ActionPauseConversation();
    AssignCommand(oAyala, ActionMoveToObject(oDrogan));
    AssignCommand(oAyala, ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0, 2.0));
    SetLocalInt(OBJECT_SELF, "nOpenningSpeech2", 1);
    DelayCommand(3.5, ActionResumeConversation());
}
