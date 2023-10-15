int StartingConditional()
{
    int bCondition = (GetLocalInt(GetModule(),"NW_G_M0Q01_FIGHTER_TEST") != 2 &&
                       GetLocalInt(GetModule(),"NW_G_M0Q01_PRIEST_TEST") != 2 &&
                       GetLocalInt(GetModule(),"NW_G_M0Q01_ROGUE_TEST") != 2 &&
                       GetLocalInt(GetModule(),"NW_G_M0Q01_MAGE_TEST") != 2);
    return bCondition;
}
