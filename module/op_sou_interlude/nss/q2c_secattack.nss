// second mummy attack

#include "nw_i0_generic"
#include "x1_inc_plot"

void Talk(object oPC)
{
`   BeginConversation("", oPC);
}

void CreateSkeleton(object oWP, string sTag)
{
    object oSkeleton = CreateObject(OBJECT_TYPE_CREATURE, sTag, GetLocation(oWP));
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    DelayCommand(0.5, AssignCommand(oSkeleton, DetermineCombatRound(oPC)));
}

void Summon(object oWP, string sTag = "skelwarr003")
{
    effect eSummon = EffectVisualEffect(VFX_FNF_SUMMON_UNDEAD);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eSummon, GetLocation(oWP));
    DelayCommand(0.3, CreateSkeleton(oWP, sTag));
}

void InitAttack(object oPC)
{
    object oWP1 = GetWaypointByTag("Q2C_WP_SKELETON1");
    object oWP2 = GetWaypointByTag("Q2C_WP_SKELETON2");
    object oWP3 = GetWaypointByTag("Q2C_WP_SKELETON3");
    object oWP4 = GetWaypointByTag("Q2C_WP_SKELETON4");
    object oWP = GetWaypointByTag("Q2C_WP_KELGARAS");
    // 2 skeletons would be summoned for a single player, 4 would be summoned for a player with a
    // henchman or 2 or more players.

    int nSummonedNum = 2;
    if(GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC) != OBJECT_INVALID)
       nSummonedNum = 4;

    object oFirst = GetFirstPC();
    if(GetNextPC() != OBJECT_INVALID)
         nSummonedNum = 4;

    Summon(oWP1, "skelwarr004");
    Summon(oWP2, "skelwarr004");
    if(nSummonedNum == 4)
    {
        Summon(oWP3);
        Summon(oWP4);
    }
    DelayCommand(4.0, Summon(oWP, "q2_kelgaras001"));
}

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;
    //if(GetItemPossessedBy(oPC, "q2_rod_blight") == OBJECT_INVALID)
    //    return;
    if(GetPlot("Q2_JOURNAL_ROD") < 10)
        return;

    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);
    object oWP = GetWaypointByTag("Q2C_WP_KELGARAS");

    SetLocalInt(GetModule(), "Q2_SECOND_MUMMY_FIGHT", 1);

    /*object oAltar = GetNearestObjectByTag("Q2C_ALTAR");
    vector vPos = GetPosition(oAltar);
    vPos.z += 2;
    location lLoc = Location(GetArea(OBJECT_SELF), vPos, 90.0);
    object oStone = CreateObject(OBJECT_TYPE_PLACEABLE, "q3c_stone_face", lLoc);
    effect eVis = EffectVisualEffect(VFX_FNF_IMPLOSION);
    DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oStone)));
    DelayCommand(1.5, AssignCommand(oStone, SpeakStringByStrRef(40506)));
    DelayCommand(4.0, DestroyObject(oStone));
    DelayCommand(2.0, InitAttack(oPC)); */


    effect eSummon = EffectVisualEffect(VFX_FNF_SUMMON_UNDEAD);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eSummon, GetLocation(oWP));
    object oMummy = CreateObject(OBJECT_TYPE_CREATURE, "q2_kelgaras001", GetLocation(oWP));
    AssignCommand(oPC, ClearAllActions(TRUE));
    DelayCommand(1.5, AssignCommand(oMummy, Talk(oPC)));

}
