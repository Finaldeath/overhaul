//::///////////////////////////////////////////////
//:: Name  x2_pkeg_used
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Start the conversation with the powderkeg
*/
//:://////////////////////////////////////////////
//:: Created By: Georg Zoeller
//:: Created On: June 12/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF,"X2_OBJECT_ACTIVE") == FALSE)
    {
        object oPC = GetLastUsedBy();
        AssignCommand(oPC, ClearAllActions(TRUE));
        ActionStartConversation(oPC);
    }
        else
    {
        AssignCommand(GetLastUsedBy(),PlayVoiceChat(VOICE_CHAT_BADIDEA));
    }


}
