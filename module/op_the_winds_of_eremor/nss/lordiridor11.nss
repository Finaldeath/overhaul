//::///////////////////////////////////////////////
//:: Lord Iridor Conversation Script #11
//:: LordIridor11.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if the player has Morgroth's
    Heart and is of normal intelligence
*/
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

int StartingConditional()
{
    object oHeart = GetObjectByTag("MorgrothsHeart");

    if (GetItemPossessor(oHeart) == GetPCSpeaker())
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
