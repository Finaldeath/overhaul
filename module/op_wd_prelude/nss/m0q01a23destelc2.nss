int StartingConditional()
{
    int bCondition = !GetIsObjectValid(GetPCSpeaker()) &&
                     GetLocalInt(OBJECT_SELF,"NW_L_TALKTIMES") == 1;
    return bCondition;
}

