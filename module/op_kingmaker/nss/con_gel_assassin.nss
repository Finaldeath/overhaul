//::///////////////////////////////////////////////
//:: Assassinating Gelani
//:: con_gel_assassin
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the PC has led Gelani away to be assassinated
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oThad = GetObjectByTag("q2_thaddeus");
    iResult = GetLocalInt(GetModule(), "OS_KILLGELANI")==15;
    return iResult;
}
