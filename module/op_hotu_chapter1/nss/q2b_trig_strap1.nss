//::///////////////////////////////////////////////
//:: Name: q2b_trig_strap1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Template for Special Trap.
    Pass in the SPELL_ constant you wish the trap
    to cast when triggered.
*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On:Nov 14/02
//:://////////////////////////////////////////////

#include "x2_inc_traps"

void main()
{
    DoSpecialTrap(SPELL_LIGHTNING_BOLT);
}
