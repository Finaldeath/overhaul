// Custom AI for Sabal at the throne room fight.

#include "nw_i0_generic"

// if returns TRUE than should use the healing pillar
int PartyIsWounded();

// if returns TRUE than should use the dispelling pillar
int EnemyIsBuffed();

// returns the closest pillar that can be used
int GetClosestNonActivePillar();

// moves to the pillar and activates it's power with the shard
void UseShardOnPillar(int nPillar);

// returns TRUE if nPillar can be used
int GetPillarIsNonActive(int nPillar);

void DebugString(string sStr);

object GetPillar(int nPillar);


void main()
{
    object oIntruder = GetLocalObject(OBJECT_SELF,"X2_NW_I0_GENERIC_INTRUDER");
    if (GetIsObjectValid(oIntruder) == FALSE)
        oIntruder = bkAcquireTarget();

    // buffing
    if(GetLocalInt(OBJECT_SELF, "FINAL_FIGHT_BUFF") == 0)
    {
        SetLocalInt(OBJECT_SELF, "FINAL_FIGHT_BUFF", 1);
        ActionCastSpellAtObject(SPELL_REGENERATE, OBJECT_SELF, METAMAGIC_NONE, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
        ActionCastSpellAtObject(SPELL_BATTLETIDE, OBJECT_SELF, METAMAGIC_NONE, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
        ActionCastSpellAtObject(SPELL_DIVINE_FAVOR, OBJECT_SELF, METAMAGIC_NONE, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
        ActionCastSpellAtObject(SPELL_ENDURANCE, OBJECT_SELF, METAMAGIC_NONE, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
        ActionCastSpellAtObject(SPELL_DIVINE_POWER, OBJECT_SELF, METAMAGIC_NONE, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
    }

    int nAvoidPillar = GetLocalInt(OBJECT_SELF, "AVOID_PILLAR");
    if(nAvoidPillar == 1)
    {
        ActionAttack(oIntruder);
        return;
    }
    SetLocalInt(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT_OK", TRUE);
    int nUses = GetLocalInt(OBJECT_SELF, "SHARDS_USES");
    /*int nRand = Random(100) + 1;
    if(GetLocalInt(OBJECT_SELF, "USED_SHARD_ONCE") == 0)
    {
        SetLocalInt(OBJECT_SELF, "USED_SHARD_ONCE", 1);
        nRand = 0;
    }*/

    if(nUses > 0/* && nRand <= 50*/) // chance of using the shards after the first time
    {
        // Highhest priority: use the shards. Getting the number of shards uses left:
        if(GetPillarIsNonActive(5))
        {
            DebugString("BOOM: Trying to use pillar 5");
            ClearAllActions();
            ActionMoveToObject(GetPillar(5), TRUE, 5.0);
            ActionDoCommand(UseShardOnPillar(5));
            ActionDoCommand(DetermineCombatRound());
            return;
        }
        else if(PartyIsWounded() && GetPillarIsNonActive(1))
        {
            DebugString("BOOM: Trying to use pillar 1");
            ClearAllActions();
            ActionMoveToObject(GetPillar(1), TRUE, 5.0);
            ActionDoCommand(UseShardOnPillar(1));
            ActionDoCommand(DetermineCombatRound());
            return;
        }
        else if(EnemyIsBuffed() && GetPillarIsNonActive(2))
        {
            DebugString("BOOM: Trying to use pillar 2");
            ClearAllActions();
            ActionMoveToObject(GetPillar(2), TRUE, 5.0);
            ActionDoCommand(UseShardOnPillar(2));
            ActionDoCommand(DetermineCombatRound());
            return;
        }
        else if(GetPillarIsNonActive(4))
        {
            DebugString("BOOM: Trying to use pillar 4");
            ClearAllActions();
            ActionMoveToObject(GetPillar(4), TRUE, 5.0);
            ActionDoCommand(UseShardOnPillar(4));
            ActionDoCommand(SetLocalInt(OBJECT_SELF, "AVOID_PILLAR", 1));
            ActionDoCommand(DelayCommand(18.0, SetLocalInt(OBJECT_SELF, "AVOID_PILLAR", 0)));
            ActionAttack(oIntruder);
            ActionAttack(oIntruder);
            ActionAttack(oIntruder);
            return;
        }
        else if(GetPillarIsNonActive(3))
        {
            DebugString("BOOM: Trying to use pillar 3");
            ClearAllActions();
            ActionMoveToObject(GetPillar(3), TRUE, 5.0);
            ActionDoCommand(UseShardOnPillar(3));
            ActionDoCommand(DetermineCombatRound());
            return;
        }
        else if(GetPillarIsNonActive(6))
        {
            DebugString("BOOM: Trying to use pillar 6");
            ClearAllActions();
            ActionMoveToObject(GetPillar(6), TRUE, 5.0);
            ActionDoCommand(UseShardOnPillar(6));
            ActionDoCommand(DetermineCombatRound());
            return;
        }
    }
    DebugString("BOOM: Can't use shards");


    if(GetIsObjectValid(oIntruder))
    {
        if(TalentPersistentAbilities())
        {
            return;
        }
        if (chooseTactics(oIntruder) == 99)
        {
            return;
        }

        object oNearEnemy = GetNearestSeenEnemy();
        DetermineCombatRound(oNearEnemy);

        return;
    }

    ClearActions(CLEAR_NW_I0_GENERIC_658);
    SetLocalObject(OBJECT_SELF,
                   "NW_GENERIC_LAST_ATTACK_TARGET",
                   OBJECT_INVALID);

}

void DebugString(string sStr)
{
    //SendMessageToPC(GetFirstPC(), sStr);
}

void UseShardOnPillar(int nPillar)
{
    // Assuming that Sabal is already near the pillar,
    // So just checking one last time that the pillar is active
    if(GetClosestNonActivePillar() != nPillar)
        return;
    int nUses = GetLocalInt(OBJECT_SELF, "SHARDS_USES");
    //DebugString("BOOM: Using shard on pillar: " + IntToString(nPillar) + " current uses left= " + IntToString(nUses));
    nUses--;
    object oPillar = GetObjectByTag("q6f2_Pillar" + IntToString(nPillar));
    SetLocalInt(OBJECT_SELF, "SHARDS_USES", nUses);
    SetLocalObject(GetArea(OBJECT_SELF), "CURRENT_SHARD_USER", OBJECT_SELF);
    SetLocalObject(GetArea(OBJECT_SELF), "CURRENT_SHARD_TARGET", oPillar);
    ExecuteScript("q6_shard", OBJECT_SELF);
}

int GetClosestNonActivePillar()
{
    int i = 1;
    object oObject = GetNearestObject(OBJECT_TYPE_PLACEABLE, OBJECT_SELF, i);
    string sTag;
    while(oObject != OBJECT_INVALID)
    {
        sTag = GetTag(oObject);
        // if this is a pillar and he is not active right not
        if(GetStringLeft(sTag, 11) == "q6f2_Pillar" &&
            GetLocalInt(oObject, "ACTIVE") == 0)
        {
            return StringToInt(GetStringRight(sTag, 1));
        }
        i++;
        oObject = GetNearestObject(OBJECT_TYPE_PLACEABLE, OBJECT_SELF, i);
    }
    return 0;
}

int GetPillarIsNonActive(int nPillar)
{
    object oPillar = GetObjectByTag("q6f2_Pillar" + IntToString(nPillar));
    return GetLocalInt(oPillar, "ACTIVE") == 0;
}

object GetPillar(int nPillar)
{
    return GetObjectByTag("q6f2_Pillar" + IntToString(nPillar));
}

int PartyIsWounded()
{
    // would return TRUE if Sabal is below THRESHOLD or at least 2 followers of her are below THRESHOLD
    float THRESHOLD = 0.6;
    int nCurrent = GetCurrentHitPoints(OBJECT_SELF);
    int nMax = GetMaxHitPoints(OBJECT_SELF);
    if(IntToFloat(nCurrent) / IntToFloat(nMax) <= THRESHOLD)
        return TRUE;
    int nWoundCount;
    int i = 1;
    object oCreature = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_FRIEND, OBJECT_SELF, i);
    while(oCreature != OBJECT_INVALID)
    {
        nCurrent = GetCurrentHitPoints(OBJECT_SELF);
        nMax = GetMaxHitPoints(OBJECT_SELF);
        if(IntToFloat(nCurrent) / IntToFloat(nMax) <= THRESHOLD)
        {
            nWoundCount++;
            if(nWoundCount == 2)
                return TRUE;
        }
        i++;
        oCreature = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_FRIEND, OBJECT_SELF, i);
    }
    return FALSE;
}

int EnemyIsBuffed()
{
    // returns TRUE if at least one enemy has one of the certain buffs spells
    int nBuffCount;
    int i = 1;
    object oCreature = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, i);
    while(oCreature != OBJECT_INVALID)
    {
       if(GetHasSpellEffect(SPELL_AURA_OF_VITALITY, oCreature) ||
          GetHasSpellEffect(SPELL_BULLS_STRENGTH, oCreature) ||
          GetHasSpellEffect(SPELL_DEATH_ARMOR, oCreature) ||
          GetHasSpellEffect(SPELL_DIVINE_FAVOR, oCreature) ||
          GetHasSpellEffect(SPELL_DIVINE_MIGHT, oCreature) ||
          GetHasSpellEffect(SPELL_DIVINE_POWER, oCreature) ||
          GetHasSpellEffect(SPELL_DIVINE_SHIELD, oCreature) ||
          GetHasSpellEffect(SPELL_ELEMENTAL_SHIELD, oCreature) ||
          GetHasSpellEffect(SPELL_ENDURE_ELEMENTS, oCreature) ||
          GetHasSpellEffect(SPELL_ENERGY_BUFFER, oCreature) ||
          GetHasSpellEffect(SPELL_ETHEREAL_VISAGE, oCreature) ||
          GetHasSpellEffect(SPELL_ETHEREALNESS, oCreature) ||
          GetHasSpellEffect(SPELL_FREEDOM_OF_MOVEMENT, oCreature) ||
          GetHasSpellEffect(SPELL_GLOBE_OF_INVULNERABILITY, oCreature) ||
          GetHasSpellEffect(SPELL_GREATER_SPELL_MANTLE, oCreature) ||
          GetHasSpellEffect(SPELL_GREATER_STONESKIN, oCreature) ||
          GetHasSpellEffect(SPELL_HASTE, oCreature) ||
          GetHasSpellEffect(SPELL_IMPROVED_INVISIBILITY, oCreature) ||
          GetHasSpellEffect(SPELL_MAGIC_VESTMENT, oCreature) ||
          GetHasSpellEffect(SPELL_MASS_HASTE, oCreature) ||
          GetHasSpellEffect(SPELL_MESTILS_ACID_SHEATH, oCreature) ||
          GetHasSpellEffect(SPELL_MONSTROUS_REGENERATION, oCreature) ||
          GetHasSpellEffect(SPELL_PREMONITION, oCreature) ||
          GetHasSpellEffect(SPELL_PROTECTION_FROM_SPELLS, oCreature) ||
          GetHasSpellEffect(SPELL_REGENERATE, oCreature) ||
          GetHasSpellEffect(SPELL_SHAPECHANGE, oCreature) ||
          GetHasSpellEffect(SPELL_SHIELD_OF_FAITH, oCreature) ||
          GetHasSpellEffect(SPELL_SHIELD_OF_LAW, oCreature) ||
          GetHasSpellEffect(SPELL_SPELL_MANTLE, oCreature) ||
          GetHasSpellEffect(SPELL_TENSERS_TRANSFORMATION, oCreature) ||
          GetHasSpellEffect(SPELL_UNHOLY_AURA, oCreature) ||
          GetHasSpellEffect(SPELL_STONESKIN, oCreature))
          {
            return TRUE;
          }
       i++;
       oCreature = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, i);
    }
    return FALSE;
}
