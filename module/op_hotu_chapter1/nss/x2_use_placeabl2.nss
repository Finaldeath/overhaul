//::///////////////////////////////////////////////
//:: Name: x2_use_placeabl2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Have placeable start its conversation file with
    whoever just used it.
    //Clear Combat State//
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Jan 16/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetLastUsedBy();
    AssignCommand(oPC, ClearAllActions(TRUE));
    ActionStartConversation(oPC);
}
