//::///////////////////////////////////////////////
//:: PC Leads Away Gelani
//:: act_gel_assassin
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Gelani and the PC go outside
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

void main()
{
    object oWay = GetObjectByTag("q2_way_gelassa");
    object oPC = GetFirstPC();
    object oThad = GetObjectByTag("q2_thaddeus");

    SetLocalInt(GetModule(), "OS_KILLGELANI",15);
    AssignCommand(oPC,ActionJumpToObject(oWay));
    ActionJumpToObject(oWay);
}
