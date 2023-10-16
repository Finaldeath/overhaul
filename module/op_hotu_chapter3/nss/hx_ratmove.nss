//::///////////////////////////////////////////////
//:: Name hx_ratmove
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will keep the rats away from the area
     the PC needs to use the pixie form. This will
     keep the integrity of the puzzle in tact.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: July 17, 2003
//:://////////////////////////////////////////////

void main()
{
    object oRat = GetObjectByTag("NW_RAT002");

    if(GetEnteringObject() == oRat)
    {
        AssignCommand(oRat, ActionMoveAwayFromLocation(GetLocation(OBJECT_SELF), FALSE, 5.0));
    }
}
