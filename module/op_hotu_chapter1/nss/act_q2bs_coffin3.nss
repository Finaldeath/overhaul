//Create a zombie near the coffin if one has not been created before.
//act_q2bs_coffin3
#include "nw_i0_generic"
void main()
{
    //Don't spawn in a zombie if the coffin has spawned..

    if (GetLocalInt(OBJECT_SELF, "nZombieCreated") == 1)
        return;

    location lSpawn = GetLocation(GetWaypointByTag("wp_q2bs_zomcoffin_3"));
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_UNDEAD), lSpawn);
    object oZombie = CreateObject(OBJECT_TYPE_CREATURE, "x2_q2bs_zomlord", lSpawn);

    AssignCommand(oZombie, DetermineCombatRound());

    SetLocalInt(OBJECT_SELF, "nZombieCreated", 1);
}
