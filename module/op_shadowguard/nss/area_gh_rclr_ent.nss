#include "help_hench"
#include "help_general"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        DoSinglePlayerAutoSave();

        // STAGE 0
        if (GetLocalInt(GetModule(), "N_MODULE_STAGE") == 0)
        {
            AddJournalSingle("JT_PREL_MARK", 3, oPC);

            if (GetLocalInt(oPC, "N_RATTED_MIKE") == 1)
            {
                if (GetLocalInt(OBJECT_SELF, "N_DO_STATE_6_GRDS") == 0)
                {
                    object oWP;
                    location lWP;
                    int i = 1;
                    object oGuard;
                    object oNeutral = GetObjectByTag("FACTION_NEUTRAL");

                    do
                    {
                        oWP = GetNearestObjectByTag("WP_CT_COMM_SH_GDRC", oPC, i);
                        lWP = GetLocation(oWP);
                        oGuard = CreateObject(OBJECT_TYPE_CREATURE, "CT_COMM_SH_GDRC", lWP);
                        object oMikel = GetNearestObjectByTag("CT_UNIQ_RC_MIKE", oPC);
                        //Neutralize them if Mikel is neutral.
                        if (GetReputation(oMikel, oPC) > 10)
                        {
                            ChangeFaction(oGuard, oNeutral);
                        }
                        i++;

                    } while (oWP != OBJECT_INVALID);

                    object oMikel = GetNearestObjectByTag("CT_UNIQ_RC_MIKE", oPC);
                    if (GetReputation(oMikel, oPC) > 10)
                    {
                        //Neutralize Mikel
                        ChangeFaction(oMikel, oNeutral);
                        SetPlotFlag(oMikel, TRUE);

                        //Neutralize all remaining guards.
                        int iNth = 1;
                        oGuard = GetNearestObjectByTag("CT_COMM_RC_GUARD");
                        ChangeFaction(oGuard, oNeutral);

/*                        object o = GetFirstObjectInArea();
                        while (o != OBJECT_INVALID)
                        {
                            SetPlotFlag(o, TRUE);

                            object oCursor = GetFirstObjectInArea();
                            while (oCursor != OBJECT_INVALID)
                            {
                                ClearPersonalReputation(o, oCursor);
                                SetIsTemporaryNeutral(o, oCursor);
                                oCursor = GetNextObjectInArea();
                            }

                            o = GetNextObjectInArea();
                        }
*/
                    }

                    //Make sure henchmen aren't attacking.
                    object oHench = GetHenchman(oPC);
                    AssignCommand(oHench, ClearAllActions(TRUE));

                    SetLocalInt(OBJECT_SELF, "N_DO_STATE_6_GRDS", 1);
                }
            }

            if (GetLocalInt(oPC, "N_RC_GUARDS_ENTERED") == 1)
            {
                if (GetFirstTimeIn())
                {
                    AddJournalSingle("JT_PREL_MARK", 4, oPC);

                    object oWP;
                    location lWP;

                    int i;

                    for (i = 1; i <= 2; i++)
                    {
                        oWP = GetNearestObjectByTag("WP_CT_COMM_SH_GDRC", oPC);
                        lWP = GetLocation(oWP);

                        CreateObject(OBJECT_TYPE_CREATURE, "CT_COMM_SH_GDRC", lWP);
                    }
                }

                if (GetJournalQuestState("JT_PREL_MARK", oPC) == 4)
                {
                    int i;

                    object oMikel = GetNearestObjectByTag("CT_UNIQ_RC_MIKE", oPC);
                    SceneSpeak(oMikel, "Curses! It seems the Imperials are on to our plot! Do not let them leave alive!");
                    ChangeToStandardFaction(oMikel, STANDARD_FACTION_HOSTILE);
//                    AdjustReputation(oPC, oRavenclaw, -100);

/*                    object o = GetFirstObjectInArea();
                    while (o != OBJECT_INVALID)
                    {
                        if (GetFactionEqual(o, oRavenclaw))
                        {
                            i = Random(3);

                            if (i == 0)
                                SceneSpeak(o, "We must stop the Imperials from discovering our plans! Do not let them leave alive!");

                        }

                        o = GetNextObjectInArea();
                    }
*/
                }
            }
        } // END STAGE 0

        // STAGE 1
        else if (GetLocalInt(GetModule(), "N_MODULE_STAGE") == 1)
        {
            if (GetFirstTimeIn())
            {
                SceneSpeak(oPC, "[To your surprise, you find that the lower chambers of the Ravenclaw Tavern have survived the building's destruction relatively unscathed...]");

                if (GetLocalInt(GetModule(), "N_MIKEL_DEAD") == 1)
                {
                    object o = GetFirstObjectInArea();

                    while (o != OBJECT_INVALID)
                    {
                        if (GetObjectType(o) == OBJECT_TYPE_CREATURE && GetStringLeft(GetTag(o), 5) != "HENCH")
                            DestroyObject(o);

                        o = GetNextObjectInArea();
                    }
                }
            }
        } // END STAGE 1
    }
}
