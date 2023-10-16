int StartingConditional()
{
    int iResult;

    iResult = GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M2Q01TIMASKFIRE")) &&
              GetLocalInt(OBJECT_SELF,"NW_L_FireReturned") == 0;
    return iResult;
}
