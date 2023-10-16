//::///////////////////////////////////////////////
//:: Portal Check
//:: 2Q6_PORTALCHK_04
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check if the character can go to the specified
    level.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 21, 2002
//:://////////////////////////////////////////////

#include "NW_I0_HOSTINCL"
int StartingConditional()
{
    return HOST_PortalValid(4);
}
