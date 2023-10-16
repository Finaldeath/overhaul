// PC has a bottle of Aoist wine

int StartingConditional()
{
    int iResult;

    iResult = GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(), "q5b_bottle"));
    return iResult;
}
