//::///////////////////////////////////////////////
//:: Name: x2_use_placeable
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Have placeable start its conversation file with
    whoever just used it.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Jan 16/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetLastUsedBy();
    object oBrit = GetObjectByTag("q2crakbrit");
    AssignCommand(oBrit, ActionMoveToObject(oPC, TRUE));
    AssignCommand(oPC, ClearAllActions(TRUE));
    ActionStartConversation(oPC);
}
