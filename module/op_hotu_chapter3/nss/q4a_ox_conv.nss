//::///////////////////////////////////////////////
//:: Name q4a_ox_conv
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This script is placed on an invisible object
     to house a conversation that will allow the
     PCs to save the quest ox.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 6, 2003
//:://////////////////////////////////////////////

void main()
{
   object oObject = GetLastUsedBy();

   AssignCommand(oObject, ClearAllActions(TRUE));
   DelayCommand(0.2, ActionStartConversation(oObject));
}
