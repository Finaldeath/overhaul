//::///////////////////////////////////////////////
//:: x1_placeablecon
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  Has a conversation start with a placeable object
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Mar 5/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetLastUsedBy();
    AssignCommand(oPC, ClearAllActions(TRUE));
    ActionStartConversation(oPC);
}
