//::///////////////////////////////////////////////
//:: Feran In Love
//:: con_fer_inlove
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    if Feran is happy in love now
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oElly = GetObjectByTag("q2_ellysia");
    int nLove = GetLocalInt(GetModule(), "OS_FERANLOVE");
    iResult = nLove==60;
    return iResult;
}
