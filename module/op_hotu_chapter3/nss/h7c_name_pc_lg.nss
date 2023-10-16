//::///////////////////////////////////////////////
//:: The Knower of Names, PC is Lawful Good (Condition Script)
//:: H7c_Name_PC_LG.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Player is Lawful Good.
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
    if (bAlign_LC == ALIGNMENT_LAWFUL &&
        bAlign_GE == ALIGNMENT_GOOD)
    {
        SetLocalString(GetModule(), "sPCAlignmentWhenNamed", "LG");
        return TRUE;
    }
    return FALSE;
}
