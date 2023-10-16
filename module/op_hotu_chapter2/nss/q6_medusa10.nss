//::///////////////////////////////////////////////
//:: q6_medusa10
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks if the medusa state is 10

    States:
    10 - riddle challenge given
    20 - First riddle failed
    30 - Second riddle failed
    99 - Riddle game over
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: September 05, 2003
//:://////////////////////////////////////////////


int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"q6_Medusa")>=10;
    return iResult;
}
