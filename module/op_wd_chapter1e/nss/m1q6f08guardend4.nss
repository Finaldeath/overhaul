void main()
{
    SetLocalInt(OBJECT_SELF,"NW_L_M1Q6F08GuardGiftGiven",TRUE);
    effect eLink = EffectLinkEffects(EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE),EffectVisualEffect(VFX_DUR_PROTECTION_GOOD_MAJOR));
    eLink = EffectLinkEffects(EffectTemporaryHitpoints(50),eLink);
    eLink = EffectLinkEffects(EffectAbilityIncrease(ABILITY_CHARISMA,4),eLink);
    eLink = EffectLinkEffects(EffectAbilityIncrease(ABILITY_CONSTITUTION,4),eLink);
    eLink = EffectLinkEffects(EffectAbilityIncrease(ABILITY_DEXTERITY,4),eLink);
    eLink = EffectLinkEffects(EffectAbilityIncrease(ABILITY_INTELLIGENCE,4),eLink);
    eLink = EffectLinkEffects(EffectAbilityIncrease(ABILITY_STRENGTH,4),eLink);
    eLink = EffectLinkEffects(EffectAbilityIncrease(ABILITY_WISDOM,4),eLink);
    ActionPauseConversation();
    ActionCastFakeSpellAtObject(SPELL_BULLS_STRENGTH,GetPCSpeaker());
    ActionDoCommand(ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eLink,GetPCSpeaker(),HoursToSeconds(6)));
    ActionResumeConversation();
}
