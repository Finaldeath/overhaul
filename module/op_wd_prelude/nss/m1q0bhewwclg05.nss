int StartingConditional()
{
    int bCondition = !GetIsObjectValid(GetPCSpeaker()) &&
                     GetLocalInt(GetModule(),"NW_G_M0Q01_NONFIGHTER_PASS") &&
                     GetLocalInt(GetModule(),"NW_G_M0Q01_FIGHTER_TEST") == 1;
    return bCondition;
}
