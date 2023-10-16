#include "help_general"

void main()
{
    object oPC = GetPCSpeaker();

    object oGW = GetNearestObjectByTag("CT_UNIQ_HS_GOLD", oPC);

    // BUFF THE GOLDEN WARRIOR PROPERLY
    effect e;

    int i = GetLocalInt(oPC, "N_GW_DEFENSE_CHOICE");

    // MAGIC BUFF
    if (i != 1)
    {
        e = EffectSpellImmunity();

        ApplyEffectToObject(DURATION_TYPE_PERMANENT, e, oGW);
    }

    // SLOW PENALTY
    if (i == 2)
    {
        e = EffectSlow();

        ApplyEffectToObject(DURATION_TYPE_PERMANENT, e, oGW);
    }

    // DEFENSE PENALTY
    if (i == 3)
    {
        e = EffectACDecrease(3);

        ApplyEffectToObject(DURATION_TYPE_PERMANENT, e, oGW);
    }

    // OFFENSE PENALTY
    if (i == 4)
    {
        e = EffectAttackDecrease(3);

        ApplyEffectToObject(DURATION_TYPE_PERMANENT, e, oGW);
    }

    // END BUFF

    // JUMP PC TO STARTING POINT
    object oWP = GetWaypointByTag("WP_PC_GOLD_ARENA_ENT");

    location lWP = GetLocation(oWP);

    AssignCommand(oPC, JumpToLocation(lWP));

    // CREATE BEAMS
    object oBeam;

    effect eBeam;

    oBeam = GetNearestObjectByTag("PLAC_GW_GW_BEAM", oGW);

    eBeam = EffectBeam(VFX_BEAM_SILENT_HOLY, oBeam, BODY_NODE_CHEST);

    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eBeam, oGW);

    oBeam = GetNearestObjectByTag("PLAC_GW_PC_BEAM", oPC);

    eBeam = EffectBeam(VFX_BEAM_SILENT_HOLY, oBeam, BODY_NODE_CHEST);

    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eBeam, oPC);

    AssignCommand(oGW, DelayCommand(3.0, SceneSpeak(oGW, "You dare to threaten the Golden Warrior?!  You shall die for your foolishness!")));
}
