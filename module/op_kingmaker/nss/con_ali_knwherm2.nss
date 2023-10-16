//::///////////////////////////////////////////////
//:: PC Knows Hermit
//:: con_ali_knwherm1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC has met the hermit and convinced him to sell his honey
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: September 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    iResult = GetLocalInt(GetFirstPC(), "OS_HELPDRUID")==99;
    return iResult;
}
