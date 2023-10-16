//::///////////////////////////////////////////////
//:: q2aGrovel10
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks Grovel variable is 10 (Sent up to see Durnan)
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

    iResult = GetLocalInt(GetModule(),"Grovel")==10;
    return iResult;
}
