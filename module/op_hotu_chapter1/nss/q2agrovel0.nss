//::///////////////////////////////////////////////
//:: q2aGrovel0
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks Grovel variable is 0
    (Still in Undermountain)
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On:   July 25, 2003
//:://////////////////////////////////////////////

    /*
    Grovel plot states:
    10 - Grovel sent up well
    20 - You have grovel put into a cage
    30 - you convince Durnan to put grovel to work at the inn
    99 - you have grovel executed
    */


int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"Grovel")==0;
    return iResult;
}

