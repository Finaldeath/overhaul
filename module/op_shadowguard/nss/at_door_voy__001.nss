#include "help_hench"

void main()
{
    object oPC = GetClickingObject();

    if (GetIsPC(oPC))
    {

        object oWP;

        location lWP;

        // STAGE 2
        if (GetLocalInt(GetModule(), "N_MODULE_STAGE") == 2)
        {
            // For handling individual SG Quests
            if (GetJournalQuestState("JT_ST_2_MAIN", oPC) < 15)
            {
                string s = GetLocalString(oPC, "S_ST_2_CURR_QUEST");

                oWP = GetWaypointByTag("WP_S2_BEG_QST_" + s);

                // Handles situation of returning back to Zhantara
                if (oWP == OBJECT_INVALID)
                    oWP = GetWaypointByTag("WP_MOD_ENTER");
            }

            // Arriving at Thakaros
            else if (GetJournalQuestState("JT_ST_2_MAIN", oPC) >= 15)
                oWP = GetWaypointByTag("WP_THAK_START");

        } // END STAGE 2

        // Whatever the case, make oPC jump to waypoint
        lWP = GetLocation(oWP);

        AssignCommand(oPC, JumpToLocation(lWP));
    }
}
