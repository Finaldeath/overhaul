#include "help_hench"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetJournalQuestState("JT_ST_2_MAIN", oPC) >= 10)
        {
            string sConv = GetTag(OBJECT_SELF);

            BeginCutscene(oPC, sConv);
        }
    }
}
