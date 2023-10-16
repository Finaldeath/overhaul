//::///////////////////////////////////////////////
//:: Sensei Dharvana, Sensei isn't Sleeping Man's Love, Asleep (Condition Script)
//:: H2c_Sens_Love_4.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Sensei isn't the Sleeping
     Man's one true love or he is still asleep.
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
    if (bAwake == FALSE ||
        sThinks != "Sensei")
    {
        return TRUE;
    }
    return FALSE;
}
