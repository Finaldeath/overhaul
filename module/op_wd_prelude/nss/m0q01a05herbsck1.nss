int StartingConditional()
{
    int iResult;

    int bCondition = !GetIsObjectValid(GetPCSpeaker()) &&
                     GetLocalInt(OBJECT_SELF, "NW_L_TALKLEVEL") == 0;
    return bCondition;
}

