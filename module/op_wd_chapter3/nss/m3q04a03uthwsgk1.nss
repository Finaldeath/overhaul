//::///////////////////////////////////////////////
//:: Check Intelligence Normal
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

int StartingConditional()
{
    return CheckIntelligenceNormal() &&
     GetLocalInt(OBJECT_SELF,"NW_L_M3Q04TALKHEALED") == 0
     && GetCanCastHealingSpells(GetPCSpeaker());
    /////// && CHECK IF PLAYER CAN CAST HEALING SPELLS
}

