//:://////////////////////////////////////////////////
//:: NW_C2_DEFAULT4
/*
  Default OnConversation event handler for NPCs.

 */
//:://////////////////////////////////////////////////
//:: Copyright (c) 2002 Floodgate Entertainment
//:: Created By: Naomi Novik
//:: Created On: 12/22/2002
//:://////////////////////////////////////////////////

#include "nw_i0_generic"

void main()
{
    // For debugging
    MyPrintString("On Conversation");
    int nMatch = GetListenPatternNumber();
    object oShouter = GetLastSpeaker();

    if (nMatch == -1)
    {
        object oTalker = GetNearestObjectByTag("Q5A_TALKER");
        object oPC = GetLastSpeaker();
        AssignCommand(oTalker, ActionStartConversation(oPC));
        PlayVoiceChat(VOICE_CHAT_HELLO);
    }

    // Send the user-defined event if appropriate
    if(GetSpawnInCondition(NW_FLAG_ON_DIALOGUE_EVENT))
    {
        SignalEvent(OBJECT_SELF, EventUserDefined(EVENT_DIALOGUE));
    }
}
