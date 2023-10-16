int StartingConditional()
{
    int iResult;

    iResult = !GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M2Q06ITWILRING"));
    return iResult;
}
