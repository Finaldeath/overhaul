#include "help_hench"
#include "help_general"

void GhostlyPulse(object oPC)
{
    if (GetArea(oPC) == OBJECT_SELF)
    {
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_GHOSTLY_VISAGE), oPC, 3.0);
    }

    DelayCommand(3.0, GhostlyPulse(oPC));
}

void main()
{
    object oPC = GetEnteringObject();

    string sTag = GetTag(oPC);

    if (GetIsPC(oPC))
    {
        GhostlyPulse(oPC);

        if (GetFirstTimeIn())
        {
            /*
            if (GetLocalInt(GetModule(), "N_TEST") == 1)
                ExploreAreaForPlayer(OBJECT_SELF, oPC);
            */

            BeginCutscene(oPC, "sc_st_2_ch_ent");
        }

        else if (GetJournalQuestState("JT_ST_2_MAIN", oPC) == 9)
        {
            if (GetLocalInt(OBJECT_SELF, "N_DO_ST_9_ONCE") == 0)
            {
                object oRakha = GetNearestObjectByTag("CT_UNIQ_NT_RAKH", oPC);

                AssignCommand(oPC, ActionStartConversation(oRakha));

                SetLocalInt(OBJECT_SELF, "N_DO_ST_9_ONCE", 1);
            }
        }
    }

    else if (sTag == "CT_UNIQ_NT_OKAR" || sTag == "CT_UNIQ_NT_RAKH" || sTag == "CT_UNIQ_NT_SERV")
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_GHOSTLY_VISAGE), oPC);
}
