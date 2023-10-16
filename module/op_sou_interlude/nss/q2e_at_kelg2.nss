// Kel-Garas summons a few skeleton warriors and attacks

#include "nw_i0_generic"

void CreateSkeleton(object oWP)
{
    object oSkeleton = CreateObject(OBJECT_TYPE_CREATURE, "skelwarr003", GetLocation(oWP));
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    DelayCommand(0.5, AssignCommand(oSkeleton, ActionAttack(oPC)));
}

void Summon(object oWP)
{
    effect eSummon = EffectVisualEffect(VFX_FNF_SUMMON_UNDEAD);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eSummon, GetLocation(oWP));
    DelayCommand(0.3, CreateSkeleton(oWP));
}

void main()
{
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_SUMMON_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_SUMMON_ONCE", 1);

    object oPC = GetPCSpeaker();
    AdjustReputation(OBJECT_SELF, oPC, -100);
    AdjustReputation(oPC, OBJECT_SELF, -100);
    SetIsTemporaryEnemy(OBJECT_SELF, oPC);
    DetermineCombatRound(oPC);
    // summon skeletons
    object oWP1 = GetWaypointByTag("Q2E_WP_SKELETON1");
    object oWP2 = GetWaypointByTag("Q2E_WP_SKELETON2");
    object oWP3 = GetWaypointByTag("Q2E_WP_SKELETON3");
    object oWP4 = GetWaypointByTag("Q2E_WP_SKELETON4");
    // 2 skeletons would be summoned for a single player, 4 would be summoned for a player with a
    // henchman or 2 or more players.

    int nSummonedNum = 2;
    if(GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC) != OBJECT_INVALID)
       nSummonedNum = 4;

    object oFirst = GetFirstPC();
    if(GetNextPC() != OBJECT_INVALID)
         nSummonedNum = 4;

    Summon(oWP1);
    Summon(oWP2);
    if(nSummonedNum == 4)
    {
        Summon(oWP3);
        Summon(oWP4);
    }
}
