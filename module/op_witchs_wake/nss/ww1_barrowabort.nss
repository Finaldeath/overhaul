//::///////////////////////////////////////////////
//:: Witchwork 1: Barrow Site Cinematic, Abort Conversation
//:: WW1_BarrowAbort.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     If the player aborts the Barrow Site
     Cinematic conversation, relaunch it.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 30, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();

    AssignCommand(oPC, ClearAllActions(TRUE));
    ActionStartConversation(oPC, "", TRUE);
}
