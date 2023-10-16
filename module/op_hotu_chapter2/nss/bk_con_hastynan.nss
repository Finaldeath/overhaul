// * returns true if speaker has tynan
int StartingConditional()
{
    int iResult;

    iResult = GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(), "q1hbaby"));
    return iResult;
}
