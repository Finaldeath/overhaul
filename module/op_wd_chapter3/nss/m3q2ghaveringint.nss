//::///////////////////////////////////////////////
//:: Check Intelligence Normal, Have Lokar's Ring
//:: NW_D2_INTN
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check if the character has a low normal
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Sept 18, 2001
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"
#include "M3PLOTINCLUDE"

int StartingConditional()
{
    return CheckIntelligenceNormal() && PlayerHasLokarsRing(GetPCSpeaker());
}

