#include "help_hench"
#include "help_general"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetJournalQuestState("JT_PREL_MARK", oPC) == 4)
        {
            int i;

            object oMikel = GetNearestObjectByTag("CT_UNIQ_RC_MIKE", oPC);
            SceneSpeak(oMikel, "Curses! It seems the Imperials are onto our plot! Don't let them leave alive!");

            AdjustReputation(oPC, oMikel, -100);
            ChangeToStandardFaction(oMikel, STANDARD_FACTION_HOSTILE);

            //Make all other guards go hostile
            int iNth = 1;
            object oGuard = GetNearestObjectByTag("CT_COMM_RC_GUARD", oPC, iNth);
            while (oGuard != OBJECT_INVALID)
            {
                ChangeToStandardFaction(oGuard, STANDARD_FACTION_HOSTILE);
                AssignCommand(oGuard, ActionMoveToObject(oPC));

                //Update loop variables
                iNth++;
                oGuard = GetNearestObjectByTag("CT_COMM_RC_GUARD", oPC, iNth);
            }
            iNth = 1;
            oGuard = GetNearestObjectByTag("CT_COMM_SH_GDRC", oPC, iNth);
            while (oGuard != OBJECT_INVALID)
            {
                ChangeToStandardFaction(oGuard, STANDARD_FACTION_HOSTILE);
                AssignCommand(oGuard, ActionMoveToObject(oPC));

                //Update loop variables
                iNth++;
                oGuard = GetNearestObjectByTag("CT_COMM_RC_GUARD", oPC, iNth);
            }

/*            if (GetLocalInt(oPC, "N_RC_GUARDS_ENTERED") == 1)
            {
                object oGuard;
                for (i = 1; i <= 2; i++)
                {
                    string sTag = "CT_COMM_SH_GDRC";
                    oGuard = GetNearestObjectByTag("CT_COMM_SH_GDRC", oPC, i);
                }
            }
*/
        }
    }
}
