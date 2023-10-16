//::///////////////////////////////////////////////
//:: Hellbreath Tavern, Sleeping Man is Awake (Condition Script)
//:: H2c_Card_Awake.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Sleeping Man is awake.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 22, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oSleepingMan = GetObjectByTag("H2_SleepingMan");
    int bAwake = GetLocalInt(oSleepingMan, "bAwake");

    if (oSleepingMan == OBJECT_INVALID &&
        bAwake == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
