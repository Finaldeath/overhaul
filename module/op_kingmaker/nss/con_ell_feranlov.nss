//::///////////////////////////////////////////////
//:: Feran loves Ellysia
//:: con_ell_feranlove
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC knows that Feran loves Ellysia
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oFeran = GetObjectByTag("q2_feran");
    iResult =  GetLocalInt(oFeran,"OS_FERANDRINKING")==20;
    return iResult;
}
