int StartingConditional()
{
    int iResult;

    iResult = GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M2Q03ISCEPJARDAK")) &&
              GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M2Q03ISCEPNARI"));
    return iResult;
}
