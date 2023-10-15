int StartingConditional()
{
    int bCondition = GetIsObjectValid(GetPCSpeaker()) &&
                     GetLocalInt(OBJECT_SELF, "NW_L_TALKLEVEL") == 1;
    return bCondition;
}

