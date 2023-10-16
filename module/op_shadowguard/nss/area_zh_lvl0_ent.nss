#include "help_hench"
#include "help_general"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        FadeFromBlack(oPC, FADE_SPEED_FAST);

        if (GetJournalQuestState("JT_ST_2_MAIN", oPC) == 13)
        {
            if (GetLocalInt(OBJECT_SELF, "N_DO_ONCE") == 0)
            {
                SpawnAllHenchmen(oPC);

                CreateCreatureOnWP("CT_UNIQ_NT_VHOR", oPC);

                SetLocalInt(OBJECT_SELF, "N_DO_ONCE", 1);
            }
        }
    }
}
