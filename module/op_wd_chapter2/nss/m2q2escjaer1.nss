int StartingConditional()
{
    int iResult;

    iResult = GetLevelByClass(CLASS_TYPE_DRUID,GetPCSpeaker())>=1;
    return iResult;
}
