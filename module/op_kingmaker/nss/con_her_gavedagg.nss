//::///////////////////////////////////////////////
//:: Garrot's Dagger
//:: con_her_gavedagg
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Player has shown the dagger to Garrot
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oGarrot = GetObjectByTag("q2_garrot");
    iResult = GetLocalInt(oGarrot,"OS_GARROT_HELPED")>=10
        && GetLocalInt(GetModule(), "OS_DAGGER_TOLD")==0;
    return iResult;
}
