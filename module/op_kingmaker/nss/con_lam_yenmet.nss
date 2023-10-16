//::///////////////////////////////////////////////
//:: con_lam_yenmet
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC has met Yenna
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: March, 2004
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oYenna = GetObjectByTag("q2_yenna");
    iResult = GetLocalInt(oYenna,"OS_TALKED_TO")>=1;
    return iResult;
}
