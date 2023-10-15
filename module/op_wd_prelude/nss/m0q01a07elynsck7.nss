int StartingConditional()
{
    int bCondition = GetIsObjectValid(GetPCSpeaker()) &&
                     GetLocalInt(GetModule(),"NW_G_M0Q01_PRIEST_TEST") == 2;
    return bCondition;
}

