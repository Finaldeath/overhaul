int StartingConditional()
{
    int bCondition = GetLocalInt(OBJECT_SELF,"NW_FORMOSA_DOUBLE_CROSS") >= 1 &&
                     GetLocalInt(GetPCSpeaker(),"NW_FORMOSA_DOUBLE_CROSS") >= 1 &&
                     GetLocalInt(GetModule(),"NW_G_M1Q3AFormosa_Dead");

    return bCondition;
}
