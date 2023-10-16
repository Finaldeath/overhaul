//::///////////////////////////////////////////////
//:: End Narration, Evil Aribeth Betrayed Dead (Condition Script)
//:: H10c_End_Ari_E1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Aribeth is evil, betrayed the
     player, and died in battle.
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
    //int bDead = GetIsDead(oAribeth);
    int bDead = GetLocalInt(GetModule(), "H2_Aribeth_DIED");
    if (bEndBattle == TRUE &&
        iAlignment == ALIGNMENT_EVIL &&
        bBetray == TRUE &&
        bDead == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
