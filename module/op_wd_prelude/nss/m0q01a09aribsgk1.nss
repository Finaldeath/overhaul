int StartingConditional()
{
    int bCondition = !GetIsObjectValid(GetPCSpeaker()) &&
                     GetLocalInt(GetModule(),"NW_PROLOGUE_PLOT") == 99;
    return bCondition;
}

