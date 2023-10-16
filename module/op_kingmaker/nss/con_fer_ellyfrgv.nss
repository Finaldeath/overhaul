//::///////////////////////////////////////////////
//:: Ellysia forgives Feran
//:: con_fer_ellyfrgv
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If Ellysia now forgives Feran
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: September 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oEllysia = GetObjectByTag("q2_ellysia");
    iResult = GetLocalInt(GetModule(), "OS_FERANLOVE")==30;
    return iResult;
}
