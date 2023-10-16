//::///////////////////////////////////////////////
//:: Sleeping Man,  Ring (Condition Script)
//:: H3c_SMan_Ring.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has the ring and
     the Sensei is dead.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 26, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oRing = GetItemPossessedBy(oPC, "hx_puzzle_ring");
    object oSensei = GetObjectByTag("H2_Sensei");
    int bDead = GetIsDead(oSensei);
    if (oRing != OBJECT_INVALID &&
        bDead == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
