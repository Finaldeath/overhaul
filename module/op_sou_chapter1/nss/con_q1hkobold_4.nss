//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Cast Charm on Kobold
   Decrement the PCs Charm Person spell count for the day
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 23/03
//:://////////////////////////////////////////////



void main()
{
    object oKobold = GetObjectByTag("q1hkobold");
    object oPC = GetPCSpeaker();
    ActionPauseConversation();
    //Spell Animation
    AssignCommand(GetPCSpeaker(), ActionCastFakeSpellAtObject(SPELL_CHARM_PERSON, oKobold));
    AssignCommand(oPC, ActionCastSpellAtObject(SPELL_CHARM_PERSON, oKobold));
    //DecrementRemainingSpellUses(GetPCSpeaker(), SPELL_CHARM_PERSON);

    DelayCommand(4.0, ActionResumeConversation());

}

