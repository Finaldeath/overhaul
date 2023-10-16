// Eldath's custom AI

#include "nw_i0_generic"

// return the number of face-to-face enemies
int GetNumEnemies()
{
    int i = 1;
    float fDistance;
    object oEnemy = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, i);
    while(oEnemy != OBJECT_INVALID)
    {
        fDistance = GetDistanceBetween(OBJECT_SELF, oEnemy);
        if(fDistance > 3.0)
            break;
        i++;
        oEnemy = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, i);
    }
    return (i - 1);
}

int GetIsToughEldath()
{
    return GetGameDifficulty() == GAME_DIFFICULTY_CORE_RULES ||
           GetGameDifficulty() == GAME_DIFFICULTY_DIFFICULT;
}

// returns TRUE if the enemy has 18 total levels of fighter, barbarian,
// ranger, paladin, dwarven def, weapon master or champion
int GetEnemyIsFighter(object oIntruder)
{
    int nFighter = GetLevelByClass(CLASS_TYPE_FIGHTER);
    int nBarb = GetLevelByClass(CLASS_TYPE_BARBARIAN);
    int nRanger = GetLevelByClass(CLASS_TYPE_RANGER);
    int nPaladin = GetLevelByClass(CLASS_TYPE_PALADIN);
    int nMaster = GetLevelByClass(CLASS_TYPE_WEAPON_MASTER);
    int nChampion = GetLevelByClass(CLASS_TYPE_DIVINECHAMPION);
    int nDef = GetLevelByClass(CLASS_TYPE_DWARVENDEFENDER);

    int nTotal = nFighter + nBarb + nRanger + nPaladin + nMaster + nMaster + nChampion + nDef;

    return (nTotal >= 18);

}

void main()
{
    object oIntruder = GetLocalObject(OBJECT_SELF, "X2_NW_I0_GENERIC_INTRUDER");

    SetLocalInt(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT_OK", 1);
    if (GetIsObjectValid(oIntruder) == FALSE)
        oIntruder = bkAcquireTarget();
    if (GetIsDead(oIntruder) == TRUE)
        return;

    if (__InCombatRound() == TRUE)
    {
        return;
    }

    __TurnCombatRoundOn(TRUE);

    /*
    - First - use battletide from the armor
    - If wounded - then use talent heal on self (potions)
    - 15% of using called shot
    - 15% of using disarm
    - 15% of using power attack
    - 15% of using improved power attack
    - 15% of using ki damage
    - 15% of using whirlwind
    - 10% of normal attack

    */
    if(GetLocalInt(OBJECT_SELF, "DID_WHIRLWIND") == 1)
    {
        DelayCommand(6.0, SetLocalInt(OBJECT_SELF, "DID_WHIRLWIND", 0));
        ClearAllActions();
    }


    if(GetLocalInt(OBJECT_SELF, "USED_BATTLETIDE") == 0)
    {
        ClearAllActions();
        ActionCastSpellAtObject(SPELL_BATTLETIDE, OBJECT_SELF, METAMAGIC_NONE, TRUE, 0,
            PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
        SetLocalInt(OBJECT_SELF, "USED_BATTLETIDE", 1);
        __TurnCombatRoundOn(FALSE);
        DetermineCombatRound(oIntruder);
        return;
    }
    float fHP = IntToFloat(GetCurrentHitPoints()) / IntToFloat(GetMaxHitPoints());
    if(fHP < 0.5)
    {
        if(TalentHealingSelf())
        {
            __TurnCombatRoundOn(FALSE);
            return;
        }
    }
    int nRand = Random(100) + 1;
    // Use whirlwind anyway (50%) if lots of enemies
    int nEnemies = GetNumEnemies();
    if(nRand <= 50 && nEnemies >= 3 && GetLocalInt(OBJECT_SELF, "DID_WHIRLWIND") == 0)
    {

        ClearAllActions();
        DoWhirlwindAttack();
        SetLocalInt(OBJECT_SELF, "DID_WHIRLWIND", 1);
        __TurnCombatRoundOn(FALSE);
        return;
    }
    // if the enemy is a fighter type then most likely (60%) use disarm, called shot or parry
    if(nRand <= 60 && GetIsToughEldath())
    {
        if(nRand <= 40)
        {
             ActionUseFeat(FEAT_CALLED_SHOT, oIntruder);
             __TurnCombatRoundOn(FALSE);
             return;
        }
        else if(nRand <= 60)
        {
            ActionUseFeat(FEAT_IMPROVED_DISARM, oIntruder);
            __TurnCombatRoundOn(FALSE);
             return;
        }
    }

    // Normal difficulty setting
    if(!GetIsToughEldath())
    {
        if(nRand <= 20 && GetNumEnemies() >= 2 && GetLocalInt(OBJECT_SELF, "DID_WHIRLWIND") == 0) // Whirlwind
        {
            ClearAllActions();
            DoWhirlwindAttack();
            SetLocalInt(OBJECT_SELF, "DID_WHIRLWIND", 1);
        }
        else if(nRand <= 50) // called shot
        {
            ActionUseFeat(FEAT_CALLED_SHOT, oIntruder);
        }

        else // normal attack
        {
            ActionAttack(oIntruder);
        }
        __TurnCombatRoundOn(FALSE);
        return;
    }

    // Hardcore+ setting
    if(nRand <= 15) // called shot
    {
        ActionUseFeat(FEAT_CALLED_SHOT, oIntruder);
    }
    else if(nRand <= 30) // improved disarm
    {
        ActionUseFeat(FEAT_IMPROVED_DISARM, oIntruder);
    }
    else if(nRand <= 45) // power attack
    {
        ActionUseFeat(FEAT_POWER_ATTACK, oIntruder);
    }
    else if(nRand <= 60) // Improved power attack
    {
        ActionUseFeat(FEAT_IMPROVED_POWER_ATTACK, oIntruder);
    }
    else if(nRand <= 75) // Ki damage
    {
        ActionUseFeat(FEAT_KI_DAMAGE, oIntruder);
    }
    else if(nRand <= 90 && GetNumEnemies() >= 2 && GetLocalInt(OBJECT_SELF, "DID_WHIRLWIND") == 0) // Whirlwind
    {
        ClearAllActions();
        DoWhirlwindAttack();
        SetLocalInt(OBJECT_SELF, "DID_WHIRLWIND", 1);
    }
    else // normal attack
    {
        ActionAttack(oIntruder);
    }


    __TurnCombatRoundOn(FALSE);

}
