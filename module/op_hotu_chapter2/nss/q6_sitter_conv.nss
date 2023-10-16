//::///////////////////////////////////////////////
//:: Name x2_def_onconv
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Default On Conversation script
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 11/03
//:://////////////////////////////////////////////

void main()
{
    object oShouter = GetLastSpeaker();
    object oTalker = GetNearestObjectByTag("q6a_talker");
    AssignCommand(oTalker, ActionStartConversation(oShouter));
    PlayVoiceChat(VOICE_CHAT_HELLO);
}
