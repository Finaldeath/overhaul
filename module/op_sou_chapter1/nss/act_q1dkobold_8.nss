//Decrement the PCs Bane spell count for the day
//act_q1dkobold_8
void main()
{
    object oShaman = GetObjectByTag("q1dk_shaman");
    object oPC = GetPCSpeaker();
    AssignCommand(oPC, ActionPauseConversation());
    //Spell Animation
    AssignCommand(oPC, ActionCastFakeSpellAtObject(SPELL_BANE, oShaman));

    DecrementRemainingSpellUses(oPC, SPELL_BANE);
    DelayCommand(4.0, AssignCommand(oPC, ActionResumeConversation()));
}
