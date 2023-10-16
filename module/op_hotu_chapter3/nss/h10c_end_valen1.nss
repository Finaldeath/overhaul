//::///////////////////////////////////////////////
//:: End Narration, Valen Betrayed Dead (Condition Script)
//:: H10c_End_Valen1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Valen betrayed the
     player, and died in battle.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 16, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oValen = GetObjectByTag("x2_hen_valen");
    int bEndBattle = GetLocalInt(GetModule(), "bValenEndBattle");
    int bBetray = GetLocalInt(GetModule(), "bValenBetrays");
    //int bDead = GetIsDead(oValen);
    int bDead = GetLocalInt(GetModule(), "x2_hen_valen_DIED");
    if (bEndBattle == TRUE &&
        bBetray == TRUE &&
        bDead == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}

