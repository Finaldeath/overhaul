//::///////////////////////////////////////////////
//:: The Knower of Names, PC is Lawful Evil (Condition Script)
//:: H7c_Name_PC_LE.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Player is Lawful Evil.
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
        bAlign_GE == ALIGNMENT_EVIL)
    {
        SetLocalString(GetModule(), "sPCAlignmentWhenNamed", "LE");
        return TRUE;
    }
    return FALSE;
}
