//::///////////////////////////////////////////////
//:: The Knower of Names, Gatekeeper Named (Condition Script)
//:: H7c_Name_Gate_2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Player has learned the
     Gatekeeper's True Name.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 8, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bTrueName = GetLocalInt(GetModule(), "bKnower_GatekeeperNamed");
    if (bTrueName == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
