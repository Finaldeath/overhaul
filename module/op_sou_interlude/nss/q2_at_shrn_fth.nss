//::///////////////////////////////////////////////
//:: Shrine action taken on faithful prayer
//:: q2_at_shrn_fth
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Player chooses to pray faithfully at the shrine. Result may vary depending on the following:
    - Alignment good/neutral: Fully healed + Evil hit of +5.
    - Alignment evil: Fully healed

    NOTICE: if a player have pretended to pray faithfully or dishonored the shrine - nothing will happen
*/
//:://////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On: 26/3/2003
//:://////////////////////////////////////////////


void FakeRestore(object oTarget);

void ShrineRestore(object oPC)
{
    int nGoodUse = GetLocalInt(oPC, "Q2_SHRINE_GOOD_USE");
    if(nGoodUse == 1)
    {
        FloatingTextStrRefOnCreature(40510, oPC);
        return;
    }
    if(GetAlignmentGoodEvil(oPC) != ALIGNMENT_EVIL)
        AdjustAlignment(oPC, ALIGNMENT_EVIL, 5);

    object oHenchman = GetAssociate(ASSOCIATE_TYPE_HENCHMAN,oPC);
    object oAnimal = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION,oPC);
    object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR,oPC);
    object oDominated = GetAssociate(ASSOCIATE_TYPE_DOMINATED,oPC);
    object oSummoned = GetAssociate(ASSOCIATE_TYPE_SUMMONED,oPC);

    ActionPauseConversation();
    ActionCastFakeSpellAtObject(SPELL_GREATER_RESTORATION, OBJECT_SELF);
    ActionDoCommand(FakeRestore(oPC));
    if(GetIsObjectValid(oHenchman))
    {
        ActionDoCommand(FakeRestore(oHenchman));
    }
    if(GetIsObjectValid(oAnimal))
    {
        ActionDoCommand(FakeRestore(oAnimal));
    }
    if(GetIsObjectValid(oFamiliar))
    {
        ActionDoCommand(FakeRestore(oFamiliar));
    }
    if(GetIsObjectValid(oDominated))
    {
        ActionDoCommand(FakeRestore(oDominated));
    }
    if(GetIsObjectValid(oSummoned))
    {
        ActionDoCommand(FakeRestore(oSummoned));
    }
    ActionResumeConversation();

}

void main()
{
    object oPC = GetPCSpeaker();
    ActionPauseConversation();
    AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP, 0.7, 5.0));
    ActionResumeConversation();
    DelayCommand(4.0, ShrineRestore(oPC));
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
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisual, oTarget);
}
