//::///////////////////////////////////////////////
//:: Name q1_chk_hkit1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
//
//    Check to see if PC has a +1 or +3 healing kit
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 12/03
//:://////////////////////////////////////////////

int StartingConditional()
{
    if (GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(), "NW_IT_MEDKIT001")) == TRUE || GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(), "NW_IT_MEDKIT002")) == TRUE)
        return TRUE;
    return FALSE;
}
