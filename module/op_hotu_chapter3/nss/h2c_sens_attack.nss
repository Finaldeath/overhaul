//::///////////////////////////////////////////////
//:: Githzerai Sensei, She Attacks (Condition Script)
//:: H2c_Sens_Attack.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE as a combat one-liner if the
     player has awoken the Sleeping Man.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 23, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    //Check to see if the Sleeping Man's awake.
    object oSleepingMan = GetObjectByTag("H2_SleepingMan");
    int bAwake = GetLocalInt(oSleepingMan, "bAwake");
    if (bAwake == TRUE)
    {
/*DEBUG*///SendMessageToPC(GetFirstPC(), "DEBUG: Sensei 1-liner returned TRUE.");
        return TRUE;
    }
/*DEBUG*///SendMessageToPC(GetFirstPC(), "DEBUG: Sensei 1-liner returned FALSE.");
    return FALSE;
}

