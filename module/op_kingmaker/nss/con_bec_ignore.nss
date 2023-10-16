//::///////////////////////////////////////////////
//:: Beckett Ignores PC
//:: con_bec_ignore
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     If Beckett is ignoring the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"OS_BECKET_MOOD")==10;
    return iResult;
}
