//::///////////////////////////////////////////////
//:: Name: act_q2d4door_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Add to the count of door openning attempts.
    Tracked for experience reward..
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 6/03
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF, "nAttempts", GetLocalInt(OBJECT_SELF, "nAttempts") + 1);
}
