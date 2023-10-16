//::///////////////////////////////////////////////
//:: Generic Devils, Gate Access (Condition Script)
//:: H2c_Devil_Gate.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if player has used the Reaper's
     True Name to grant the devils Gate access.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 23, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bGateAccess = GetLocalInt(GetModule(), "bGatekeeper_DevilHome");
    if (bGateAccess == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
