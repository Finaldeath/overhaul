//::///////////////////////////////////////////////
//:: M3Q3CA_DOORLOCK
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The door talks to the player if locked.
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    April 2002
//:://////////////////////////////////////////////

void main()
{
    ActionSpeakStringByStrRef(63802);
    // * patch fix: in case you are stuck behind the door you will be teleported to in front of the door
    AssignCommand(GetClickingObject(), JumpToObject(GetNearestObjectByTag("WP_Lowersnowglobe")));
}
