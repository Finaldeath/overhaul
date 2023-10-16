int StartingConditional()
{
    int iResult;

    iResult = GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M2Q01TIMASKRESON")) &&
              GetLocalInt(OBJECT_SELF,"NW_L_ResonReturned") == 0;
    return iResult;
}
