
#include "nw_i0_generic"

// Sabal ambush AI (when ambushing the player near the palace)

void MyCastSpell(int nSpell, object oTarget, int nMetaMagic=METAMAGIC_ANY, int bCheat=FALSE, int nDomainLevel=0, int nProjectilePathType=PROJECTILE_PATH_TYPE_DEFAULT, int bInstantSpell=FALSE)
{
    string sName = GetStringByStrRef(StringToInt(Get2DAString("spells", "Name", nSpell)));
    ActionCastSpellAtObject(nSpell, oTarget, nMetaMagic, bCheat, nDomainLevel, nProjectilePathType, bInstantSpell);
}

void main()
{
    object oIntruder = GetLocalObject(OBJECT_SELF,"X2_NW_I0_GENERIC_INTRUDER");
    if (GetIsObjectValid(oIntruder) == FALSE)
        oIntruder = bkAcquireTarget();
    SetLocalInt(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT_OK", 1);
    object oWP = GetWaypointByTag("q6a_wp_elemental_sp");
    float fRange = GetDistanceBetween(OBJECT_SELF, oIntruder);
    int nCount = GetLocalInt(OBJECT_SELF, "Q6A_SPELL_COUNT");
    if(nCount >= 12)
    {
        SetLocalInt(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT_OK", 0);
        SetLocalString(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT", "");
        DetermineCombatRound(oIntruder);
        return;
    }
    nCount++;
    if(GetHasSpell(SPELL_SUMMON_CREATURE_IX))
    {
        MyCastSpell(SPELL_SUMMON_CREATURE_IX, oWP);
        SetLocalInt(OBJECT_SELF, "Q6A_SPELL_COUNT", nCount);
        return;
    }
    if(GetHasSpell(SPELL_STORM_OF_VENGEANCE))
    {
        MyCastSpell(SPELL_STORM_OF_VENGEANCE, oWP);
        SetLocalInt(OBJECT_SELF, "Q6A_SPELL_COUNT", nCount);
        return;
    }
    if(GetHasSpell(SPELL_FLAME_STRIKE) == 4) // has maximized
    {
        MyCastSpell(SPELL_FLAME_STRIKE, oIntruder, METAMAGIC_MAXIMIZE);
        SetLocalInt(OBJECT_SELF, "Q6A_SPELL_COUNT", nCount);
        return;
    }
    if(GetHasSpell(SPELL_WORD_OF_FAITH))
    {
        MyCastSpell(SPELL_WORD_OF_FAITH, oIntruder);
        SetLocalInt(OBJECT_SELF, "Q6A_SPELL_COUNT", nCount);
        return;
    }
    if(GetHasSpell(SPELL_HAMMER_OF_THE_GODS) == 5)
    {
        MyCastSpell(SPELL_HAMMER_OF_THE_GODS, oIntruder, METAMAGIC_MAXIMIZE);
        SetLocalInt(OBJECT_SELF, "Q6A_SPELL_COUNT", nCount);
        return;
    }
    if(GetHasSpell(SPELL_FLAME_STRIKE) == 3) // has empowered
    {
        MyCastSpell(SPELL_FLAME_STRIKE, oIntruder, METAMAGIC_EMPOWER);
        SetLocalInt(OBJECT_SELF, "Q6A_SPELL_COUNT", nCount);
        return;
    }
    if(GetHasSpell(SPELL_HAMMER_OF_THE_GODS) == 3 || GetHasSpell(SPELL_HAMMER_OF_THE_GODS) == 4)
    {
        MyCastSpell(SPELL_HAMMER_OF_THE_GODS, oIntruder, METAMAGIC_EMPOWER);
        SetLocalInt(OBJECT_SELF, "Q6A_SPELL_COUNT", nCount);
        return;
    }
    if(GetHasSpell(SPELL_SEARING_LIGHT))
    {
        MyCastSpell(SPELL_SEARING_LIGHT, oIntruder);
        SetLocalInt(OBJECT_SELF, "Q6A_SPELL_COUNT", nCount);
        return;
    }
    if(GetHasSpell(SPELL_FLAME_STRIKE))
    {
        MyCastSpell(SPELL_FLAME_STRIKE, oIntruder);
        SetLocalInt(OBJECT_SELF, "Q6A_SPELL_COUNT", nCount);
        return;
    }


    SetLocalInt(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT_OK", 0);
    SetLocalString(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT", "");
    DetermineCombatRound(oIntruder);



}
