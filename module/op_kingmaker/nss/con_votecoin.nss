int StartingConditional()
{
    int iResult = FALSE;
    object oPC = GetPCSpeaker();
    object oCoin = GetItemPossessedBy(oPC, "q2_rafaelcoin");

    if (oCoin != OBJECT_INVALID)
    {
        iResult = TRUE;
    }

    return iResult;
}
