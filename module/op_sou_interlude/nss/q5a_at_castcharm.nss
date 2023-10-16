//::///////////////////////////////////////////////
//:: FileName:x0_d1_didchaotny
//:://////////////////////////////////////////////
/*
Use to adjust the PC's alignment to evil a tiny bit
*/
//:://////////////////////////////////////////////
//:: Created By: Naomi Novik
//:: Created On: /2002
//:://////////////////////////////////////////////

void main()
{
    AdjustAlignment(GetPCSpeaker(), ALIGNMENT_CHAOTIC, 1);
    int nSpell = GetLocalInt(GetPCSpeaker(), "Q5_CHARM_SPELL");
    SetLocalInt(GetPCSpeaker(), "Q5_CHARM_SPELL", 0);
    AssignCommand(GetPCSpeaker(), ActionPauseConversation());
    AssignCommand(GetPCSpeaker(), ActionCastFakeSpellAtObject(nSpell, OBJECT_SELF));
    DecrementRemainingSpellUses(GetPCSpeaker(), nSpell);
    DelayCommand(3.0, ActionResumeConversation());
}
