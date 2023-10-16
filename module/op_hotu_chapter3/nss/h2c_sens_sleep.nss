//::///////////////////////////////////////////////
//:: Sensei Dharvana, Sleeping Man still sleeps (Condition Script)
//:: H2c_Sens_Sleep.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Sleeping Man is still
     asleep.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 8, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oMan = GetObjectByTag("H2_SleepingMan");
    int bAwake = GetLocalInt(oMan, "bAwake");
    if (bAwake == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
