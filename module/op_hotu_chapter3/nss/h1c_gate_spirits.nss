//::///////////////////////////////////////////////
//:: Gatekeeper, Spirits of the Dead Not Allowed Home (Condition Script)
//:: H1c_Gate_Spirits.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has not yet
     granted the Spirits passage home.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 30, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bAccess = GetLocalInt(GetModule(), "bGatekeeper_SpiritHome");
    if (bAccess == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
