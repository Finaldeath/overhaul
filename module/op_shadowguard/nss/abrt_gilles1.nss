//Gilles walk away script on abort of his DLG.
#include "help_hench"

void main()
{
    string sTalk1 = "[Without a further word, Gilles bows in farewell] I shall tell your father to hurry!";

    if (GetLocalInt(OBJECT_SELF, "N_TALK_SWITCH") == 0)
        return;

    string s = GetJournalQuest(GetTag(OBJECT_SELF));

    if (GetPCInt(GetPCSpeaker(), s) <= 2)
    {
        ActionSpeakString(sTalk1);
        ExecuteScript("conv_sc_mess_03", OBJECT_SELF);
    }
}
