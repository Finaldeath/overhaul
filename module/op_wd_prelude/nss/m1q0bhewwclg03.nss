int StartingConditional()
{
    return !GetIsObjectValid(GetPCSpeaker()) &&
           GetLocalInt(GetModule(),"NW_G_M0Q01_FIGHTER_TEST") == 1;
}
