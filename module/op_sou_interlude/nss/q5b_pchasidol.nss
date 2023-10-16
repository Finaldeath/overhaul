// the PC has Musharak's idol

int StartingConditional()
{
    int iResult;

    iResult = GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(), "q5b_idol"));
    return iResult;
}
