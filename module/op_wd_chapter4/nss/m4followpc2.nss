//::///////////////////////////////////////////////
//:: M4FollowPC.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Follow the PC if I can see the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: January 2002
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"
#include "M4PLOTINCLUDE"
void main()
{
    if (
       (CanSeePlayer() == TRUE) &&
       (GetLocalInt(GetModule(),"NW_G_M4Q01_RALLY2") == 1)
       )
    {
        FollowPlayer();
    }
}
