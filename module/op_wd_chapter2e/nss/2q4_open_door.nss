//::///////////////////////////////////////////////
//:: Open Doors
//:: 2q4_open_door
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Causes the zombie doors to open.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: March 28, 2002
//:://////////////////////////////////////////////

void main()
{
    ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
    object oDoor = GetNearestObjectByTag("2q4_Gate_01");
    object oDoor2 = GetNearestObjectByTag("2q4_Gate_02");

    if(GetIsObjectValid(oDoor) && GetIsObjectValid(oDoor2))
    {
        AssignCommand(oDoor, SetLocked(oDoor, FALSE));
        AssignCommand(oDoor, ActionOpenDoor(oDoor));
        AssignCommand(oDoor2, SetLocked(oDoor2, FALSE));
        AssignCommand(oDoor2, ActionOpenDoor(oDoor2));
    }
}
