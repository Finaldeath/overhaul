//::///////////////////////////////////////////////
//:: Gatekeeper, Githzerai Pilgrims Not Allowed Home (Condition Script)
//:: H1c_Gate_Pilgrim.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has not yet
     granted the Pilgrims passage home.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 30, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bAccess = GetLocalInt(GetModule(), "bGatekeeper_PilgrimHome");
    if (bAccess == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
