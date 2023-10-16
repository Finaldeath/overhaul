int StartingConditional()
{
    int iResult;

    iResult = !GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"Elynwyd_Ring"));
    return iResult;
}
