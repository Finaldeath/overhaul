//::///////////////////////////////////////////////
//:: Hellbreath Tavern Card Trick, Resume Conversation (Action Script)
//:: H2a_Card_Cause.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Resume the conversation so the card trick can
     continue. To be placed on the OnClose event
     of the Card Table where the player's just
     modified their ante.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 24, 2003
//:://////////////////////////////////////////////

void main()
{
    object oArden = GetObjectByTag("H2_ArdenSwift");
    AssignCommand(oArden, ActionResumeConversation());
}
