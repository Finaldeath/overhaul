int StartingConditional()
{
    int bCondition =  (GetLocalObject(OBJECT_SELF,"NW_Thurin_RingGiven") != GetPCSpeaker());
    return bCondition;
}
