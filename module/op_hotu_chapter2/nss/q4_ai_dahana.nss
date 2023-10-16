// Dahana's custom AI

#include "nw_i0_generic"

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
    - First - use barbarian rage
    - If wounded - then use talent heal on self (potions)
    - 20% of using called shot
    - 20% of using knockdown
    - 20% of using power attack
    - 20% of using improved power attack
    - 20% of normal attack
    */

    if(GetLocalInt(OBJECT_SELF, "USED_RAGE") == 0)
    {
        ClearAllActions();
        bkEquipMelee();
        ActionCastSpellAtObject(SPELLABILITY_BARBARIAN_RAGE, OBJECT_SELF, METAMAGIC_NONE, TRUE, 0,
             PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
        //ActionUseFeat(FEAT_BARBARIAN_RAGE, OBJECT_SELF);
        SetLocalInt(OBJECT_SELF, "USED_RAGE", 1);
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

    // if the enemy is a fighter type then most likely (60%) use called shot or knockdown
    if(nRand <= 60)
    {
        if(nRand <= 40)
        {
             ActionUseFeat(FEAT_CALLED_SHOT, oIntruder);
             __TurnCombatRoundOn(FALSE);
             return;
        }
        else if(nRand <= 60)
        {
            ActionUseFeat(FEAT_IMPROVED_KNOCKDOWN, oIntruder);
            __TurnCombatRoundOn(FALSE);
             return;
        }
    }

    if(nRand <= 20) // called shot
    {
        ActionUseFeat(FEAT_CALLED_SHOT, oIntruder);
    }
    else if(nRand <= 40) // knockdown
    {
        ActionUseFeat(FEAT_IMPROVED_KNOCKDOWN, oIntruder);
    }
    else if(nRand <= 60) // power attack
    {
        ActionUseFeat(FEAT_POWER_ATTACK, oIntruder);
    }
    else if(nRand <= 80) // Improved power attack
    {
        ActionUseFeat(FEAT_IMPROVED_POWER_ATTACK, oIntruder);
    }
    else // normal attack
    {
        ActionAttack(oIntruder);
    }


    __TurnCombatRoundOn(FALSE);

}
