//::///////////////////////////////////////////////
//:: Placeable OnUsed Start Conversation
//:: qall_onused_conv
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The placeable object starts a conversation with the player
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////
//:: Modified By: Keith K2 Hayward
//:: Modified On: April 2004
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetLastUsedBy();

    // Start the conversation
    AssignCommand(oPC,ClearAllActions(TRUE));
    DelayCommand(0.5,ActionStartConversation(oPC));
}
