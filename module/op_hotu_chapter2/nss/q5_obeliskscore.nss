// Obelisk core:
// 100% spell failure in a huge radius and disable beholder rays AI (duration of a few rounds).

#include "x2_inc_switches"

void ApplyAntimagic(object oTarget)
{
    effect eVis = EffectVisualEffect(VFX_IMP_DISPEL);
    float fDur = RoundsToSeconds(3);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
    effect eFail = EffectSpellFailure(100);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eFail, oTarget, fDur);
    AssignCommand(oTarget, ClearAllActions());
    if(GetTag(oTarget) == "q5_BeholderMage")
    {
        SetCreatureOverrideAIScript(oTarget, "x2_ai_nomagic");
        DelayCommand(fDur, SetCreatureOverrideAIScript(oTarget, "x2_ai_beholdermg"));
    }
    else if(GetTag(oTarget) == "q5_beholder")
    {
        SetCreatureOverrideAIScript(oTarget, "x2_ai_nomagic");
        DelayCommand(fDur, SetCreatureOverrideAIScript(oTarget, "x2_ai_beholder"));
    }
    else if(GetTag(oTarget) == "q5_HiveMother")
    {
        SetCreatureOverrideAIScript(oTarget, "x2_ai_nomagic");
        DelayCommand(fDur, SetCreatureOverrideAIScript(oTarget, ""));
    }
}

void main()
{
    object oPC = GetItemActivator();
    AssignCommand(oPC, ActionCastFakeSpellAtObject(SPELLABILITY_PULSE_COLD, OBJECT_SELF));
    //effect eVis = EffectVisualEffect(VFX_IMP_PULSE_COLD);
    //ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);
    float fDelay;
    float fDistance;
    int i;
    object oTarget = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, OBJECT_SELF, i);
    while(GetIsObjectValid(oTarget))
    {
        fDistance = GetDistanceBetween(oPC, oTarget);
        fDelay = fDistance * 0.1;
        if(fDistance > 25.0)
            return;
        DelayCommand(fDelay, ApplyAntimagic(oTarget));
        i++;
        oTarget = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, OBJECT_SELF, i);
    }
}
