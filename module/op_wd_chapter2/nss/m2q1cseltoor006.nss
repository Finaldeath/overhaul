int StartingConditional()
{
    int iResult;

    iResult = GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M2Q01TIMASKDEATH")) &&
              GetLocalInt(OBJECT_SELF,"NW_L_DeathReturned") == 0;
    return iResult;
}
