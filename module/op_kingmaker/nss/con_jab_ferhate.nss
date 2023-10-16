//::///////////////////////////////////////////////
//:: con_jab_ferhate
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Feran hates the PC
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oFeran = GetObjectByTag("q2_feran");
    object oElly = GetObjectByTag("q2_ellysia");
    int nFeran = GetLocalInt(oFeran,"OS_FERANDRINKING");
    int nElly = GetLocalInt(GetModule(), "OS_FERANLOVE");
    iResult = nFeran==30 || nElly==40;
    return iResult;
}
