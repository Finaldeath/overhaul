//Decrement the PCs Scare spell count for the day
//act_q1dkobold_6
void main()
{
    object oShaman = GetObjectByTag("q1dk_shaman");
    object oPC = GetPCSpeaker();
    AssignCommand(oPC, ActionPauseConversation());
    //Spell Animation
    AssignCommand(oPC, ActionCastFakeSpellAtObject(SPELL_SCARE, oShaman));

    DecrementRemainingSpellUses(oPC, SPELL_SCARE);
    DelayCommand(4.0, AssignCommand(oPC, ActionResumeConversation()));
}
