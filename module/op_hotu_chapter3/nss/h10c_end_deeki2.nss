//::///////////////////////////////////////////////
//:: End Narration, Deekin Betrayed Alive (Condition Script)
//:: H10c_End_Deeki2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Deekin betrayed the
     player, and survived the battle.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 16, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oDeekin = GetObjectByTag("x2_hen_deekin");
    int bEndBattle = GetLocalInt(GetModule(), "bDeekinEndBattle");
    int bBetray = GetLocalInt(GetModule(), "bDeekinBetrays");
    int bDead = GetIsDead(oDeekin);
    if (bEndBattle == TRUE &&
        bBetray == TRUE &&
        bDead == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
