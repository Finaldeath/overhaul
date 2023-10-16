int StartingConditional()
{
    int nTime = GetLocalInt(OBJECT_SELF,"NW_L_TimeOfNextPayment");
    int bCondition = nTime == 0 ||
                     GetTimeHour() >= nTime;

    return bCondition;
}
