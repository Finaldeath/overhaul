//::///////////////////////////////////////////////
//:: PC helped Gelani
//:: con_mos_gelhelp
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the PC helped Gelani get the guild back
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oGel = GetObjectByTag("q2_gelani");
    iResult = GetLocalInt(GetModule(), "OS_HELPGELANI")==99;
    return iResult;
}
