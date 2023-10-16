//::///////////////////////////////////////////////
//:: con_mw_yenna
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC has just spoken to Yenna about the eavesdropping
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"OS_MW_YENNA")==1;
    return iResult;
}
