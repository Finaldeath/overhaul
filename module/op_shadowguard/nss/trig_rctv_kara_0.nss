#include "nw_i0_generic"
#include "help_general"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetLocalInt(oPC, "N_TOOK_BLOODSTONE") == 1)
        {
            if (GetLocalInt(OBJECT_SELF, "N_DO_ONCE") == 0)
            {
                object oDoor = GetNearestObjectByTag("PLAC_S0_KARAS_DOOR");

                SetLocked(oDoor, TRUE);

                AssignCommand(oDoor, ActionCloseDoor(oDoor));

                object oWP = GetNearestObjectByTag("WP_CT_UNIQ_KS_KRSP");

                location lWP = GetLocation(oWP);

                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_GATE), lWP);

                object oCreature = CreateObject(OBJECT_TYPE_CREATURE, "CT_UNIQ_KS_KRSP", lWP);

                AssignCommand(oCreature, DetermineCombatRound(oPC));

                object oKara = GetNearestObjectByTag("HENCH_KARA");

                SceneSpeak(oKara, "So you thought I would simply let you walk out of here with my Bloodstone?!  I believe you shall come to regret that decision...");

                SetLocalInt(OBJECT_SELF, "N_DO_ONCE", 1);
            }
        }
    }
}
