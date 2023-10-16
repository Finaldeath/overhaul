// the PC has at least 1 level Cleric

int StartingConditional()
{
    int iResult;

    iResult = GetLevelByClass(CLASS_TYPE_CLERIC, GetFirstPC()) > 0;
    return iResult;
}
