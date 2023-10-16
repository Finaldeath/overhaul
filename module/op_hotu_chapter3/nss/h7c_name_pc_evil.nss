//::///////////////////////////////////////////////
//:: The Knower of Names, PC is Evil (Condition Script)
//:: H7c_Name_PC_Evil.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Player is Evil.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 5, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bAlign_GE = GetAlignmentGoodEvil(oPC);
    if (bAlign_GE == ALIGNMENT_EVIL)
    {
        return TRUE;
    }
    return FALSE;
}
