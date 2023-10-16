//::///////////////////////////////////////////////
//:: End Narration, Nathyrra Betrayed Dead (Condition Script)
//:: H10c_End_Nathy1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Nathyrra betrayed the
     player, and died in battle.
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
    //int bDead = GetIsDead(oNathyrra);
    int bDead = GetLocalInt(GetModule(), "x2_hen_nathyra_DIED");
    if (bEndBattle == TRUE &&
        bBetray == TRUE &&
        bDead == TRUE)
    {
        return TRUE;
    }
    return FALSE;

}

