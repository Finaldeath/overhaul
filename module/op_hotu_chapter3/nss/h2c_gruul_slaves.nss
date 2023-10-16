//::///////////////////////////////////////////////
//:: Gru'ul the Quarry Boss, Player has Names of Potential Slaves (Condition Script)
//:: H2c_Gruul_Slaves.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player knows the True
     Names of at least some of his henchmen.
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

    if (bAribeth == TRUE ||
        bNathyrra == TRUE ||
        bValen == TRUE ||
        bDeekin == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
