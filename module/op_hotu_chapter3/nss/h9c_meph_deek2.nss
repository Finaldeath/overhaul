//::///////////////////////////////////////////////
//:: Mephistopheles, Deekin's True Name Known (Condition Script)
//:: H9c_Meph_Deek2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has learned
     Deekin's True Name
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 10, 2003
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
