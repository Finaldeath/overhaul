//::///////////////////////////////////////////////
//:: Ellysia Loves Feran
//:: con_fer_ellylove
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If Ellysia now loves Feran
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: September 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oEllysia = GetObjectByTag("q2_ellysia");
    iResult = GetLocalInt(GetModule(), "OS_FERANLOVE")==20;
    return iResult;
}
