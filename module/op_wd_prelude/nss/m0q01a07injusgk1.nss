int StartingConditional()
{
    int bCondition = GetLocalInt(GetModule(),"NW_G_M0Q01_PRIEST_TEST") == 1 &&
                     GetLocalInt(GetModule(),"NW_G_M1Q0Healing") == FALSE;
    return bCondition;
}
