//::///////////////////////////////////////////////
//:: Name : act_parley_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
//Parley will cast strength of bull on the PC who is talking to her
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Jan 30/03
//:://////////////////////////////////////////////

void main()
{
    ActionPauseConversation();
    ActionCastSpellAtObject(SPELL_GREATER_BULLS_STRENGTH, GetPCSpeaker(), METAMAGIC_ANY, TRUE);
    ActionResumeConversation();
}
