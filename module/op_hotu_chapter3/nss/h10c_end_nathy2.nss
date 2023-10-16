//::///////////////////////////////////////////////
//:: End Narration, Nathyrra Betrayed Alive (Condition Script)
//:: H10c_End_Nathy2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Nathyrra betrayed the
     player, and survived the battle.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 16, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oNathyrra = GetObjectByTag("x2_hen_nathyra");
    int bEndBattle = GetLocalInt(GetModule(), "bNathyrraEndBattle");
    int bBetray = GetLocalInt(GetModule(), "bNathyrraBetrays");
    int bDead = GetIsDead(oNathyrra);
    if (bEndBattle == TRUE &&
        bBetray == TRUE &&
        bDead == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
