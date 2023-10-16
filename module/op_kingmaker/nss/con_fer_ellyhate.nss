//::///////////////////////////////////////////////
//:: Ellysia hates Feran
//:: con_fer_ellyhate
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If Ellysia now hates Feran
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: September 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oEllysia = GetObjectByTag("q2_ellysia");
    iResult = GetLocalInt(GetModule(), "OS_FERANLOVE")==40;
    return iResult;
}
