// Updates the PC's journal entry and quest variables
// for the object being spoken to

#include "help_hench"

void main()
{
    string s = GetJournalQuest(GetTag(OBJECT_SELF));;

    AddJournalSingle(s, 6, GetPCSpeaker());

    SetLocalInt(GetPCSpeaker(), "N_RATTED_MIKE", 1);

    object oPC = GetPCSpeaker();

    if (GetLocalInt(oPC, "N_PROMISED_MIKEL") == 1)
    {
        if (GetLocalInt(GetModule(), "N_MIKEL_DEAD") == 0)
        {
            SendMessageToPC(oPC, "[Your alignment has shifted toward Chaotic for turning Mikel over to the authorities after giving him your word...]");
            AdjustAlignment(oPC, ALIGNMENT_CHAOTIC, 5);
        }
    }
}
