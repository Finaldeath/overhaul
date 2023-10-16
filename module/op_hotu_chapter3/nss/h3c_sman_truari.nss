//::///////////////////////////////////////////////
//:: Sleeping Man, Aribeth Is One True Love (Condition Script)
//:: H3c_SMan_TruAri.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Aribeth is the Sleeping
     Man's one true love.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 9, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sLove = GetLocalString(GetModule(), "sKnower_SleepingMansLove");
    if (sLove ==  "Aribeth")
    {
        return TRUE;
    }
    return FALSE;
}
