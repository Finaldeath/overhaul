// returns TRUE if the player has spoken to Thesta
// previously

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "NW_SPOKE_THESTA") == TRUE;
    return iResult;
}
