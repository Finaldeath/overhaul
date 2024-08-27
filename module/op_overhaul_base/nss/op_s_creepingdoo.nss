//::///////////////////////////////////////////////
//:: Creeping Doom
//:: op_s_creepingdoo
//:://////////////////////////////////////////////
/*
    The caster summons a mass of biting and stinging insects which causes 1d6
    points of nonmagical piercing damage to all creatures in the area.

    For every subsequent round, the damage inflicted is increased by an
    increment of 1d6 (ie. 1d6 for the first round, 2d6 for the second, and so
    on). The spell deals damage until its duration expires or it deals 1,000
    points of damage.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"
#include "utl_i_timer"

// Tracks up to 1000 damage done
const string DAMAGE_DONE = "DAMAGE_DONE";

void main()
{
    if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_ENTER)
    {
        if (!AOECheck()) return;

        int nAmountDamageDone = GetLocalInt(OBJECT_SELF, DAMAGE_DONE);

        if (nAmountDamageDone < 1000 && GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
        {
            SignalSpellCastAt();

            ApplyAOEPersistentEffect(oTarget, EffectMovementSpeedDecrease(GetStaticValue(50)));

            if (GetTimerEnded(ObjectToString(oTarget)))
            {
                SetTimer(ObjectToString(oTarget), 5);

                int nCounter = GetLocalInt(OBJECT_SELF, ObjectToString(oTarget)) + 1;
                SetLocalInt(OBJECT_SELF, ObjectToString(oTarget), nCounter);

                int nDamage = GetDiceRoll(nCounter, 6);

                if (nAmountDamageDone + nDamage > 1000) nDamage = 1000 - nAmountDamageDone;

                nAmountDamageDone += nDamage;
                SetLocalInt(OBJECT_SELF, DAMAGE_DONE, nAmountDamageDone);

                if (nDamage > 0) ApplyDamageToObject(oTarget, nDamage, DAMAGE_TYPE_PIERCING);

                // While this is the "correct" way the sheer amount of log spam, and that it's a level 7 spell,
                // means we do the ramping damage Bioware implemented as a subsitute for doing it all in one
                // go as per the original 3E spell. It'll get around some higher DR but it's not too bad.
                /*
                if (nDamage > 0)
                {
                    int nCount;
                    for (nCount = 1; nCount <= nDamage; nCount++)
                    {
                        ApplyDamageToObject(oTarget, 1, DAMAGE_TYPE_PIERCING);
                    }
                }
                */
            }
        }
        if (nAmountDamageDone >= 1000) DestroyObject(OBJECT_SELF);
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_EXIT)
    {
        RemovePersistentAOEEffects(oTarget);
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_HEARTBEAT)
    {
        if (!AOECheck()) return;

        int nAmountDamageDone = GetLocalInt(OBJECT_SELF, DAMAGE_DONE);

        if (nAmountDamageDone < 1000)
        {
            json jArray = GetArrayOfAOETargets(SPELL_TARGET_STANDARDHOSTILE);
            int nIndex;
            for (nIndex = 0; nIndex < JsonGetLength(jArray) && nAmountDamageDone < 1000; nIndex++)
            {
                oTarget = GetArrayObject(jArray, nIndex);

                if (GetTimerEnded(ObjectToString(oTarget)))
                {
                    SetTimer(ObjectToString(oTarget), 5);
                    SignalSpellCastAt();

                    float fDelay = GetRandomDelay(1.1, 2.2);

                    int nCounter = GetLocalInt(OBJECT_SELF, ObjectToString(oTarget)) + 1;
                    SetLocalInt(OBJECT_SELF, ObjectToString(oTarget), nCounter);

                    int nDamage = GetDiceRoll(nCounter, 6);

                    if (nAmountDamageDone + nDamage > 1000) nDamage = 1000 - nAmountDamageDone;

                    nAmountDamageDone += nDamage;
                    SetLocalInt(OBJECT_SELF, DAMAGE_DONE, nAmountDamageDone);

                    if (nDamage > 0) AssignCommand(oCaster, DelayCommand(fDelay, ApplyDamageToObject(oTarget, nDamage, DAMAGE_TYPE_PIERCING)));

                    // While this is the "correct" way the sheer amount of log spam, and that it's a level 7 spell,
                    // means we do the ramping damage Bioware implemented as a subsitute for doing it all in one
                    // go as per the original 3E spell. It'll get around some higher DR but it's not too bad.
                    /*
                    if (nDamage > 0)
                    {
                        int nCount;
                        for (nCount = 1; nCount <= nDamage; nCount++)
                        {
                            ApplyDamageToObject(oTarget, 1, DAMAGE_TYPE_PIERCING);
                        }
                    }
                    */
                }
            }
        }

        if (nAmountDamageDone >= 1000) DestroyObject(OBJECT_SELF);
    }
    else
    {
        if (DoSpellHook()) return;

        effect eAOE = EffectAreaOfEffect(AOE_PER_CREEPING_DOOM, GetScriptName(), GetScriptName(), GetScriptName());
        ApplySpellEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, lTarget, GetDuration(nCasterLevel, ROUNDS, TRUE, FALSE));
    }
}

