int StartingConditional()
{
    int bCondition = GetIsObjectValid(GetPCSpeaker()) &&
                     GetLocalInt(OBJECT_SELF,"NW_L_Surrender") > 1;
    return bCondition;
}

