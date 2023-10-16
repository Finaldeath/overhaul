// Kel-Garas summons a few skeleton warriors and attacks

#include "nw_i0_generic"

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

void main()
{
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_SUMMON_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_SUMMON_ONCE", 1);

    object oPlayer = GetFirstPC();
    while(oPlayer != OBJECT_INVALID)
    {
        AdjustReputation(OBJECT_SELF, oPlayer, -100);
        AdjustReputation(oPlayer, OBJECT_SELF, -100);
        SetIsTemporaryEnemy(OBJECT_SELF, oPlayer);
        oPlayer = GetNextPC();
    }
    object oPC = GetPCSpeaker();
    DetermineCombatRound(oPC);
    // summon skeletons
    object oWP1 = GetNearestObjectByTag("Q2E_WP_SKELETON1");
    object oWP2 = GetNearestObjectByTag("Q2E_WP_SKELETON2");
    object oWP3 = GetNearestObjectByTag("Q2E_WP_SKELETON3");
    object oWP4 = GetNearestObjectByTag("Q2E_WP_SKELETON4");
    object oWP5 = GetNearestObjectByTag("Q2E_WP_SKELETON5");
    object oWP6 = GetNearestObjectByTag("Q2E_WP_SKELETON6");
    // 2 skeletons would be summoned for a single player, 4 would be summoned for a player with a
    // henchman or 2 or more players.

    int nSummonedNum = 2;
    if(GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC) != OBJECT_INVALID)
       nSummonedNum = 4;

    object oFirst = GetFirstPC();
    if(GetNextPC() != OBJECT_INVALID)
         nSummonedNum = 4;

    if(GetTag(GetArea(OBJECT_SELF)) == "q2c_Houseofthemorninglord")
    {
        Summon(oWP1, "skelwarr004");
        Summon(oWP2, "skelwarr004");
        // 2 extra for the temple (so it is 6 and not 4)
        Summon(oWP5);
        Summon(oWP6);
    }
    else
    {
        Summon(oWP1, "skelwarr003");
        Summon(oWP2, "skelwarr003");
    }
    if(nSummonedNum == 4)
    {
        Summon(oWP3);
        Summon(oWP4);
    }

    PlaySound("c_mummygrt_bat1");
    ClearAllActions();
    object oCaster1 = GetNearestObjectByTag("Q2C_CASTER1");
    object oCaster2 = GetNearestObjectByTag("Q2C_CASTER2");
    object oSpellWP1 = GetWaypointByTag("Q2C_WP_BLADES1");
    object oSpellWP2 = GetWaypointByTag("Q2C_WP_BLADES2");
    oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    ActionCastSpellAtObject(SPELLABILITY_AURA_FEAR, OBJECT_SELF, METAMAGIC_ANY, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
    ActionCastSpellAtObject(SPELL_GREATER_DISPELLING, oPC, METAMAGIC_ANY, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
    if(GetTag(GetArea(OBJECT_SELF)) == "q2c_Houseofthemorninglord")
    {
        // destroy "old" Ali and bedines
        object oOldAli = GetObjectByTag("Q2A_ALI");
        SetPlotFlag(oOldAli, FALSE);
        DestroyObject(oOldAli);
        object oArea = GetObjectByTag("q1_OasisoftheGreenPalm"); // the old oasis area
        object oCreature = GetFirstObjectInArea(oArea);
        while(oCreature != OBJECT_INVALID)
        {
            SetPlotFlag(oCreature, FALSE);
            if(GetTag(oCreature) == "Q2A_BEDINE2")
                DestroyObject(oCreature);
            oCreature = GetNextObjectInArea(oArea);
        }

        object oWP1 = GetWaypointByTag("Q3C_WP_ALI_SP");
        object oWP2 = GetWaypointByTag("Q3C_WP_ALI_WALKTO");
        object oAli = CreateObject(OBJECT_TYPE_CREATURE, "q2a_ali", GetLocation(oWP1));
        SetImmortal(oAli, TRUE);
        SetPlotFlag(oAli, FALSE);
        AdjustReputation(oPC, oAli, 50);
        AdjustReputation(oAli, oPC, 50);

        AssignCommand(oAli, JumpToObject(oWP1));
        DelayCommand(2.0, AssignCommand(oAli, ActionMoveToObject(oWP2, TRUE)));

        object oBedine1 = CreateObject(OBJECT_TYPE_CREATURE, "q2a_bedine", GetLocation(oWP1));
        SetPlotFlag(oBedine1, FALSE);
        DelayCommand(5.0, AssignCommand(oBedine1, ActionMoveToObject(oWP2, TRUE)));
        object oBedine2 = CreateObject(OBJECT_TYPE_CREATURE, "q2a_bedine", GetLocation(oWP1));
        DelayCommand(5.0, AssignCommand(oBedine2, ActionMoveToObject(oWP2, TRUE)));
        SetPlotFlag(oBedine2, FALSE);
        object oBedine3 = CreateObject(OBJECT_TYPE_CREATURE, "q2a_bedine", GetLocation(oWP1));
        DelayCommand(5.0, AssignCommand(oBedine3, ActionMoveToObject(oWP2, TRUE)));
        SetPlotFlag(oBedine3, FALSE);
        object oBedine4 = CreateObject(OBJECT_TYPE_CREATURE, "q2a_bedine", GetLocation(oWP1));
        DelayCommand(5.0, AssignCommand(oBedine4, ActionMoveToObject(oWP2, TRUE)));
        SetPlotFlag(oBedine4, FALSE);

        effect eAOE = EffectAreaOfEffect(AOE_PER_WALLBLADE, "q2c_s0_bladebara", "q2c_s0_bladebarc");
        ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, GetLocation(oSpellWP1), RoundsToSeconds(12));
        ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, GetLocation(oSpellWP2), RoundsToSeconds(12));

        //AssignCommand(oCaster1, ActionCastSpellAtLocation(SPELL_BLADE_BARRIER, GetLocation(oSpellWP1), METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
        //AssignCommand(oCaster2, ActionCastSpellAtLocation(SPELL_BLADE_BARRIER, GetLocation(oSpellWP2), METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
    }
    ActionCastSpellAtObject(SPELL_PRAYER, OBJECT_SELF);
    object oDoor1 = GetNearestObjectByTag("Q2E_TOMBDOOR1");
    object oDoor2 = GetNearestObjectByTag("Q2E_TOMBDOOR2");
    AssignCommand(oDoor1, ActionCloseDoor(oDoor1));
    AssignCommand(oDoor2, ActionCloseDoor(oDoor2));
    SetLocked(oDoor1, TRUE);
    SetLocked(oDoor2, TRUE);
}
