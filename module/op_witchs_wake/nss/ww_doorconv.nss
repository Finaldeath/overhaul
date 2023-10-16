//::///////////////////////////////////////////////
//:: Witchwork: Start Conversation (Door)
//:: WW_DoorConv.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Modified WW_StartConv that works on a door's
     OnFailToOpen event.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 10, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();
    AssignCommand(oPC, ClearAllActions(TRUE));
    ActionStartConversation(oPC);
}
