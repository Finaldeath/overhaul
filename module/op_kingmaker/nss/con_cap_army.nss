//::///////////////////////////////////////////////
//:: Army deployed
//:: con_cap_army
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the PC had chosen to deploy the army
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oEnivid = GetObjectByTag("q2_enivid");
    iResult = GetLocalInt(GetModule(), "OS_ENIVID_DEPLOY")==30;
    return iResult;
}
