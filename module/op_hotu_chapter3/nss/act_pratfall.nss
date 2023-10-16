//::///////////////////////////////////////////////
//:: Name act_pratfall
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This causes the Jester to take a fall and then
     get back up and resume conversation.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Oct 2002.
//:://////////////////////////////////////////////
void main()
{
    effect eKnock = EffectKnockdown();
    object oJester = (GetObjectByTag("q4c02fool"));
    ActionPauseConversation();
    ApplyEffectToObject(DURATION_TYPE_INSTANT,eKnock,oJester);
    ActionResumeConversation();
}
