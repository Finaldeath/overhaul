//::///////////////////////////////////////////////
//:: Githzerai Pilgrim, Arden Swift is Alive (Condition Script)
//:: H2c_Pilg_ArdLive.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the tiefling, Arden Swift, is
     still alive.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 29, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oArden = GetObjectByTag("H2_ArdenSwift");
    int bDead = GetIsDead(oArden);

    if (bDead == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
