//::///////////////////////////////////////////////
//:: Name: q2c_trig_strap3
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Template for Special Trap.
    Pass in the SPELL_ constant you wish the trap
    to cast when triggered.
    Give the Trigger the same name as the placeable
    for the trap -
*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On:Nov 14/02
//:://////////////////////////////////////////////

#include "x2_inc_traps"

void main()
{
    DoSpecialTrap(SPELL_MELFS_ACID_ARROW);
}
