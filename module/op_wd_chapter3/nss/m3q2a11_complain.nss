//::///////////////////////////////////////////////
//:: M3Q2A11_COMPLAIN
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check if the character has normal intelligence
    and has heard the soldiers complaining.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori May
//:: Created On: April 2002
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

int StartingConditional()
{
    return CheckIntelligenceNormal() && GetLocalInt(GetPCSpeaker(),"NW_G_COMPLAIN")==1;
}
