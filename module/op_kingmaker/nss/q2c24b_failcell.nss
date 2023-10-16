//::///////////////////////////////////////////////
//:: Cell OnFail
//:: q2c24b_failcell
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Starts a conversation with the prisoner
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    object oPris = GetNearestObjectByTag("q2c24b_prisoner");
    AssignCommand(oPC,ClearAllActions(TRUE));
    DelayCommand(0.5,AssignCommand(oPris,ActionStartConversation(oPC)));
}
