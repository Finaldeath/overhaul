//::///////////////////////////////////////////////
//:: Check Intelligence Low
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

int StartingConditional()
{
    return CheckIntelligenceLow() &&
     GetLocalInt(OBJECT_SELF,"NW_L_M3Q04TALKHEALED") == 0
     && GetCanCastHealingSpells(GetPCSpeaker());;
    /////// && CHECK IF PC HAS HEALING SPELLS AVAILABLE

}

