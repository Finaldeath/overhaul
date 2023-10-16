//::///////////////////////////////////////////////
//:: M3Q4HC_LOCKGATE
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Locks the gate if Klauth is hostile
    Opens it if Klauth is dead.
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    April 22, 2002
//:://////////////////////////////////////////////

void main()
{
    object oKlauth = GetNearestObjectByTag("M3Q04H07KLAUSGK");
    object oPC = GetEnteringObject();
    object oGate = GetNearestObjectByTag("M3Q04H06Dispel");
    if (GetIsEnemy(oKlauth,oPC))
    {
        ActionCloseDoor(oGate);
//        ActionLockObject(oGate);
        SetLocked(oGate,TRUE);
    }
    if(GetIsDead(oKlauth))
    {
        SetLocked(oGate,FALSE);
        ActionOpenDoor(oGate);
    }
}
