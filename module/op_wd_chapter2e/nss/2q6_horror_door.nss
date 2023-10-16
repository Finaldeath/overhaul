//::///////////////////////////////////////////////
//:: Default On Heartbeat
//:: 2q6_horror_door
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This will cause blocked creatures to open
    or smash down doors depending on int and
    str.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 23, 2001
//:://////////////////////////////////////////////

void main()
{
    object oDoor = GetBlockingDoor();
    DoDoorAction(oDoor, DOOR_ACTION_BASH);
}
