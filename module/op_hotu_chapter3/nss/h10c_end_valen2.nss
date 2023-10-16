//::///////////////////////////////////////////////
//:: End Narration, Valen Betrayed Alive (Condition Script)
//:: H10c_End_Valen2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Valen betrayed the
     player, and survived the battle.
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
    int bDead = GetIsDead(oValen);
    if (bEndBattle == TRUE &&
        bBetray == TRUE &&
        bDead == FALSE)
    {
        return TRUE;
    }
    return FALSE;

}
