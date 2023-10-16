//Decrement the PCs Charm Person spell count for the day
//cast fake charm at deekin
void main()
{
    object oDeekin = GetObjectByTag("q6deekin");
    object oPC = GetPCSpeaker();
    ActionPauseConversation();
    AssignCommand(oPC, ActionPauseConversation());
    //Spell Animation
    AssignCommand(oPC, ActionCastFakeSpellAtObject(SPELL_CHARM_PERSON, oDeekin));

    DecrementRemainingSpellUses(oPC, SPELL_CHARM_PERSON);
    DelayCommand(5.0, ActionResumeConversation());
}
