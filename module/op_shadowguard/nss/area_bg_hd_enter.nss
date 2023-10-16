#include "help_hench"
#include "help_general"

// Explores area for player

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        // STAGE 2
        if (GetLocalInt(GetModule(), "N_MODULE_STAGE") == 2)
        {
            if (GetLocalString(oPC, "S_ST_2_CURR_QUEST") == "HENCH_LYEN")
            {
                AddJournalSingle("JT_ST_2_HENCH_LYEN", 4, oPC);

                SceneSpeak(oPC, "[After several days journey, you feel the Voyager bump heavily as it reaches land...]");

                DelayCommand(4.0, SceneSpeak(GetHenchman(oPC), "It seems we have arrived at Azakhal, " + GetName(oPC) + "...  Come, let us go above decks..."));
            }
        }
    }
}
