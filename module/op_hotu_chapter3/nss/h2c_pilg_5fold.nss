//::///////////////////////////////////////////////
//:: Githzerai Pilgrim, The Five-Fold Mysteries of the Sleeping Man (Condition Script)
//:: H2c_Pilg_5Fold.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has learned of the
     existence of the Five-Fold Mysteries of the
     Sleeping Man.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 29, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bMysteries = GetLocalInt(GetModule(), "bFiveFoldMysteries");
    int iTotal = GetLocalInt(GetModule(), "iTotalMysteriesLearned");
    if (iTotal < 5 &&
        bMysteries == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
