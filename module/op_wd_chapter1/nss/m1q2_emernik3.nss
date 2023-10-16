//::///////////////////////////////////////////////
//:: m1q2 Emernik (3rd Conversation Condition)
//:: m1q2_Emernik3
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script returns TRUE if Emernik's door is
    locked. It will only fire once.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Nov 30, 2001
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bCondition = GetLocked(GetNearestObjectByTag("Emernik_Door")) &&
                     GetIsObjectValid(GetPCSpeaker()) &&
                     GetLocalInt(OBJECT_SELF, "TalkedTo") == FALSE;
    if (bCondition) SetLocalInt(OBJECT_SELF, "TalkedTo", TRUE);
    return bCondition;
}
