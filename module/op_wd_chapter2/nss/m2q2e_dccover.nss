//::///////////////////////////////////////////////
//:: M2Q2E_DCCOVER.NSS
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Checks to see if the PC has the 1st circle ring
*/
//:://////////////////////////////////////////////
//:: Created By:  Cori May
//:: Created On: February 7, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oItem = GetItemPossessedBy(GetPCSpeaker(), "M2Q2E_RING4");
    if(GetIsObjectValid(oItem) || GetLocalInt(GetPCSpeaker(),"NW_M2Q2E_LWIN")==TRUE)
    {
        return TRUE;
    }
    return FALSE;
}

