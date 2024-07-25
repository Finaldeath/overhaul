//::///////////////////////////////////////////////
//:: Touch Attacks
//:: op_s_touchattack
//:://////////////////////////////////////////////
/*
    Touch Attack spells. Rays, touches, etc. Some are quite complicated but the
    common factor of a touch attack helps.

    Ice Dagger
    You create a piece of ice that flies toward the target and on a successful
    touch attack deals 1d4 points of cold damage per level (maximum of 5d4).
    Regardless ofif it hits, it does an additional 1 cold damage in a small
    area around the target.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    int nTouchAttackType = TOUCH_NONE;
    int nBonusToHit = 0;
    // Saving throw and immunity?
    int nSavingThrow = SAVING_THROW_NONE, nSavingThrowType = SAVING_THROW_TYPE_NONE;
    int nImmunity = IMMUNITY_TYPE_NONE;

    // Damage > 0 gets it saved
    int nDamageType, nDamage = 0;

    // Effect to apply if target is hit.
    int bApplyEffect = FALSE;
    effect eLink;
    int nVis;

    switch (nSpellId)
    {
        case SPELL_ICE_DAGGER:
        {
            nTouchAttackType = TOUCH_RANGED;
            nDamage = GetDiceRoll(min(5, nCasterLevel), 4);
            nDamageType = DAMAGE_TYPE_COLD;
            nVis = VFX_IMP_FROST_S;
            // TODO: Maybe a beam visual attack or MIRV here

            // Regardless of hit or miss we do 1 cold damage in the area of effect
            json jArray = GetArrayOfTargets(SPELL_TARGET_STANDARDHOSTILE, SORT_METHOD_DISTANCE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_PLACEABLE | OBJECT_TYPE_DOOR);
            int nIndex;
            for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
            {
                object oAOETarget = GetArrayObject(jArray, nIndex);

                float fDelay = GetDistanceBetweenLocations(GetLocation(oTarget), lTarget) / 20.0;

                if (oAOETarget == oTarget)
                {
                    // No need for more signal event or VFX
                    DelayCommand(fDelay, ApplyDamageToObject(oAOETarget, 1, DAMAGE_TYPE_COLD));
                }
                else
                {
                    SignalSpellCastAt(oAOETarget);
                    DelayCommand(fDelay, ApplyDamageWithVFXToObject(oAOETarget, nVis, 1, DAMAGE_TYPE_COLD));
                }
            }
        }
        break;
        default:
            Debug("[op_s_touchattack] No valid spell ID passed in: " + IntToString(nSpellId));
            return;
            break;
    }



    if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
    {
        SignalSpellCastAt();

        int nTouch = DoTouchAttack(oTarget, oCaster, nTouchAttackType);

        if (nTouch)
        {
            if (!DoResistSpell(oTarget, oCaster))
            {
                if (!GetIsImmuneWithFeedback(oTarget, oCaster, nImmunity))
                {
                    int bSaved = DoSavingThrow(oTarget, oCaster, nSavingThrow, nSpellSaveDC, nSavingThrowType);

                    if (nDamage > 0)
                    {
                        nDamage = GetDamageBasedOnFeats(nDamage, oTarget, bSaved);
                        if (nDamage > 0)
                        {
                            ApplyDamageWithVFXToObject(oTarget, nVis, nDamage, nDamageType);
                        }
                    }
                    if (bApplyEffect && !bSaved)
                    {

                    }
                }
            }
        }
    }
}

