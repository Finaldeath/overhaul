//::///////////////////////////////////////////////
//:: Random base four check for conversations
//:: con_rand_scr
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   returns true one in four times for random
   conversation bark string checks
*/
//:://////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: June 2004
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult = FALSE;

    // one in four time return true
    if (Random(4)==0)
    {
        iResult = TRUE;
    }

    return iResult;
}
