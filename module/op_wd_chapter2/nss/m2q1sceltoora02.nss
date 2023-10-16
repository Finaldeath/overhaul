int StartingConditional()
{
    int iResult;

    iResult = GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"NW_IT_MSMLMISC12"));
    return iResult;
}
