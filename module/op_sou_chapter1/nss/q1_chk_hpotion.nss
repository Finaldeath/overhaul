//::///////////////////////////////////////////////
//:: Name q1_chk_hpotion
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check to see if PC has cure light or cure moderate
    healing potion.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 12/03
//:://////////////////////////////////////////////

int StartingConditional()
{
    if (GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(), "NW_IT_MPOTION001")) == TRUE || GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(), "NW_IT_MPOTION020")) == TRUE)
        return TRUE;
    return FALSE;
}
