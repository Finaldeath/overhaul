//::///////////////////////////////////////////////
//:: M4FollowPC3.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Follow the PC if I can see the PC [personal
   follow not a rally cry
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
//       (CanSeePlayer() == TRUE) &&
       (GetLocalInt(OBJECT_SELF,"NW_G_M4Q01_RALLY") == 1)
       )
    {
        FollowPlayer(GetLocalObject(OBJECT_SELF,"NW_G_M4Q01_RALLY"));
    }
}
