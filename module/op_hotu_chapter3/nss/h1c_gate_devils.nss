//::///////////////////////////////////////////////
//:: Gatekeeper, Devils Not Allowed Out (Condition Script)
//:: H1c_Gate_Devils.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player has not yet
     granted the Devils access to the Gate.
     Evil-only restriction added at WotC's
     request.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 30, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iAlign = GetAlignmentGoodEvil(oPC);
    int bAccess = GetLocalInt(GetModule(), "bGatekeeper_DevilHome");
    if (bAccess == FALSE &&
        iAlign == ALIGNMENT_EVIL)
    {
        return TRUE;
    }
    return FALSE;
}
