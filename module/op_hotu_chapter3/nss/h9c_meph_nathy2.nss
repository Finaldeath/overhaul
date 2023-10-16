//::///////////////////////////////////////////////
//:: Mephistopheles, Nathyrra's True Name Known (Condition Script)
//:: H9c_Meph_Nathy2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has learned
     Nathyrra's True Name
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 10, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bName = GetLocalInt(GetModule(), "bKnower_NathyrraNamed");
    if (bName == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
