// the PC has Daschnaya's wagon key

int StartingConditional()
{
    int iResult;

    iResult = (GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(), "q1ikey")));
    return iResult;
}
