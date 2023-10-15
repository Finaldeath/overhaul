int StartingConditional()
{
    int bCondition = GetIsObjectValid(GetPCSpeaker()) &&
                     GetLocalInt(GetModule(),"NW_G_M0Q01_ROGUE_TEST") == 1;
    return bCondition;
}
