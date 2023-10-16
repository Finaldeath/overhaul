int StartingConditional()
{
    int iResult;

    iResult = GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M2Q01TIMASKICE")) &&
              GetLocalInt(OBJECT_SELF,"NW_L_IceReturned") == 0;
    return iResult;
}
