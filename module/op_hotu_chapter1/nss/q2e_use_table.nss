//::///////////////////////////////////////////////
//:: Name: q2e_use_table
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When the Alchemist's table is used - start its
    dialog with the PC that used it...
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    AssignCommand(OBJECT_SELF, ActionStartConversation(GetLastUsedBy()));
}
