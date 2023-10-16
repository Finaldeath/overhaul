//::///////////////////////////////////////////////
//:: Name q2a_death_unit
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Battle Units on Death Script
    If the leader of a formation dies - elect a new
    leader
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 11/03
//:://////////////////////////////////////////////
#include "q2_inc_battle"
void main()
{
    if (GetLocalInt(OBJECT_SELF, "nLeader") == 1)
    {
        int nFormNumber = GetLocalInt(OBJECT_SELF, "nFormation");
        Formation_ElectNewLeader(nFormNumber);
    }

    ExecuteScript("nw_c2_default7", OBJECT_SELF);
}
