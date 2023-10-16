//::///////////////////////////////////////////////
//:: M3Q4A_UTHGARDT_D
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Changes the number of uthgardt in the module
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    April 23, 2002
//:://////////////////////////////////////////////

#include "nw_i0_plot"

void main()
{
    if (GetUserDefinedEventNumber() == 1007)
    {
        int nDead = GetLocalInt(GetModule(),"NW_G_M3Q4A_UTHGARDTDEAD");
        nDead = nDead + 1;
        SetLocalInt(GetModule(),"NW_G_M3Q4A_UTHGARDTDEAD",nDead);
    }
}
