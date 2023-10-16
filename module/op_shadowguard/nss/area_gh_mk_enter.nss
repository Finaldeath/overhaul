#include "help_general"
#include "help_hench"

void WalkToWP(object oBH, location lWP)
{
    if (GetDistanceBetweenLocations(GetLocation(oBH), lWP) > 4.0)
    {
        AssignCommand(oBH, ActionMoveToLocation(lWP));

        AssignCommand(oBH, DelayCommand(4.0, WalkToWP(oBH, lWP)));
    }
}

// Explores area for player

void main()
{
    if (GetIsPC(GetEnteringObject()))
        ExploreAreaForPlayer(OBJECT_SELF, GetEnteringObject());

    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        DoSinglePlayerAutoSave();
        // STAGE 0
        if (GetLocalInt(GetModule(), "N_MODULE_STAGE") == 0)
        {
            if (GetLocalInt(OBJECT_SELF, "N_DO_ONCE") == 0)
            {
                object oNew;
                string s = "CT_COMM_NT_GHCM";
                object o;
                int i;

                SceneSpeak(oPC, "[Your senses are assaulted by a multitude of noises and scents as you enter the crowded, bustling Market District of Ghaarak...]");

                for (i = 1; i <= 4; i++)
                {
                    o = GetNearestObjectByTag("WP_" + s, oPC, i);

                    oNew = CreateObject(OBJECT_TYPE_CREATURE, s, GetLocation(o));
                    SetLocalInt(oNew, "N_DONT_RAND", 1);
                }

                SetLocalInt(OBJECT_SELF, "N_DO_ONCE", 1);
            }

            // SPECIAL CASE FOR TARIN STAGE 0 QUEST TO CREATE MALTHAR NEAR NIGHTCRAWLER LAIR
            if (GetJournalQuestState("JT_PREL_TARI", oPC) >= 10 && GetLocalInt(OBJECT_SELF, "N_DO_MALT_ONCE") == 0)
            {
                object oMalt = CreateCreatureOnWP("CT_UNIQ_PH_MALT", oPC);
                object oTrapDoor = GetNearestObjectByTag("PLAC_TRDR_ST_0_NC_LAIR", oPC);

                SetLocalInt(oMalt, "N_DONT_SPEAK", 1);
                SetLocked(oTrapDoor, FALSE);
                SetLocalInt(OBJECT_SELF, "N_DO_MALT_ONCE", 1);
            }

            // SPECIAL CASE FOR TARIN STAGE 0 QUEST TO CREATE TARIN AND BRUKUS OUTSIDE THE NIGHTCRAWLER LAIR
            else if (GetJournalQuestState("JT_PREL_TARI", oPC) == 18)
            {
                if (GetLocalInt(OBJECT_SELF, "N_DO_PREL_TARI_18_ONCE") == 0)
                {
                    string s;
                    object oWP, oTarin;
                    location lWP;

                    s = "HENCH_TARI";

                    oWP = GetNearestObjectByTag("WP_" + s, oPC);
                    lWP = GetLocation(oWP);
                    oTarin = CreateHenchman(oPC, s, lWP);

                    s = "HENCH_BRUK";

                    oWP = GetNearestObjectByTag("WP_" + s, oPC);
                    lWP = GetLocation(oWP);
                    CreateHenchman(oPC, s, lWP);

                    SceneSpeak(oPC, "[You see Tarin and Lyen standing nearby, both beaming widely at you.]");

                    AssignCommand(oTarin, ActionStartConversation(oPC));

                    SetLocalInt(OBJECT_SELF, "N_DO_PREL_TARI_18_ONCE", 1);
                }
            }
        } // END STAGE 0

        // STAGE 1
        else if (GetLocalInt(GetModule(), "N_MODULE_STAGE") == 1)
        {
            if (GetFirstTimeIn())
            {
                AddJournalSingle("JT_ST_1_MAIN", 11, oPC);

                SceneSpeak(oPC, "[The Market District seems to be faring little better than the Imperial District...  The stench of smoke and charred flesh assails your nostrils, the sounds of battle surrounding you on all sides...]");

                object o = GetFirstObjectInArea();

                while (o != OBJECT_INVALID)
                {
                    SetLocalInt(o, "N_DONT_DESTROY_ON_DEATH", 1);

                    if (GetTag(o) == "CT_COMM_NT_BTOW" || GetTag(o) == "CT_COMM_NT_GHCM")
                        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), o);

                    o = GetNextObjectInArea();
                }
            }
        } // END STAGE 1
    }
}
