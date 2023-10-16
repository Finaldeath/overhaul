//::///////////////////////////////////////////////
//:: Check Intelligence Low, Have Lokar's Ring
//:: NW_D2_INTL
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check if the character has a low intelligence
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Sept 18, 2001
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"
#include "M3PLOTINCLUDE"

int StartingConditional()
{
 return CheckIntelligenceLow() && PlayerHasLokarsRing(GetPCSpeaker());
}

