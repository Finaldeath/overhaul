//::///////////////////////////////////////////////
//:: con_trp_story3
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
// Trip's story has finished the second stage
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "OS_TRIP_STORY") == 20
        && GetLocalInt(GetFirstPC(),"OS_HEN_STORY")>=20;
    return iResult;
}
