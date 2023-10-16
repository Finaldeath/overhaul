//::///////////////////////////////////////////////
//:: Name:c2_ent_trcktrig4
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Start Track Conversation with the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: April 28/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nTriggered") != 1)
    {
        object oPC = GetEnteringObject();
        if (GetIsPC(oPC) == TRUE)
        {
            //CHANGE THIS LINE TO REFLECT THE TYPE OF TRACKS THIS TRIGGER IS REPORTING
            //THIS IS THE TAG OF THE ASSOCIATED INVISIBLE OBJECT
            //*******************************************************
            object oDialog = GetNearestObjectByTag("und_mixtracks", oPC);
            //*******************************************************
            AssignCommand(oPC, ClearAllActions());
            SetLocalInt(OBJECT_SELF, "nTriggered", 1);
            AssignCommand(oPC, PlayVoiceChat(VOICE_CHAT_LOOKHERE, oPC));
            AssignCommand(oDialog, ActionStartConversation(oPC, "", TRUE));
        }

    }
}
