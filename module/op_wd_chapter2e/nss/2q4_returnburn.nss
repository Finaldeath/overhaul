//::///////////////////////////////////////////////
//:: Return to the Burn
//:: 2q4_returnburn
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Makes the goblin book burners return to
    their pyro ways.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: April 23, 2002
//:://////////////////////////////////////////////
#include "nw_i0_2q4luskan"
void main()
{
    SetLocalObject(OBJECT_SELF, "2Q4_BOOK_TARGET", OBJECT_INVALID);
    SetLocalPlotIntOnCharacter(OBJECT_SELF, 0);

}
