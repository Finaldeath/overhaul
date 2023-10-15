int StartingConditional()
{
    int bCondition = !GetIsObjectValid(GetPCSpeaker()) &&
                     GetLocalInt(OBJECT_SELF, "NW_G_M0Q01_PRIEST_TEST") == 0;
    return bCondition;
}

