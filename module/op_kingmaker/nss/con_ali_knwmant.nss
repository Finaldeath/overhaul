//::///////////////////////////////////////////////
//:: Knows manticore
//:: con_ali_knwmant
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The Player knows about the manticore caves
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oLevi = GetObjectByTag("q2_leviosa");
    iResult = GetLocalInt(GetModule(), "os_manticorehunt")>=10;
    return iResult;
}
