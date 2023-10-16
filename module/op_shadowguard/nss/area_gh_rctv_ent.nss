#include "help_hench"
#include "help_general"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetJournalQuestState("JT_PREL_MARK", oPC) > 0)
        {
            object oDoor = GetNearestObjectByTag("DOOR_019_0_0", oPC);

            object oGuard = GetNearestObjectByTag("CT_COMM_RC_GUAR", oPC);

            SetPlotFlag(oGuard, FALSE);
        }

        if (GetJournalQuestState("JT_PREL_KARA", oPC) >= 3)
        {
            object oWP = GetNearestObjectByTag("MP_KARAS_INN_ROOM", oPC);

            SetMapPinEnabled(oWP, TRUE);
        }

        // SPAWN THE AKHANA DISCIPLES IF PC RATTED ON KARA
        if (GetJournalQuestState("JT_PREL_KARA_2", oPC) == 16 && GetLocalInt(OBJECT_SELF, "N_DO_AK_DISC_ONCE") == 0)
        {
            SignalEvent(GetModule(), EventUserDefined(1001));
            SetLocalInt(OBJECT_SELF, "N_DO_AK_DISC_ONCE", 1);
        }

        if ((GetJournalQuestState("JT_PREL_KARA_2", oPC) >= 14)
            && (GetJournalQuestState("JT_PREL_KARA_2", oPC) <= 16))
        {
            DoSinglePlayerAutoSave();
        }

        // STAGE 0 ONLY
        if (GetLocalInt(GetModule(), "N_MODULE_STAGE") == 0)
        {
            // first time in material
            if (GetFirstTimeIn())
            {
                //Do a black out to provide them with enough time to get seated.
                BlackScreen(oPC);

                // Cause all creatures to sit down if chair nearby
                object o = GetFirstObjectInArea();

                object oChair;

                while (o != OBJECT_INVALID)
                {
                    oChair = GetNearestObjectByTag("PT_" + GetTag(o), o);

                    if (GetTag(o) == "CT_UNIQ_SH_WLCH")
                        PermanentSitCross(o);

                    else if (GetArea(oChair) == GetArea(o))
                        AssignCommand(o, ActionSit(oChair));

                    o = GetNextObjectInArea();
                }

                //Remove the black screen.
                DelayCommand(2.0, FadeFromBlack(oPC));

            } // end first time in material

            if (GetJournalQuestState("JT_PREL_MARK", oPC) == 2)
            {
                if (GetLocalInt(OBJECT_SELF, "N_DO_RC_GRDS_ONCE") == 0)
                {
                    object oWP;
                    location lWP;

                    int nNumbGuards = 2;

                    int i;

                    for (i = 1; i <= nNumbGuards; i++)
                    {
                        oWP = GetNearestObjectByTag("WP_CT_COMM_SH_GDRC", oPC, i);
                        lWP = GetLocation(oWP);

                        CreateObject(OBJECT_TYPE_CREATURE, "CT_COMM_SH_GDRC", lWP);
                    }

                    SetLocalInt(OBJECT_SELF, "N_DO_RC_GRDS_ONCE", 1);
                }
            }
        }
    }
}
