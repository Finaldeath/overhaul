//::///////////////////////////////////////////////
//:: Name : q2a1_trig_dog
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When a PC enters this trigger - the dog will run
    up to the PC, bark - run to the crate and bark.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Jan 14/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();
    object oCrate = GetObjectByTag("q2a1chikcrate");
    if (GetIsPC(oPC) == TRUE && GetIsObjectValid(oCrate) == TRUE)
    {
        object oDog = GetObjectByTag("q2a1_dog");
        AssignCommand(oDog, ActionMoveToObject(oPC, TRUE));
        AssignCommand(oDog, ActionDoCommand(PlayVoiceChat(VOICE_CHAT_BATTLECRY1)));
        AssignCommand(oDog, ActionDoCommand(PlayAnimation(ANIMATION_FIREFORGET_TAUNT)));
        DelayCommand(5.0,AssignCommand(oDog, ActionMoveToObject(oCrate, TRUE)));
        DelayCommand(9.0, AssignCommand(oDog, ActionDoCommand(PlayVoiceChat(VOICE_CHAT_BATTLECRY1))));
        DelayCommand(10.0, AssignCommand(oDog, ActionDoCommand(PlayAnimation(ANIMATION_FIREFORGET_TAUNT))));

    }
}
