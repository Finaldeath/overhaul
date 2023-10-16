int StartingConditional()
{
    int iResult;

    iResult = GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M2Q01TIMASKLIFE")) &&
              GetLocalInt(OBJECT_SELF,"NW_L_LifeReturned") == 0;
    return iResult;
}
