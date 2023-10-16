//::///////////////////////////////////////////////
//:: PC Knows Hermit
//:: con_ali_knwhermt
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC has met the hermit and is helping him
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: September 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    iResult = GetLocalInt(GetFirstPC(), "OS_HELPDRUID")==30;
    return iResult;
}
