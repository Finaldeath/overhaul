// Beholder mage default AI

#include "nw_i0_generic"
#include "x2_inc_switches"

int CastSpell(int nNum, object oIntruder)
{
    float fDelay = 2.0 + (nNum - 1) * 2.0;
    /*if(nNum == 3)
    {
        DelayCommand(fDelay + 2.0, SetLocalInt(OBJECT_SELF, "WAIT", 0));
    }
    else if(nNum == 1)
        SetLocalInt(OBJECT_SELF, "WAIT", 1);*/
    if(GetHasSpell(SPELL_ELEMENTAL_SHIELD))
    {
        DelayCommand(fDelay,
            ActionCastSpellAtObject(SPELL_ELEMENTAL_SHIELD, OBJECT_SELF, METAMAGIC_ANY, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
        return 0;
    }
    if(GetHasSpell(SPELL_MESTILS_ACID_SHEATH))
    {
        DelayCommand(fDelay,
            ActionCastSpellAtObject(SPELL_MESTILS_ACID_SHEATH, OBJECT_SELF, METAMAGIC_ANY, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
        return 0;
    }
    if(GetHasSpell(SPELL_RESIST_ELEMENTS))
    {
        DelayCommand(fDelay,
            ActionCastSpellAtObject(SPELL_RESIST_ELEMENTS, OBJECT_SELF, METAMAGIC_ANY, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
        return 0;
    }
    if(GetHasSpell(SPELL_DEATH_ARMOR))
    {
        DelayCommand(fDelay,
            ActionCastSpellAtObject(SPELL_DEATH_ARMOR, OBJECT_SELF, METAMAGIC_ANY, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
        return 0;
    }
    if(GetHasSpell(SPELL_MAGE_ARMOR))
    {
        DelayCommand(fDelay,
            ActionCastSpellAtObject(SPELL_MAGE_ARMOR, OBJECT_SELF, METAMAGIC_ANY, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
        return 0;
    }
    if(GetHasSpell(SPELL_FIREBRAND))
    {
        DelayCommand(fDelay,
            ActionCastSpellAtObject(SPELL_FIREBRAND, oIntruder, METAMAGIC_ANY, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
        return 0;
    }
    if(GetHasSpell(SPELL_BIGBYS_INTERPOSING_HAND))
    {
        DelayCommand(fDelay,
            ActionCastSpellAtObject(SPELL_BIGBYS_INTERPOSING_HAND, oIntruder, METAMAGIC_ANY, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
        return 0;
    }

    if(GetHasSpell(SPELL_BALL_LIGHTNING))
    {
        DelayCommand(fDelay,
            ActionCastSpellAtObject(SPELL_BALL_LIGHTNING, oIntruder, METAMAGIC_ANY, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
        return 0;
    }

    if(GetHasSpell(SPELL_SLOW))
    {
        DelayCommand(fDelay,
            ActionCastSpellAtObject(SPELL_SLOW, oIntruder, METAMAGIC_ANY, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
        return 0;
    }
    if(GetHasSpell(SPELL_DISPEL_MAGIC))
    {
        DelayCommand(fDelay,
            ActionCastSpellAtObject(SPELL_DISPEL_MAGIC, OBJECT_SELF, METAMAGIC_ANY, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
        return 0;
    }
    if(GetHasSpell(SPELL_ENERVATION))
    {
        DelayCommand(fDelay,
            ActionCastSpellAtObject(SPELL_ENERVATION, oIntruder, METAMAGIC_ANY, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
        return 0;
    }
    if(GetHasSpell(SPELL_ISAACS_LESSER_MISSILE_STORM))
    {
        DelayCommand(fDelay,
            ActionCastSpellAtObject(SPELL_ISAACS_LESSER_MISSILE_STORM, oIntruder, METAMAGIC_ANY, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
        return 0;
    }
    if(GetHasSpell(SPELL_ICE_STORM))
    {
        DelayCommand(fDelay,
            ActionCastSpellAtObject(SPELL_ICE_STORM, oIntruder, METAMAGIC_ANY, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
        return 0;
    }
    if(GetHasSpell(SPELL_LIGHTNING_BOLT))
    {
        DelayCommand(fDelay,
            ActionCastSpellAtObject(SPELL_LIGHTNING_BOLT, oIntruder, METAMAGIC_ANY, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
        return 0;
    }
    if(GetHasSpell(SPELL_FLAME_ARROW))
    {
        DelayCommand(fDelay,
            ActionCastSpellAtObject(SPELL_FLAME_ARROW, oIntruder, METAMAGIC_ANY, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
        return 0;
    }
    if(GetHasSpell(SPELL_MELFS_ACID_ARROW))
    {
        DelayCommand(fDelay,
            ActionCastSpellAtObject(SPELL_MELFS_ACID_ARROW, oIntruder, METAMAGIC_ANY, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
        return 0;
    }
    if(GetHasSpell(SPELL_MAGIC_MISSILE))
    {
        DelayCommand(fDelay,
            ActionCastSpellAtObject(SPELL_MAGIC_MISSILE, oIntruder, METAMAGIC_ANY, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
        return 0;
    }
    if(GetHasSpell(SPELL_ELEMENTAL_SHIELD))
    {
        DelayCommand(fDelay,
            ActionCastSpellAtObject(SPELL_ELEMENTAL_SHIELD, oIntruder, METAMAGIC_ANY, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
        return 0;
    }
    if(GetHasSpell(SPELL_NEGATIVE_ENERGY_RAY))
    {
        DelayCommand(fDelay,
            ActionCastSpellAtObject(SPELL_NEGATIVE_ENERGY_RAY, oIntruder, METAMAGIC_ANY, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
        return 0;
    }
    if(GetHasSpell(SPELL_ICE_DAGGER))
    {
        DelayCommand(fDelay,
            ActionCastSpellAtObject(SPELL_ICE_DAGGER, oIntruder, METAMAGIC_ANY, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
        return 0;
    }
    return -1;
}

void main()
{
    object oIntruder = GetLocalObject(OBJECT_SELF,"X2_NW_I0_GENERIC_INTRUDER");
    SetLocalInt(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT_OK", 1);

    if (GetIsObjectValid(GetAttemptedSpellTarget()) && GetCurrentAction(OBJECT_SELF) == ACTION_CASTSPELL)
       return;

    int nDiff = GetCombatDifficulty();
    SetLocalInt(OBJECT_SELF, "NW_L_COMBATDIFF", nDiff);

    if (GetIsObjectValid(oIntruder) == FALSE)
        oIntruder = bkAcquireTarget();

    int nRet;

    CastSpell(1, oIntruder);
    CastSpell(2, oIntruder);
    nRet = CastSpell(3, oIntruder);

    if(nRet == -1)
        SetCreatureOverrideAIScript(OBJECT_SELF, "x2_ai_behold");


}
