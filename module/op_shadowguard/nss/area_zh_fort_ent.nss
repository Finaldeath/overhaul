#include "help_general"
#include "help_hench"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        // STAGE 2
        if (GetLocalInt(GetModule(), "N_MODULE_STAGE") == 2)
        {
            if (GetFirstTimeIn())
            {
                AddJournalSingle("JT_ST_2_MAIN", 3, oPC);

                ExploreAreaForPlayer(OBJECT_SELF, oPC);

                object oHarkon = SpawnCreatureByRace("CT_HARKON", oPC);

                SpawnCreatureByRace("CT_VERONA", oPC);

                object oHench = GetHenchman(oPC);

                if (GetTag(oHench) == "HENCH_MARK")
                {
                    DelayCommand(3.0, SceneSpeak(oHench, "This is the Imperial fortress of Zhantara, " + GetName(oPC) + "...  Come, let us go meet Overlord Vhorkas in his chambers."));

                    object oWP = GetNearestObjectByTag("WP_HR_HENCH_MARK_2_3", oPC);

                    location lWP = GetLocation(oWP);

                    RemoveHenchman(oPC, oHench);

                    AssignCommand(oHench, ActionMoveToObject(oWP));
                }

                SpawnHenchman(oPC, "HENCH_MARK");
            }


        } // END STAGE 2
    }
}
