//::///////////////////////////////////////////////
//:: Sleeping Man, No Door Do Once (Condition Script)
//:: H3c_SMan_NoDoor1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the door has not yet been
     spawned in, this line has not been spoken
     before, and the Sensei is dead.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 26, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oDoor = GetObjectByTag("hx_sleep_2_ring");
    object oMan = GetObjectByTag("H2_SleepingMan");
    int bDoOnce = GetLocalInt(oMan, "bNoDoorDoOnce");
    object oSensei = GetObjectByTag("H2_Sensei");
    int bDead = GetIsDead(oSensei);
    if (/*oDoor == OBJECT_INVALID &&*/
        bDoOnce == FALSE &&
        bDead == TRUE)
    {
        SetLocalInt(oMan, "bNoDoorDoOnce", TRUE);
        return TRUE;
    }
    return FALSE;
}
