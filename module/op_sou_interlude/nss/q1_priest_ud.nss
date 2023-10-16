//::///////////////////////////////////////////////
//:: Default: On User Defined
//:: NW_C2_DEFAULTD
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Determines the course of action to be taken
    on a user defined event.
*/
//:://////////////////////////////////////////////
//:: Created By: Don Moar
//:: Created On: April 28, 2002
//:://////////////////////////////////////////////

#include "nw_i0_generic"

void ShootBeam()
{
    object oAltar = GetNearestObjectByTag("Q1_BEAM_SOURCE");
    effect eBeam = EffectBeam(VFX_BEAM_ODD, OBJECT_SELF, BODY_NODE_CHEST);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBeam, oAltar, 2.0);
    object oAltar2 = GetObjectByTag("Q1_ALTAR");
    effect eVis = EffectVisualEffect(VFX_IMP_HARM);
    DelayCommand(0.2, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oAltar2));
}

void HealGhouls()
{
    int i = 1;
    object oAltar = GetNearestObjectByTag("Q1_BEAM_SOURCE");
    object oGhoul = GetNearestObjectByTag("Q1_GHOUL", oAltar, i);
    effect eBeam = EffectBeam(VFX_BEAM_ODD, oAltar, BODY_NODE_CHEST);
    object oPC;
    while(oGhoul != OBJECT_INVALID)
    {
        i++;
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBeam, oGhoul, 2.0);
        effect eRaise = EffectResurrection();
        effect eAttack = EffectAttackIncrease(3);
        effect eSpeed = EffectHaste();
        effect eHeal = EffectHeal(50);
        effect eVis = EffectVisualEffect(VFX_IMP_HEALING_X);
        effect eLink = EffectLinkEffects(eHeal, eVis);
        eLink = EffectLinkEffects(eLink, eRaise);
        eLink = EffectLinkEffects(eLink, eSpeed);
        eLink = EffectLinkEffects(eLink, eAttack);
        eLink = EffectLinkEffects(eLink, eHeal);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eLink, oGhoul);
        oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
        DelayCommand(2.0, AssignCommand(oGhoul, DetermineCombatRound(oPC)));
        oGhoul = GetNearestObjectByTag("Q1_GHOUL", oAltar, i);
    }
}

void main()
{
    // enter desired behaviour here
    int nEvent = GetUserDefinedEventNumber();
    if(nEvent == 1007) // death
    {
        // Heal all ghouls in the area if in the temple (and shoot beams to the altar)
        if(GetTag(GetArea(OBJECT_SELF)) != "q1_StingerCavesTemple")
            return;

        DelayCommand(0.5, ShootBeam());
        DelayCommand(3.0, HealGhouls());

    }
    else if(nEvent == EVENT_END_COMBAT_ROUND)
    {
        if(!GetIsInCombat())
            return;
        SpeakOneLinerConversation("q1_taunt", GetFirstPC());
    }
    return;

}
