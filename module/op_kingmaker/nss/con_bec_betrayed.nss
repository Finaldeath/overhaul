//::///////////////////////////////////////////////
//:: Beckett Betrayed
//:: con_bec_betrayed
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    if Sir Becket was promised the Banner, but not given it
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    iResult = GetLocalInt(GetModule(), "OS_BECKET_BANNER")==99;
    return iResult;
}
