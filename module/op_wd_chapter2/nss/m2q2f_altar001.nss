int StartingConditional()
{
    int iResult;

    iResult = !GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M2Q2_NymphDagger")) &&
               GetLocalInt(OBJECT_SELF,"NW_L_DaggerReturned") == 0;
    return iResult;
}
