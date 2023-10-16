#include "help_hench"
#include "help_general"

// Explores area for player

void main()
{
    if (GetIsPC(GetEnteringObject()))
        ExploreAreaForPlayer(OBJECT_SELF, GetEnteringObject());

    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        // STAGE 0
        if (GetLocalInt(GetModule(), "N_MODULE_STAGE") == 0)
        {
            if (GetJournalQuestState("JT_ST_0_MAIN", oPC) >= 8)
            {
                object o = GetFirstObjectInArea();

                while (o != OBJECT_INVALID)
                {
                    if (GetTag(o) == "DOOR_GHAA_COUN_CHAM")
                        SetLocked(o, FALSE);

                    o = GetNextObjectInArea();
                }
            }
        } // END STAGE 0

        // STAGE 1
        else if (GetLocalInt(GetModule(), "N_MODULE_STAGE") == 1)
        {
            if (GetLocalInt(OBJECT_SELF, "N_DO_HARK_CREATE") == 0)
            {
                string sTag = "CT_HARKON";

                SpawnCreatureByRace(sTag, oPC);

                SetLocalInt(OBJECT_SELF, "N_DO_HARK_CREATE", 1);
            }

            if (GetLocalInt(OBJECT_SELF, "N_ACTIVATE_GATE_ONCE") == 0)
            {
                DoSinglePlayerAutoSave();

                object oAltar = GetNearestObjectByTag("PLAC_GHAA_CONT_STONE", oPC);
                SetLocalInt(oAltar, "N_GATE_ACTIVATED", 1);
                SetLocalInt(OBJECT_SELF, "N_ACTIVATE_GATE_ONCE", 1);
                object oZhiram = GetNearestObjectByTag("CT_UNIQ_SH_ZHIR", oPC);

                SetPlotFlag(oZhiram, FALSE);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oZhiram);

                object oVarhun = GetNearestObjectByTag("CT_UNIQ_SH_VARH", oPC);

                if (GetArea(oVarhun) == GetArea(oPC))
                {
                    if (GetLocalInt(oPC, "N_VARH_DEAD") == 1)
                    {
                        DestroyObject(oVarhun);
                        object oBkshlf = GetNearestObjectByTag("PT_VARH_BKSHLF", oPC);

                        DestroyObject(oBkshlf);
                    }

                    else
                    {
                        SetPlotFlag(oVarhun, FALSE);

                        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oVarhun);
                    }
                }
            }

        } // END STAGE 1
    }
}
