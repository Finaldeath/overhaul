//::///////////////////////////////////////////////
//:: m1q2 Emernik (Secondary Conversation Condition)
//:: m1q2_Emernik2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script returns TRUE if Emernik is close
    enough to his waypoint to be considered "in
    his room" and his door is not locked.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Nov 30, 2001
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bCondition = GetIsPC(GetPCSpeaker()) &&
                     GetDistanceToObject(GetNearestObjectByTag("Emernik_Waypoint")) < 3.0 &&
                     GetLocked(GetNearestObjectByTag("Emernik_Door")) == FALSE ;
    return bCondition;
}
