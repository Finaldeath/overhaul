//::///////////////////////////////////////////////
//:: Stiletto Cell OnFail
//:: q2c24b_failstil
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Starts a conversation with Stiletto
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    object oPris = GetNearestObjectByTag("q2_stiletto");

    AssignCommand(oPC,ClearAllActions(TRUE));
    AssignCommand(oPris,ActionStartConversation(oPC));
}
