// * returns true if speaker has tongues pearl
int StartingConditional()
{
    int iResult;

    iResult = GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(), "bk_pearl_ix"));
    return iResult;
}
