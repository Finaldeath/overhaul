//::///////////////////////////////////////////////
//:: Witchwork: Start Conversation
//:: WW_StartConv.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Just a quick script to get placeables launch
     their conversation.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 10, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetLastUsedBy();
    AssignCommand(oPC, ClearAllActions(TRUE));
    ActionStartConversation(oPC);
}
