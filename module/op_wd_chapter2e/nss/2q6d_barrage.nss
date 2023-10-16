//::///////////////////////////////////////////////
//:: Fire Barrage
//:: 2q6d_barrage
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Starts the catapults firing.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: March 19, 2002
//:://////////////////////////////////////////////

#include "nw_i0_hostincl"
void main()
{
    SetLocalInt(GetArea(GetEnteringObject()), "NW_2Q6D_FIRE_BARRAGE", 10);
    DestroyObject(OBJECT_SELF, 1.0);
}
