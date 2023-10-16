// Cultist knight custom AI

#include "nw_i0_generic"

void main()
{
    object oIntruder = GetLocalObject(OBJECT_SELF,"X2_NW_I0_GENERIC_INTRUDER");
    SetLocalInt(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT_OK", 1);

    int nDiff = GetCombatDifficulty();
    SetLocalInt(OBJECT_SELF, "NW_L_COMBATDIFF", nDiff);

    if (GetIsObjectValid(oIntruder) == FALSE)
        oIntruder = bkAcquireTarget();

    // Each round (in order of priority)
    // 50% chance to use power word stun againt a weak enemy (less then 150)
    // 50% chance to use fireball against a group of enemies
    // 50% chance of using dispel magic
    // 50% chance of using an energy bolt

    int nRand = Random(100) + 1;
    float fDistance = GetDistanceBetween(OBJECT_SELF, oIntruder);
    // 50% chance of using fireball
    if(nRand >=1 && nRand <= 50)
    {
        object oEnemy = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, oIntruder);
        if(oEnemy != OBJECT_INVALID && fDistance > 15.0)
        {
            ActionCastSpellAtObject(SPELL_FIREBALL, oIntruder);
            ActionAttack(oIntruder);
            return;
        }
    }
    // 50% chance of using power word stun
    if(nRand >=1 && nRand <= 50)
    {
        if(GetCurrentHitPoints(oIntruder) < 150)
        {
            ActionCastSpellAtObject(SPELL_POWER_WORD_STUN, oIntruder);
            ActionAttack(oIntruder);
            return;
        }
    }
    // 50% chance of casting dispel magic
    if(nRand >= 1 && nRand <= 20)
    {
        if(fDistance >= 10.0)
        {
            ActionCastSpellAtObject(SPELL_DISPEL_MAGIC, oIntruder);
            ActionAttack(oIntruder);
            return;
        }
    }
    // 50% chance of using an energy bolt
    if(nRand >=1 && nRand <= 90)
    {
        float fDistance = GetDistanceBetween(OBJECT_SELF, oIntruder);
        if(fDistance >= 10.0)
        {
            ActionCastSpellAtObject(SPELLABILITY_BOLT_LEVEL_DRAIN, oIntruder, METAMAGIC_ANY, FALSE, 0,
                PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
            ActionAttack(oIntruder);
            return;
        }
    }


    ActionAttack(oIntruder);
    SetLocalInt(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT_OK", 0);

}
