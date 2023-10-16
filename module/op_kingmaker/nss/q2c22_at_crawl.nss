//::///////////////////////////////////////////////
//:: Trap door that takes you to a waypoint that
//:: is stored into the Destination local string.
//:: q2c22_at_crawl
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the destination for the secret door
*/
//:://////////////////////////////////////////////
//:: Created By: Robert Babiak
//:: Created On: June 25, 2002
//:://////////////////////////////////////////////
#include "os_include"
void main()
{
    //Get the PC and any possible associates
    if (!GetLocked(OBJECT_SELF) )
    {
        if ( GetIsOpen(OBJECT_SELF))
        {
            string sDest = GetLocalString( OBJECT_SELF, "Destination" );

            object oPC = GetLastUsedBy();
            object oDest = GetObjectByTag(sDest);
            os_MoveParty(oDest,oPC);
            PlayAnimation(ANIMATION_PLACEABLE_CLOSE );
        } else
        {
            PlayAnimation(ANIMATION_PLACEABLE_OPEN );
        }
    } else
    {
    //    ActionUseSkill
    }

}

