//::///////////////////////////////////////////////
//:: Generic Ghosts, Gate Access (Condition Script)
//:: H2c_Ghost_Gate.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if player has used the Reaper's
     True Name to grant the ghosts Gate access.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 23, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bGateAccess = GetLocalInt(GetModule(), "bGatekeeper_SpiritHome");
    if (bGateAccess == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
