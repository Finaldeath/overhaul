//::///////////////////////////////////////////////
//:: act_dirt_kaidala
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Kaidala starts conversation with the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

void main()
{
    object oKai = GetObjectByTag("os_hen_kai");
    object oPC = GetFirstPC();
    AssignCommand(oKai,ActionJumpToObject(oPC));
    DelayCommand(0.5, AssignCommand(oPC,ClearAllActions(TRUE)));
    DelayCommand(0.6, AssignCommand(oKai,ActionStartConversation(oPC)));
}
