//::///////////////////////////////////////////////
//:: Slave Cage OnFail
//:: q3_fail_cage
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Starts a conversation with the slave
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    object oSlave = GetNearestObjectByTag("q3_hslave");
    AssignCommand(oPC,ClearAllActions(TRUE));
    DelayCommand(0.5,AssignCommand(oSlave,ActionStartConversation(oPC)));
}
