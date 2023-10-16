//::///////////////////////////////////////////////
//:: Random 25% Chance Starting Conition
//:: 25Percent3
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Does a check to see if randomly valid
    Third Condition out of 4
*/
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = Random(3)==2;
    return iResult;
}

