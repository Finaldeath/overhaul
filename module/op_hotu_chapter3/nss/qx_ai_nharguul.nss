// Nharguul's custom AI

#include "nw_i0_generic"

void MyCastSpell(int nSpell, object oTarget, int nMetaMagic=METAMAGIC_ANY, int bCheat=FALSE, int nDomainLevel=0, int nProjectilePathType=PROJECTILE_PATH_TYPE_DEFAULT, int bInstantSpell=FALSE);

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
    - Instant cast spell resistance and regenarate
    - Cast Aura of Hellfire
    - Cast Firestorm
    - Revert to default AI
    */

   if(GetLocalInt(OBJECT_SELF, "DO_INSTANT_ONCE") == 0)
   {
       SetLocalInt(OBJECT_SELF, "DO_INSTANT_ONCE", 1);
       ActionCastSpellAtObject(SPELL_SPELL_RESISTANCE, OBJECT_SELF, METAMAGIC_ANY, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
       ActionCastSpellAtObject(SPELL_REGENERATE, OBJECT_SELF, METAMAGIC_ANY, FALSE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
   }
   float fHP = IntToFloat(GetCurrentHitPoints()) / IntToFloat(GetMaxHitPoints());
   if(fHP < 0.5)
   {
       if(TalentHeal())
       {
            __TurnCombatRoundOn(FALSE);
            return;
       }
   }


   if(GetHasSpell(761))
   {
        MyCastSpell(761, OBJECT_SELF);
        __TurnCombatRoundOn(FALSE);
        return;
   }
   if(GetHasSpell(SPELL_FIRE_STORM))
   {
        MyCastSpell(SPELL_FIRE_STORM, OBJECT_SELF);
        __TurnCombatRoundOn(FALSE);
        return;
   }


   SetLocalInt(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT_OK", 0);
   __TurnCombatRoundOn(FALSE);
   DetermineCombatRound(oIntruder);

}

void MyCastSpell(int nSpell, object oTarget, int nMetaMagic=METAMAGIC_ANY, int bCheat=FALSE, int nDomainLevel=0, int nProjectilePathType=PROJECTILE_PATH_TYPE_DEFAULT, int bInstantSpell=FALSE)
{
    //SendMessageToPC(GetFirstPC(), "BOOM: Casting: " + GetStringByStrRef(StringToInt(Get2DAString("spells", "Name", nSpell))));
    ActionCastSpellAtObject(nSpell, oTarget, nMetaMagic, bCheat, nDomainLevel, nProjectilePathType, bInstantSpell);
}
