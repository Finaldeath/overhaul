//::///////////////////////////////////////////////
//:: Library Temple Door (OnAreaTransitionClick)
//:: ATC_TempleDoor.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Launch the door's conversation.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 14, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetClickingObject();
    AssignCommand(oPC, ClearAllActions(TRUE));
    ActionStartConversation(oPC, "", TRUE, FALSE);
}
