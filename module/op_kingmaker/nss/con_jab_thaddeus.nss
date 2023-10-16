//::///////////////////////////////////////////////
//:: con_jab_thaddeus
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the PC killed Gelani
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    //if Thaddeus supported and Gelani assasinated
    int iResult;
    object oThaddeus = GetObjectByTag("q2_thaddeus");
    iResult = GetLocalInt(GetModule(), "OS_KILLGELANI")>=20;
    return iResult;
}
