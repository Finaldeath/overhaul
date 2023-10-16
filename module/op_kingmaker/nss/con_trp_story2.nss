//::///////////////////////////////////////////////
//:: con_trp_story2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
// Trip's story has finished the first stage
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "OS_TRIP_STORY") == 10
        && GetLocalInt(GetFirstPC(),"OS_HEN_STORY")>=10;
    return iResult;
}
