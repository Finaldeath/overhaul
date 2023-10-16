//::///////////////////////////////////////////////
//:: Name  q2b_hb_spectrap1
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On heartbeat - this trap will continue to cast
    Lightning bolt at anyone inside its parameter
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Nov 14/02
//:://////////////////////////////////////////////

#include "x2_inc_traps"

void main()
{
    if (GetAILevel() !=AI_LEVEL_VERY_LOW)
        DoSpecialTrapHB(SPELL_LIGHTNING_BOLT);
}
