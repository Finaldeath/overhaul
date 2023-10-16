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
    object oKobold = GetObjectByTag("q1h2_kblake");
    object oPC = GetPCSpeaker();
    ActionPauseConversation();
    AssignCommand(oPC, ActionPauseConversation());
    //Spell Animation
    AssignCommand(oPC, ActionCastFakeSpellAtObject(SPELL_CHARM_PERSON, oKobold));

    DecrementRemainingSpellUses(oPC, SPELL_CHARM_PERSON);

    DelayCommand(4.0, ActionResumeConversation());
    DelayCommand(4.0, AssignCommand(oPC, ActionPauseConversation()));

}

