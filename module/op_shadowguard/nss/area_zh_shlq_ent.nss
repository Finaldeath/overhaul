#include "help_general"
#include "help_hench"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        ExploreAreaForPlayer(OBJECT_SELF, oPC);

        SetLocalInt(GetModule(), "N_INTERLUDE", 1);

        AssignCommand(oPC, ClearAllActions());

        SetCommandable(TRUE, oPC);

        if (GetLocalInt(GetModule(), "N_MODULE_STAGE") < 2)
        {
            if (GetFirstTimeIn())
            {
                RemoveAllEffects(oPC);

                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(GetMaxHitPoints(oPC)), oPC);

                object oChair = GetNearestObjectByTag("PT_PC_SITTING_CHAIR", oPC);

                AssignCommand(oPC, ActionSit(oChair));

        //This script never actually runs. Module Stage gets updated in Help_Hench
                SetLocalInt(GetModule(), "N_MODULE_STAGE", 1);

                SpawnAllHenchmen(oPC);

                DelayCommand(3.0, BeginCutscene(oPC, "sc_interlude"));
            }
        }

        else if (GetLocalInt(GetModule(), "N_MODULE_STAGE") == 2)
        {
            if (GetLocalInt(OBJECT_SELF, "N_DO_STAGE_2_ONCE") == 0)
            {
                RemoveAllEffects(oPC);

                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(GetMaxHitPoints(oPC)), oPC);

                object oDoor = GetNearestObjectByTag("DT_SG_PLAYERS_DOOR", oPC);

                AssignCommand(oDoor, ActionCloseDoor(oDoor));

                SetLocked(oDoor, TRUE);

                CreateCreatureOnWP("CT_UNIQ_SH_VHOR", oPC);

                BeginCutscene(oPC, "sc_st_2_beg");

                SetLocalInt(OBJECT_SELF, "N_DO_STAGE_2_ONCE", 1);
            }
        }
    }
}
