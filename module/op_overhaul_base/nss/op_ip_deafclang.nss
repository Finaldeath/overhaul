//::///////////////////////////////////////////////
//:: Deafening Clang: On Hit
//:: op_ip_deafclang.nss
//:://////////////////////////////////////////////
/*
    You empower a melee weapon with a +1 attack bonus and a +3 sonic damage
    bonus. Also, the weapon gains the ability to deafen the creature that is
    struck like a thunderstone (DC 15 Fortitude save to avoid deafness, 5
    round duration) once per round.

    Note this is done as a level 0 spell so you can't just eliminate spell
    mantles quickly.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"
#include "utl_i_timer"

const string TIMER_DEAFENING_CLANG = "TIMER_DEAFENING_CLANG";

void main()
{
    // Cannot happen more than once every 6 seconds. Timer can be on us.
    if (GetTimerEnded(TIMER_DEAFENING_CLANG))
    {
        SetTimer(TIMER_DEAFENING_CLANG, 6);

        if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
        {
            // Cannot deafen what cannot hear, or if we're silenced we are not generating any noise either
            if (!GetCanHear(oTarget) || !GetHasEffect(oCaster, EFFECT_TYPE_SILENCE))
            {
                if (!GetIsImmuneWithFeedback(oTarget, oCaster, IMMUNITY_TYPE_DEAFNESS))
                {
                    if (!DoResistSpell(oTarget, oCaster))
                    {
                        nSpellSaveDC = nCasterLevel + 10;
                        if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_WILL, nSpellSaveDC, SAVING_THROW_TYPE_SONIC))
                        {
                            float fDuration = GetDuration(nCasterLevel, ROUNDS);
                            effect eDeaf    = EffectDeaf();
                            ApplyVisualEffectToObject(VFX_IMP_BLIND_DEAF_M, oTarget);
                            ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eDeaf, oTarget, fDuration);
                            FloatingTextStrRefOnCreature(STRREF_DEAFENED, oTarget, FALSE); // Deafened!
                        }
                    }
                }
            }
        }
    }
}
