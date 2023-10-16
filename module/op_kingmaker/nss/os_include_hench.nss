//::///////////////////////////////////////////////
//:: Henchmen Include File
//:: os_include_hench
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Include file for OddSquad Henchmen
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

//checks to see if Trip is in the player's party
int os_Hench_Trip();

//::///////////////////////////////////////////////
//:: os_Hench_Trip
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    checks to see if Trip is in the player's party
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

int os_Hench_Trip()
{
    object oModule = GetModule();
    if(GetLocalInt(oModule,"OS_HENCH_TRIP")==1)
    {
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}
