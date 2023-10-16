//::///////////////////////////////////////////////
//:: Githzerai Pilgrim, Player Talked to Arden Swift (Condition Script)
//:: H2c_Pilg_Arden.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has spoken to the
     tiefling, Arden Swift.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 29, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bTalked = GetLocalInt(GetModule(), "bTalkedToArden");

    if (bTalked == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
