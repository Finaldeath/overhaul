//::///////////////////////////////////////////////
//:: Trap door that takes you to a waypoint that
//:: is stored into the Destination local string.
//:: q2c19a_at_q2c19c
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
    object oPC = GetFirstPC();
    object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR,oPC);
    if(GetIsPossessedFamiliar(oFamiliar))
    {
        if (!GetLocked(OBJECT_SELF) )
        {
            if ( GetIsOpen(OBJECT_SELF))
            {
    //            oDest = GetObjectByTag(sDest);
                object oDest = GetObjectByTag("q2c19c_way_grate");
                os_MoveParty(oDest,oFamiliar);
                PlayAnimation(ANIMATION_PLACEABLE_CLOSE );
                ActionSpeakString("Grate Open");
            }
            else
            {
                ActionSpeakString("Grate Not Open");
                PlayAnimation(ANIMATION_PLACEABLE_OPEN );
            }
        }
        else
        {
            ActionSpeakString("Grate Locked");
        //    ActionUseSkill
        }
    }
    else
    {
        ActionSpeakString("That grate seems too small to be entered as you are.");
    }

}

