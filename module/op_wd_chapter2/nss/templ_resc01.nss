int StartingConditional()
{
    int bCondition = GetLocalInt(GetModule(),"NW_Resc_Plot") < 100 &&
                     !GetIsObjectValid(GetLocalObject(OBJECT_SELF,"NW_Resc_RingGiven"));
    return bCondition;
}
