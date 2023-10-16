//::///////////////////////////////////////////////
//:: The Knower of Names, PC is Chaotic Neutral (Condition Script)
//:: H7c_Name_PC_CN.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Player is Chaotic Neutral.
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
    if (bAlign_LC == ALIGNMENT_CHAOTIC &&
        bAlign_GE == ALIGNMENT_NEUTRAL)
    {
        SetLocalString(GetModule(), "sPCAlignmentWhenNamed", "CN");
        return TRUE;
    }
    return FALSE;
}
