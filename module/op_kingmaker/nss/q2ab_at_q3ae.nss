//::///////////////////////////////////////////////
//:: Trap door that takes you to a waypoint that
//:: is stored into the Destination local string.
//:: q2ab_at_q3ae
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Moves the player and henchmen through the secret door
*/
//:://////////////////////////////////////////////
//:: Created By: Robert Babiak
//:: Created On: June 25, 2002
//:: Modified by Cori, August 2003
//:://////////////////////////////////////////////
#include "os_include"
void main()
{
    //Get the PC and any possible associates
    object oPC = GetLastUsedBy();

    if (!GetLocked(OBJECT_SELF) )
    {
        if ( GetIsOpen(OBJECT_SELF))
        {
//            oDest = GetObjectByTag(sDest);
            object oDest = GetObjectByTag("q2ab_way_q3ae");
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

