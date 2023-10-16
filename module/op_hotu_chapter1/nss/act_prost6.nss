//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Set PC slept with prostitute.Take 100 gold.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Jan 23, 2003
//:://////////////////////////////////////////////
#include "inc_plot_locals"
void main()
{
    ActionPauseConversation();
    PCSleptWithProstitute(GetTag(OBJECT_SELF), GetPCSpeaker());
    TakeGoldFromCreature(200,GetPCSpeaker());
    FadeToBlack(GetPCSpeaker());
    AssignCommand(GetPCSpeaker(), PlaySound("vs_fseductf_tant"));

    DelayCommand(3.0, PlayVoiceChat(VOICE_CHAT_PAIN1, GetPCSpeaker()));
    DelayCommand(4.0, PlayVoiceChat(VOICE_CHAT_PAIN1, OBJECT_SELF));
    DelayCommand(4.5, PlayVoiceChat(VOICE_CHAT_PAIN2, GetPCSpeaker()));
    DelayCommand(5.0, PlayVoiceChat(VOICE_CHAT_PAIN2, OBJECT_SELF));
    DelayCommand(5.2, PlayVoiceChat(VOICE_CHAT_PAIN1, GetPCSpeaker()));
    DelayCommand(5.3, PlayVoiceChat(VOICE_CHAT_PAIN1, OBJECT_SELF));
    DelayCommand(5.3, PlayVoiceChat(VOICE_CHAT_CHEER, OBJECT_SELF));
    DelayCommand(9.0, FadeFromBlack(GetPCSpeaker()));
    DelayCommand(10.0, ActionResumeConversation());
}
