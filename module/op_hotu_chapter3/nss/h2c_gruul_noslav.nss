//::///////////////////////////////////////////////
//:: Gru'ul the Quarry Boss, Player Doesn't Have Names of Potential Slaves (Condition Script)
//:: H2c_Gruul_NoSlav.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player doesn't know th
     True Names of any of the henchmen.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 6, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bAribeth = GetLocalInt(GetModule(), "bKnower_AribethNamed");
    int bNathyrra = GetLocalInt(GetModule(), "bKnower_NathyrraNamed");
    int bValen = GetLocalInt(GetModule(), "bKnower_ValenNamed");
    int bDeekin = GetLocalInt(GetModule(), "bKnower_DeekinNamed");

    if (bAribeth == FALSE &&
        bNathyrra == FALSE &&
        bValen == FALSE &&
        bDeekin == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
