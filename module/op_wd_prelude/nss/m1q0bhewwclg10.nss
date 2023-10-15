int StartingConditional()
{
    int bCondition = !GetIsObjectValid(GetPCSpeaker()) &&
                     GetLocalInt(GetModule(),"NW_G_M0Q01_FIGHTER_TEST") == 1 &&
                     GetLocalInt(GetModule(),"NW_G_M1Q0BMelee") == FALSE &&
                     GetLocalInt(GetModule(),"NW_G_M1Q0BRanged") == TRUE;
    return bCondition;
}

