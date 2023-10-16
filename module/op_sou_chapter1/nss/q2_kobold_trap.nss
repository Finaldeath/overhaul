//::///////////////////////////////////////////////
//:: kobolds trap trigger on-enter
//:: q2_kobold_trap
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     triggers the trap only if the pc has re-activated the trap in the conrol room
*/
//:://////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On: 3/2/2003
//:://////////////////////////////////////////////

#include "q2_inc_trap"

void main()
{
    object oPC = GetEnteringObject();
    if (GetIsDM(oPC) == FALSE)
        CheckTrap(oPC);
}

