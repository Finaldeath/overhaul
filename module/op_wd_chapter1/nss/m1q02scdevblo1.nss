int StartingConditional()
{
    int bCondition = GetLocalInt(OBJECT_SELF,"M1Q02BloodSailorTransformed") == 0 &&
                     GetIsObjectValid(GetPCSpeaker());
    return bCondition;
}
