//::///////////////////////////////////////////////
//:: q2awhiterod0
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks if player has NOT been given the
    Rod of Resurrection from Thesta
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"RodRessurect")==5;
    return iResult;
}
