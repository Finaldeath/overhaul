//::///////////////////////////////////////////////
//:: Opened
//:: m2q3BackDoorOpen
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When the back door to the tower is opened, the
    doors to the hall are unlocked.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 22, 2001
//:://////////////////////////////////////////////

void main()
{
    object oDoor = GetObjectByTag("M2Q03DWANEVTOW03");

    if (GetLocked(oDoor))
    {
        SetLocked(oDoor,FALSE);
    }
}
