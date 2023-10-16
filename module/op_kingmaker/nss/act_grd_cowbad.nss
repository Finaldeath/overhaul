//::///////////////////////////////////////////////
//:: Close Cow
//:: act_grd_cowbad
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The Gord ends the cow quest
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

void main()
{
//give 500 gold, give xp, end quest, change journal
    object oPC = GetFirstPC();
    SetLocalInt(GetModule(), "OS_THEGORD_COWS",40);
    SetLocalInt(OBJECT_SELF,"OS_THEGORD_JOB",0);
}
