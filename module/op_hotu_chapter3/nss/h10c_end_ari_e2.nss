//::///////////////////////////////////////////////
//:: End Narration, Evil Aribeth Betrayed Alive (Condition Script)
//:: H10c_End_Ari_E2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Aribeth is evil, betrayed the
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
        iAlignment == ALIGNMENT_EVIL &&
        bBetray == TRUE &&
        bDead == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
