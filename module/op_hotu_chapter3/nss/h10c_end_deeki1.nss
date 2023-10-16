//::///////////////////////////////////////////////
//:: End Narration, Deekin Betrayed Dead (Condition Script)
//:: H10c_End_Deeki1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Deekin betrayed the
     player, and died in battle.
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
    //int bDead = GetIsDead(oDeekin);
    int bDead = GetLocalInt(GetModule(), "x2_hen_deekin_DIED");
    if (bEndBattle == TRUE &&
        bBetray == TRUE &&
        bDead == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}

