//::///////////////////////////////////////////////
//:: Gelani Dead
//:: con_mos_geldead
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     If Gelani assassinated
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oThad = GetObjectByTag("q2_thaddeus");
    iResult = GetLocalInt(GetModule(), "OS_KILLGELANI")>=20;
    return iResult;
}
