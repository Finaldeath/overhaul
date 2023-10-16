#include "help_general"
#include "help_hench"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetFirstTimeIn())
        {
            SetLocalInt(GetModule(), "N_MODULE_STAGE", 1);
            AddJournalSingle("JT_ST_1_MAIN", 15, oPC);

            object o = GetFirstObjectInArea();

            while (o != OBJECT_INVALID)
            {
                if (GetTag(o) == "CT_COMM_SH_STG1")
                {
                    SetLocalInt(o, "N_DONT_DESTROY_ON_DEATH", 1);

                    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), o);
                }

                o = GetNextObjectInArea();
            }

            ExploreAreaForPlayer(OBJECT_SELF, oPC);

            //AddJournalSingle("JT_ST_1_MAIN", 15, oPC);

            object oHench = GetHenchman(oPC);

            string sTag;

            sTag = "HENCH_MARK";
            if (GetTag(oHench) != sTag)
                SpawnHenchman(oPC, sTag);

            sTag = "HENCH_KARA";
            if (GetTag(oHench) != sTag)
                SpawnHenchman(oPC, sTag);

            sTag = "HENCH_TARI";
            if (GetTag(oHench) != sTag)
            {
                if ((GetJournalQuestState("JT_PREL_TARI", oPC) != 15)
                && (GetJournalQuestState("JT_PREL_TARI", oPC) != 16))
                {
                    SpawnHenchman(oPC, "HENCH_TARI");
                }
            }

            sTag = "HENCH_BRUK";
            if (GetTag(oHench) != sTag)
            {
                if (GetJournalQuestState("JT_PREL_TARI", oPC) != 16)
                {
                    SpawnHenchman(oPC, "HENCH_BRUK");
                }
            }

            // Lyen Cut
            //sTag = "HENCH_LYEN";
            //if (GetTag(oHench) != sTag)
            //    SpawnHenchman(oPC, sTag);
            DoSinglePlayerAutoSave();
        }
    }

    else if (GetTag(oPC) == "CT_UNIQ_RC_MIKE" || GetTag(oPC) == "CT_COMM_RC_GUAR")
    {
        object oRC = oPC;

        object oWP = GetNearestObjectByTag("MP_MIKELS_BOAT", oRC);

        SetMapPinEnabled(oWP, TRUE);

        ChangeToStandardFaction(oRC, STANDARD_FACTION_MERCHANT);
    }
}
