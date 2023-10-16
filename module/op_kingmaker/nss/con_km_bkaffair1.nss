//::///////////////////////////////////////////////
//:: Beckett Affair
//:: con_km_bkaffair1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC knows about Beckett's affairbut ellysia
    is still with becket.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: Nov 2004
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetFirstPC(),"OS_BECKET_AFFAIR")==10;
    return iResult;
}
