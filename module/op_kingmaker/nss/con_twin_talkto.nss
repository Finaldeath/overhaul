//::///////////////////////////////////////////////
//:: Twins Talked To
//:: con_twin_talkto
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks if you've talked to either twin before
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oAlexis = GetObjectByTag("q1_alexis");
    object oAlenor = GetObjectByTag("q1_alenor");
    iResult = GetLocalInt(oAlexis,"OS_TALKED_TO")==0
        && GetLocalInt(oAlenor,"OS_TALKED_TO")==0;
    return iResult;
}
