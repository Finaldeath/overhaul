//::///////////////////////////////////////////////
//:: Elite Group Sent
//:: con_cap_elite
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the player sent the elite group to the caves
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oEnivid = GetObjectByTag("q2_enivid");
    iResult = GetLocalInt(GetModule() ,"OS_ENIVID_DEPLOY")==20;
    return iResult;
}
