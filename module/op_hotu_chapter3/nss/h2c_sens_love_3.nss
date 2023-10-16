//::///////////////////////////////////////////////
//:: Sensei Dharvana, Sensei is Sleeping Man's Love, Awake (Condition Script)
//:: H2c_Sens_Love_3.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Sleeping Man thinks the
     Sensei is his one true love and he is awake.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 9, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oMan = GetObjectByTag("H2_SleepingMan");
    int bAwake = GetLocalInt(oMan, "bAwake");
    string sThinks = GetLocalString(GetModule(), "sSleepingManThinksTrueLoveIs");
    if (bAwake == TRUE &&
        sThinks == "Sensei")
    {
        return TRUE;
    }
    return FALSE;


    // TEMPSTART
    //return TRUE;
}
