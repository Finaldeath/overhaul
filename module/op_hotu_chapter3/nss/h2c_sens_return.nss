//::///////////////////////////////////////////////
//:: Sensei Dharvana, Player Returned Post-Names (Condition Script)
//:: H7c_Sens_Return.nss
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
    int bName = GetLocalInt(GetModule(), "bKnower_GatekeeperNamed");
    if (bName == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
