//::///////////////////////////////////////////////
//:: con_hen_inter4
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The Henchman is on its fourth interjection
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"OS_HENCH_CONV")==40;
    return iResult;
}