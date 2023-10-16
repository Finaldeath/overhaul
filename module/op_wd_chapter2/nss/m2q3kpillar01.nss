// the PC has the explorer's journal.

int StartingConditional()
{
    int iResult;

    iResult = GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M2Q3KEXPJOURN"));
    return iResult;
}
