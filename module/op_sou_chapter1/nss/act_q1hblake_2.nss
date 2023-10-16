//::///////////////////////////////////////////////
//:: Name act_q1hblake_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Cast Cure Minor Wounds on Walther
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 12/03
//:://////////////////////////////////////////////

void main()
{
    object oBlake = GetObjectByTag("q1hblake");
    object oPC = GetPCSpeaker();
    ActionPauseConversation();

    effect eEffect = GetFirstEffect(oBlake);
    DelayCommand(2.0, RemoveEffect(oBlake, eEffect));
    AssignCommand(oPC, ActionCastSpellAtObject(SPELL_CURE_MINOR_WOUNDS, oBlake));
    AdjustAlignment(oPC, ALIGNMENT_GOOD, 1);
    DelayCommand(4.0, ActionResumeConversation());

    SetLocalInt(oBlake, "nCured", 1);
}
