int StartingConditional()
{
    int bCondition =  GetIsObjectValid(GetLocalObject(OBJECT_SELF,"NW_L_M1S1LetterGiven")) &&
                      GetLocalObject(OBJECT_SELF,"NW_L_M1S1LetterGiven") == GetPCSpeaker();
    return bCondition;
}
