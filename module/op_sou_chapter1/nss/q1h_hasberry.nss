// the PC already has helmthorn berries

int StartingConditional()
{
    int iResult;

    iResult = GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(), "q1cureing3"));
    return iResult;
}
