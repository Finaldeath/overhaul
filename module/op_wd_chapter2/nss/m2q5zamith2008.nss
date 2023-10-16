int StartingConditional()
{
    int iResult;

    iResult = !GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M2Q1ITGEMSHART"));
    return iResult;
}
