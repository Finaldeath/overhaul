//::///////////////////////////////////////////////
//:: Sensei Dharvana, Aribeth Is Not Sleeping Man's True Love (Condition Script)
//:: H2c_Sens_NotAri.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Aribeth is not the
     Sleeping Man's one true love.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 9, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bName = GetLocalInt(GetModule(), "bAribethsNameKnown");
    string sLove = GetLocalString(GetModule(), "sKnower_SleepingMansLove");
    if (bName == TRUE &&
        sLove != "Aribeth")
    {
        return TRUE;
    }
    return FALSE;
}
