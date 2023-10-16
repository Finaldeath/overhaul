//::///////////////////////////////////////////////
//:: Prisoner Leaves
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:  Brent
//:: Created On:  December, 2001
//:://////////////////////////////////////////////
#include "nw_i0_generic"
#include "nw_i0_plot"

void main()
{
    if(!GetIsInCombat())
    {
        SetSpawnInCondition(NW_FLAG_ESCAPE_LEAVE);
        ActivateFleeToExit();
    }
}

