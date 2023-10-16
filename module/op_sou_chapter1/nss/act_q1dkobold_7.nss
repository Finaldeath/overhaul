//Decrement the PCs Charm Person spell count for the day
//act_q1dkobold_7
void main()
{
    object oShaman = GetObjectByTag("q1dk_shaman");
    object oPC = GetPCSpeaker();
    AssignCommand(oPC, ActionPauseConversation());
    //Spell Animation
    AssignCommand(oPC, ActionCastFakeSpellAtObject(SPELL_CHARM_PERSON, oShaman));

    DecrementRemainingSpellUses(oPC, SPELL_CHARM_PERSON);
    DelayCommand(3.0, AssignCommand(oPC, ActionResumeConversation()));
}
