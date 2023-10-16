//::///////////////////////////////////////////////
//:: Lord Iridor Conversation Script #8
//:: LordIridor08
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Return TRUE if the player does not have the
    key.
*/
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oKey = GetItemPossessedBy(oPC, "IridorCryptKey");

    if (oKey == OBJECT_INVALID)
    {
        return TRUE;
    }
    return FALSE;
}
