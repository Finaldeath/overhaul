//::///////////////////////////////////////////////
//:: q2_trg_keepgates
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Prevents the PC from going behind the keep door.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Dec 2003
//:://////////////////////////////////////////////

#include "os_include"
void main()
{
    object oPC = GetFirstPC();

    if(GetEnteringObject()== oPC)
    {
        object oWay = GetObjectByTag("q2_map_southkeep");
        os_MoveParty(oWay,oPC);
    }
}
