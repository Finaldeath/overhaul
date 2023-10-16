//::///////////////////////////////////////////////
//:: M3Q4HC_KLAUDEAD
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Unlocks and opens the door if Klauth is dead.
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    April 22, 2002
//:://////////////////////////////////////////////

void main()
{
    object oKlauth = GetNearestObjectByTag("M3Q04H07KLAUSGK");
    if(GetIsDead(oKlauth))
    {
        SetLocked(OBJECT_SELF,FALSE);
        ActionOpenDoor(OBJECT_SELF);
    }
}
