int StartingConditional()
{
    int iResult;

    iResult = (GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M2Q2_NymphDagger")) ||
               GetLocalInt(OBJECT_SELF,"NW_L_DaggerReturned") >= 1)&&
              !GetIsObjectValid(GetHenchman(GetPCSpeaker()));
    return iResult;
}
