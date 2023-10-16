//::///////////////////////////////////////////////
//:: Name q5_death_ballst1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On death of the Ballista - destroy the 2 associated
    triggers.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: May 5/03
//:://////////////////////////////////////////////

void main()
{
    object oTrig1 = GetNearestObjectByTag("Q5BoltTrap1", OBJECT_SELF, 1);
    object oTrig2 = GetNearestObjectByTag("Q5BoltTrap1", OBJECT_SELF, 2);
    DestroyObject(oTrig1);
    DestroyObject(oTrig2);
}
