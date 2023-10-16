//::///////////////////////////////////////////////
//:: End Narration, Good Aribeth Betrayed Alive (Condition Script)
//:: H10c_End_Ari_G2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Aribeth is good, betrayed the
     player, and survived the battle.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 12, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oAribeth = GetObjectByTag("H2_Aribeth");
    int bEndBattle = GetLocalInt(GetModule(), "bAribethEndBattle");
    int iAlignment = GetAlignmentGoodEvil(oAribeth);
    int bBetray = GetLocalInt(GetModule(), "bAribethBetrays");
    int bDead = GetIsDead(oAribeth);
    if (bEndBattle == TRUE &&
        iAlignment == ALIGNMENT_GOOD &&
        bBetray == TRUE &&
        bDead == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
