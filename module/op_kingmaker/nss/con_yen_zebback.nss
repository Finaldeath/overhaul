//::///////////////////////////////////////////////
//:: Zebulon returned
//:: con_yen_zebback
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Zebulon has been returned, and the reward unclaimed
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "OS_YENNA_ZEBULON")==20;
    return iResult;
}
