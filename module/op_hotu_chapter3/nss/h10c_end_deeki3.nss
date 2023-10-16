//::///////////////////////////////////////////////
//:: End Narration, Deekin Friendship (Condition Script)
//:: H10c_End_Deeki3.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Deekin was a close friend to
     the player.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 16, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oDeekin = GetObjectByTag("x2_hen_deekin");
    int bEndBattle = GetLocalInt(GetModule(), "bDeekinEndBattle");
    int iFriendship = GetLocalInt(GetModule(), "iDeekinFriendship");
    if (bEndBattle == TRUE &&
        iFriendship >= 5)
    {
        return TRUE;
    }
    return FALSE;
}
