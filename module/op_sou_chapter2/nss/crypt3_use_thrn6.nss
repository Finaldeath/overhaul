//::///////////////////////////////////////////////
//:: Name  crypt3_use_thrn6
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On used - PC sits in throne - if someone is
    also sitting in the matching throne (crypt03_chair5),
    spawn in a Shadow Fiend (nw_shfiend) at the matching
    waypoint(wp_crypt3_throne56_spn).
    Heal PC sitting in chair of matching alignment - Harm other PCs
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: April 24/03
//:://////////////////////////////////////////////
#include "nw_i0_generic"
void FakeRestore(object oTarget);
void main()
{
    object oPC = GetLastUsedBy();
    object oChair = OBJECT_SELF;
    AssignCommand(oPC, ActionSit(oChair));
    AssignCommand(oPC, PlaySound("as_pl_crptvoice1"));
    //Only spawn in once
    if (GetLocalInt(OBJECT_SELF, "nSpawned") != 1)
    {
        object oChair5 = GetObjectByTag("crypt03_chair5");
        if (GetIsObjectValid(GetSittingCreature(oChair5)) == TRUE)
        {
            //Spawn in the monster
            SetLocalInt(OBJECT_SELF, "nSpawned", 1);
            SetLocalInt(oChair5, "nSpawned", 1);
            location lTarget = GetLocation(GetWaypointByTag("wp_crypt3_throne56_spn"));
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_UNDEAD), lTarget);
            object oShadow = CreateObject(OBJECT_TYPE_CREATURE, "nw_shfiend", lTarget, TRUE);
            AssignCommand(oShadow, DetermineCombatRound());
        }
        //if no one else is in the other chair - then heal any evil character who sits down and harm good characters
        else
        {
            //heal
            if (GetAlignmentGoodEvil(oPC) == ALIGNMENT_NEUTRAL || GetAlignmentLawChaos(oPC) == ALIGNMENT_NEUTRAL)
            {
                if (GetLocalInt(oPC, "X1_CryptBuff") != 1)
                {
                    SetLocalInt(oPC, "X1_CryptBuff", 1);
                    //heal
                    DelayCommand(2.0, FakeRestore(oPC));
                    //and buff

                    effect eBuff1 = EffectAbilityIncrease(ABILITY_STRENGTH, 3);
                    effect eBuff2 = EffectAbilityIncrease(ABILITY_INTELLIGENCE, 3);
                    effect eBuff = EffectLinkEffects(eBuff1, eBuff2);
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBuff, oPC, 300.0);
                    DelayCommand(300.0, SetLocalInt(oPC, "X1_CryptBuff", 0));
                }
            }
            //harm
            else
            {
                int nDamage = GetCurrentHitPoints(oPC) - d4(1);
                effect eBad1 = EffectVisualEffect(246);
                effect eDam = EffectDamage(nDamage,DAMAGE_TYPE_NEGATIVE);
                //Apply the VFX impact and effects
                DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oPC));
                DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eBad1, oPC));
            }
        }
    }
}
void FakeRestore(object oTarget)
{
    effect eVisual = EffectVisualEffect(VFX_IMP_RESTORATION_GREATER);

    effect eBad = GetFirstEffect(oTarget);
    //Search for negative effects
    while(GetIsEffectValid(eBad))
    {
        if (GetEffectType(eBad) == EFFECT_TYPE_ABILITY_DECREASE ||
            GetEffectType(eBad) == EFFECT_TYPE_AC_DECREASE ||
            GetEffectType(eBad) == EFFECT_TYPE_ATTACK_DECREASE ||
            GetEffectType(eBad) == EFFECT_TYPE_DAMAGE_DECREASE ||
            GetEffectType(eBad) == EFFECT_TYPE_DAMAGE_IMMUNITY_DECREASE ||
            GetEffectType(eBad) == EFFECT_TYPE_SAVING_THROW_DECREASE ||
            GetEffectType(eBad) == EFFECT_TYPE_SPELL_RESISTANCE_DECREASE ||
            GetEffectType(eBad) == EFFECT_TYPE_SKILL_DECREASE ||
            GetEffectType(eBad) == EFFECT_TYPE_BLINDNESS ||
            GetEffectType(eBad) == EFFECT_TYPE_DEAF ||
            GetEffectType(eBad) == EFFECT_TYPE_CURSE ||
            GetEffectType(eBad) == EFFECT_TYPE_DISEASE ||
            GetEffectType(eBad) == EFFECT_TYPE_POISON ||
            GetEffectType(eBad) == EFFECT_TYPE_PARALYZE ||
            GetEffectType(eBad) == EFFECT_TYPE_NEGATIVELEVEL)
        {
            //Remove effect if it is negative.
            RemoveEffect(oTarget, eBad);
        }
        eBad = GetNextEffect(oTarget);
    }
    if(GetRacialType(oTarget) != RACIAL_TYPE_UNDEAD)
    {
        //Apply the VFX impact and effects
        int nHeal = GetMaxHitPoints(oTarget) - GetCurrentHitPoints(oTarget);
        effect eHeal = EffectHeal(nHeal);
        if (nHeal > 0)
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, oTarget);
    }
    DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisual, oTarget));
}
