//::///////////////////////////////////////////////
//:: m2q3G Castle Guard Action Script #1
//:: m2q3G_GuardA1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The guard opens the gate, then wanders off to
    look for oil...
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Jan 31, 2002
//:://////////////////////////////////////////////

void main()
{
    object oGate = GetObjectByTag("m2q3G_CastleGate");

    SetLocked(oGate, FALSE);
    ActionOpenDoor(oGate);
    ActionRandomWalk();
}
