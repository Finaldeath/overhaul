//::///////////////////////////////////////////////
//:: Sleeping Man, Post-Names Asleep (Condition Script)
//:: H3c_SMan_Asleep2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has returned from
     the Knower of Names and the Sleeping Man is
     still asleep.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Ocotber 9, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oMan = GetObjectByTag("H2_SleepingMan");
    int bAwake = GetLocalInt(oMan, "bAwake");
    int bPostNames = GetLocalInt(GetModule(), "bKnower_GatekeeperNamed");
    if (bAwake == FALSE &&
        bPostNames == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
