//::///////////////////////////////////////////////
//:: Generic Pilgrims, Gate Access (Condition Script)
//:: H2c_Pilg_Gate.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if player has used the Reaper's
     True Name to grant the Pilgrims Gate access.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 23, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bGateAccess = GetLocalInt(GetModule(), "bGatekeeper_PilgrimHome");
    if (bGateAccess == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}

