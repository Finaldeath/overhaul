//::///////////////////////////////////////////////
//:: Witchwork: Start Conversation (Doo OnOpen)
//:: WW_OpenConv.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Modified WW_StartConv that works on a door's
     OnOpen event.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 19, 2004
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetLastOpenedBy();
    ActionStartConversation(oPC);
}
