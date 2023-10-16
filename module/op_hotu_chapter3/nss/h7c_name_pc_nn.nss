//::///////////////////////////////////////////////
//:: The Knower of Names, PC is Neutral Neutral (Condition Script)
//:: H7c_Name_PC_NN.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Player is Neutral Neutral.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 5, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bAlign_LC = GetAlignmentLawChaos(oPC);
    int bAlign_GE = GetAlignmentGoodEvil(oPC);
    if (bAlign_LC == ALIGNMENT_NEUTRAL &&
        bAlign_GE == ALIGNMENT_NEUTRAL)
    {
        SetLocalString(GetModule(), "sPCAlignmentWhenNamed", "NN");
        return TRUE;
    }
    return FALSE;
}
