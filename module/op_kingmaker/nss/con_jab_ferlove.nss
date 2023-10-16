//::///////////////////////////////////////////////
//:: con_jab_ferlove
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Feran knows that Ellysia loves him
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oElly = GetObjectByTag("q2_ellysia");
    iResult = GetLocalInt(GetModule(), "OS_FERANLOVE")==60;
    return iResult;
}
