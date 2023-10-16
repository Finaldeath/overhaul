//::///////////////////////////////////////////////
//:: M3Q2C_BRUTE
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Signals to the Uthgardt brute to attack the door
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    May 2002
//:://////////////////////////////////////////////

void main()
{
    if(GetIsPC(GetEnteringObject()))
    {
        object oBrute = GetNearestObjectByTag("M3Q2C06DOORBREAKER");
        event evDoor = EventUserDefined(8642);
        SignalEvent(oBrute,evDoor);
    }
}
