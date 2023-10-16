//::///////////////////////////////////////////////
//:: q2_trg_nsthkeep
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
        object oWay = GetObjectByTag("NW_MAPNOTE009");
        os_MoveParty(oWay,oPC);
    }
}
