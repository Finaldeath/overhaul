//testdust

//::///////////////////////////////////////////////
//:: Name q5_tymo_amulet
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On Use for the Power that the dragon gives
    you to use on J'Nah.
    Cause her damage/pain and slowness when used
    on her.
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Mar 28/03
//:://////////////////////////////////////////////
#include "nw_i0_generic"
void main()
{
    // Get the activator
    object oPC = GetItemActivator();

    // Get the powder
    object oRing = GetItemActivated();

    object oJnah = GetItemActivatedTarget();

    if (GetTag(oJnah) == "Q3_JNAH")
    {
        AssignCommand(oJnah, ClearAllActions(TRUE));
        AssignCommand(oJnah, ActionPlayAnimation(ANIMATION_LOOPING_SPASM, 2.0, 2.0));
        effect eSlow = EffectSlow();
        effect eDamage = EffectDamage(20);
        effect eLink = EffectLinkEffects(eSlow, eDamage);
        effect eFirst = EffectCutsceneParalyze();
        effect eVis = EffectVisualEffect(VFX_IMP_CHARM);
        effect eVis2 = EffectVisualEffect(VFX_IMP_BLIND_DEAF_M);
        effect eVis3 = EffectVisualEffect(VFX_IMP_DEATH_WARD);

        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eFirst, oJnah, 4.0);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oJnah);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink, oJnah);
        DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis2, oJnah));
        DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis2, oJnah));
        DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oJnah));
        DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis3, oJnah));
        DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oJnah));
        DelayCommand(1.5, AssignCommand(oJnah, SpeakStringByStrRef(40423)));
        SetIsTemporaryEnemy(oPC, oJnah);
        AssignCommand(oJnah, DetermineCombatRound(oPC));
    }

}
