//::///////////////////////////////////////////////
//:: act_gem_kobold
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets that the PC has talked to the gem about the cows
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    SetLocalInt(oPC,"OS_GEM_COWS",10);
}