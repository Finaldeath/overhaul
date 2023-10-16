#include "NW_I0_GENERIC"

void main()
{
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    object oWaypoint1 = GetObjectByTag("WP_WyvernAnimal_01");
    object oWaypoint2 = GetObjectByTag("WP_WyvernAnimal_02");

    location lWaypoint1 = GetLocation(oWaypoint1);
    location lWaypoint2 = GetLocation(oWaypoint2);

    SetLocalInt(OBJECT_SELF,"M2Q1WyvernDialogue",2);
    SetLocalInt(OBJECT_SELF,"M2Q1WyvernAmbush",2);
    // ***************
    // Patch 2
    // * Setting him hostile to nearest player not GetPCSpeaker() since GetPCSpeaker()
    // * is possibly invalid in a one liner action script       \
     AdjustReputation(oPC, OBJECT_SELF, -100);
     SetIsTemporaryEnemy(oPC);
    // ***************
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_1),lWaypoint1);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_1),lWaypoint2);
    CreateObject(OBJECT_TYPE_CREATURE,"M2Q02CWYVBEAR",lWaypoint1);
    CreateObject(OBJECT_TYPE_CREATURE,"M2Q02CWYVWOLF",lWaypoint2);
    DetermineCombatRound();
}
