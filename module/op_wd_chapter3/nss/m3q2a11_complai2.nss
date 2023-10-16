//::///////////////////////////////////////////////
//:: M3Q2A11_COMPLAI2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check if the character has low intelligence
    and has heard the soldiers complaining.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori May
//:: Created On: April 2002
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

int StartingConditional()
{
    return CheckIntelligenceLow() && GetLocalInt(GetPCSpeaker(),"NW_G_COMPLAIN")==1;
}
