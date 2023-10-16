////////////////////////////////////////////////////////////////////////////////
// This script will trigger Lord Podunk to initiate dialogue with the PC.
//
// Created by: Brad Prince
// 9-13-02
//
///////////////////////////////////////////////////////////////////////////////

void main()
{
    object oNPC = GetObjectByTag("Lord");
    object oPC = GetEnteringObject();
    if(GetIsPC(oPC))
    {
        AssignCommand(oPC, ClearAllActions());
        AssignCommand(oNPC, ClearAllActions());
        //AssignCommand(oNPC, SpeakString("[NOT IN STRING EDITOR] Ah, have you broght my meal...  what the!?"));
        DelayCommand(2.0, AssignCommand(oNPC, ActionStartConversation(oPC, "podunk")));
        DestroyObject(GetObjectByTag("podunk_trigger"), 3.0);
    }
}

