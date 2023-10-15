int StartingConditional()
{
    int bCondition = !GetIsObjectValid(GetPCSpeaker()) &&
                     GetLocalInt(GetModule(),"NW_G_M0Q01_NONFIGHTER_PASS2");
    return bCondition;
}

