void main()
{
    ActionPauseConversation();
    ActionCastFakeSpellAtObject(SPELL_DOMINATE_PERSON,GetPCSpeaker());
    ActionResumeConversation();
}
