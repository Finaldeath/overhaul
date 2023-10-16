//::///////////////////////////////////////////////
//:: Name act_haniah8
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Cast Charm on Haniah
   Decrement the PCs Charm Person spell count for the day
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 23/03
//:://////////////////////////////////////////////



void main()
{
    object oHaniah = GetObjectByTag("Haniah");
    ActionPauseConversation();
    //Spell Animation
    AssignCommand(GetPCSpeaker(), ActionCastFakeSpellAtObject(SPELL_CHARM_PERSON, oHaniah));

    DecrementRemainingSpellUses(GetPCSpeaker(), SPELL_CHARM_PERSON);
    DelayCommand(3.0, ActionResumeConversation());
}
