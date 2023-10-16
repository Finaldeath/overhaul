int StartingConditional()
{
    int bCondition = GetLocalInt(GetModule(),"NW_Thurin_Plot") < 100 &&
                     !GetIsObjectValid(GetLocalObject(OBJECT_SELF,"NW_Thurin_RingGiven"));
    return bCondition;
}
