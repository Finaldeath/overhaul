//::///////////////////////////////////////////////
//:: Beckett still has many votes
//:: con_bec_manyvote
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Beckett still has many votes
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "OS_BECKET_VOTES")>=3;
    return iResult;
}
