//::///////////////////////////////////////////////
//:: Gatekeeper, PC Knows his True Name (Condition Script)
//:: H1c_Gate_TruName.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Player has learned the
     Gatekeeper's name.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 16, 2003
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
