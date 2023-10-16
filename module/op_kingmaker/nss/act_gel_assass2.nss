//::///////////////////////////////////////////////
//:: PC Leads Away Gelani
//:: act_gel_assass2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Gelani and the PC go outside, with two guards
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

void main()
{
    object oWay = GetObjectByTag("q2_way_gelassa");
    object oPC = GetFirstPC();
    object oGuard1 = GetObjectByTag("q2_gelguard", 0);
    object oGuard2 = GetObjectByTag("q2_gelguard", 1);
    object oThad = GetObjectByTag("q2_thaddeus");

    SetLocalInt(GetModule(), "OS_KILLGELANI", 15);
    SetLocalInt(GetModule(), "OS_KILLGELANI_G", 10);

    AssignCommand(oGuard1,ActionJumpToObject(oWay));
    AssignCommand(oGuard2,ActionJumpToObject(oWay));
    AssignCommand(oPC,ActionJumpToObject(oWay));

    ActionJumpToObject(oWay);
}
