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
    if(GetLocalInt(OBJECT_SELF, "FREE") == 0)
    {
        int nMatch = GetListenPatternNumber();
        object oShouter = GetLastSpeaker();
        object oTalker = GetNearestObjectByTag("q3c_talker");
        if (nMatch == -1)
        {
            //PlayVoiceChat(VOICE_CHAT_PAIN1, OBJECT_SELF);
            AssignCommand(oTalker, ActionStartConversation(oShouter));
        }
    }
    else
        ExecuteScript("x0_ch_hen_conv", OBJECT_SELF);
}
