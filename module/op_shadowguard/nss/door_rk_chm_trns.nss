#include "help_hench"
#include "help_general"

void main()
{
    object oPC = GetClickingObject();

    if (GetIsPC(oPC))
    {
        if (GetJournalQuestState("JT_ST_2_MAIN", oPC) < 12)
            SceneSpeak(oPC, "[Before you lies a strange door of some sort... but you see no way of passing through it at the moment...]");

        else
        {
            if (GetLocalInt(OBJECT_SELF, "N_DO_ONCE") == 0)
            {
                AddJournalSingle("JT_ST_2_MAIN", 13, oPC);

                object oWP;

                location lWP;

                oWP = GetWaypointByTag("WP_RK_CHM_RETURN");

                lWP = GetLocation(oWP);

                SceneSpeak(oPC, "[As you place your hand upon this strange portal, you feel yourself being pulled forward... and then you know nothing more...]");

                FadeToBlack(oPC, FADE_SPEED_FAST);

                AssignCommand(oPC, DelayCommand(5.0, JumpToLocation(lWP)));

                SetLocalInt(OBJECT_SELF, "N_DO_ONCE", 1);
            }
        }
    }
}
