//::///////////////////////////////////////////////
//:: Conversation
//:: m2Dispell
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: May 16, 2002
//:://////////////////////////////////////////////

void main()
{
    ActionPauseConversation();
    ActionCastSpellAtObject(SPELL_MORDENKAINENS_DISJUNCTION,GetPCSpeaker(),METAMAGIC_ANY,TRUE,0,PROJECTILE_PATH_TYPE_DEFAULT,TRUE);
    ActionWait(1.0);
    ActionResumeConversation();
}
