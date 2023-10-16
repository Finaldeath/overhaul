//::///////////////////////////////////////////////
//:: M3Q4DA_PRIS_7
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the pc a little evil if she kills the prisoner.
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    May 2002
//:://////////////////////////////////////////////

#include "nw_i0_plot"
void main()
{
    if(GetIsPC(GetLastKiller()))
    {
        AutoAlignE(DC_EASY, GetLastKiller());
    }
}
