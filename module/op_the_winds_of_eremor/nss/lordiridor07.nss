//::///////////////////////////////////////////////
//:: Lord Iridor Conversation Script #7
//:: LordIridor07
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Return TRUE if the player already has the
    key.
*/
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    object oKey = GetItemPossessedBy(oPC, "IridorCryptKey");

    if (oKey == OBJECT_INVALID)
    {
        return FALSE;
    }
    return TRUE;
}
