// the PC casts a fake Dominate spell on the nymph

void main()
{
    ActionPauseConversation();
    ActionWait(3.0);
    DecrementRemainingSpellUses(GetPCSpeaker(), SPELL_DOMINATE_PERSON);
    AssignCommand(GetPCSpeaker(), ClearAllActions());
    AssignCommand(GetPCSpeaker(), ActionCastFakeSpellAtObject(SPELL_DOMINATE_PERSON, OBJECT_SELF));
    ActionResumeConversation();
}
