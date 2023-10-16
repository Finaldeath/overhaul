//::///////////////////////////////////////////////
//:: Name: q2d4_use_door
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
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == TRUE)
    {
        ActionStartConversation(oPC);
        AssignCommand(oPC, ClearAllActions(TRUE));
    }
}
