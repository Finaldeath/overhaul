int StartingConditional()
{
    int iResult;

    if(!GetIsInCombat(GetPCSpeaker()))
    return TRUE;
    else
    return FALSE;
}
