//::///////////////////////////////////////////////
//:: Gru'ul the Quarry Boss, PC Knows Deekin's Name (Condition Script)
//:: H2c_Gruul_Deeki1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player knows Deekin's
     True Name.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 7, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bName = GetLocalInt(GetModule(), "bKnower_DeekinNamed");
    if (bName == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}

