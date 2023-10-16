//::///////////////////////////////////////////////
//:: Sleeping Man, No Door 2nd Time Talked To (Condition Script)
//:: H3c_SMan_NoDoor2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the door has not yet been
     spawned in and the Sensei is dead.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 26, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oDoor = GetObjectByTag("hx_sleep_2_ring");
    object oSensei = GetObjectByTag("H2_Sensei");
    int bDead = GetIsDead(oSensei);
    if (oDoor == OBJECT_INVALID &&
        bDead == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
