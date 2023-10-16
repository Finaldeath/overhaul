//::///////////////////////////////////////////////
//:: Door Lever Used
//:: q3d_doorleveruse
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The lever is used to open the door
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

void main()
{
    object oDoor = GetObjectByTag("q3d_at_q3c");
    ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
    SetLocked(oDoor,FALSE);
}
