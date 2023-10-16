//::///////////////////////////////////////////////
//:: Name: q2e_use_glowped
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When the birdbath is used, one of several things can happen:
1-2 : nothing happens
3 - 4 : 'Enervation' is cast on the player with a visual effect
5 : a hostile devil is summoned (this can happen three times only)
6 : a hostile large devil is summoned (this can happen once only)

*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Jan 15/03
//:://////////////////////////////////////////////
#include "NW_I0_SPELLS"
void main()
{
    object oPC = GetLastUsedBy();
    int nRandom = d6(1);
    if (nRandom == 1 || nRandom == 2)
    {
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), GetLocation(OBJECT_SELF));
    }
    else if (nRandom == 3 || nRandom == 4)
    {
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), GetLocation(OBJECT_SELF));

        AssignCommand(OBJECT_SELF, ActionCastFakeSpellAtObject(SPELL_ENERVATION, oPC));
        effect eVis = EffectVisualEffect(VFX_IMP_REDUCE_ABILITY_SCORE);
        object oTarget = oPC;
        int nDrain = d4();
        int nDuration = 12;
        effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE);
        effect eDrain = EffectNegativeLevel(nDrain);
        effect eLink = EffectLinkEffects(eDrain, eDur);


        SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELL_ENERVATION));
        //Resist magic check
        if(!MyResistSpell(OBJECT_SELF, oTarget))
        {
            if(!MySavingThrow(SAVING_THROW_FORT, oTarget, GetSpellSaveDC(), SAVING_THROW_TYPE_NEGATIVE))
            {
                //Apply the VFX impact and effects
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, HoursToSeconds(nDuration));
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
            }
        }
    }
    else if (nRandom == 5)
    {
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), GetLocation(OBJECT_SELF));

        if (GetLocalInt(OBJECT_SELF, "nDevil") < 3)
        {
            location lTarget = GetLocation(GetWaypointByTag("q2e_arcane_spn"));
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_3), lTarget);
            CreateObject(OBJECT_TYPE_CREATURE, "nw_devil001", lTarget);
            SetLocalInt(OBJECT_SELF, "nDevil", GetLocalInt(OBJECT_SELF, "nDevil") + 1);
        }
    }
    else if (nRandom == 6)
    {
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), GetLocation(OBJECT_SELF));

        if (GetLocalInt(OBJECT_SELF, "nPitFiend") != 1)
        {
            location lTarget = GetLocation(GetWaypointByTag("q2e_arcane_spn"));
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_GATE), lTarget);
            CreateObject(OBJECT_TYPE_CREATURE, "x2_pitfiend001", lTarget);
            SetLocalInt(OBJECT_SELF, "nPitFiend", 1);
        }
    }
}
