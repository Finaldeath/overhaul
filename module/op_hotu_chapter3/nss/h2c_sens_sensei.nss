//::///////////////////////////////////////////////
//:: Sensei Dharvana, Sensei Is Sleeping Man's True Love (Condition Script)
//:: H2c_Sens_Sensei.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the the Sensei is the
     Sleeping Man's one true love.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 9, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sLove = GetLocalString(GetModule(), "sKnower_SleepingMansLove");
    if (sLove == "Sensei")
    {
        return TRUE;
    }
    return FALSE;
}
