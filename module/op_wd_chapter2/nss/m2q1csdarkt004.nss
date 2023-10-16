int StartingConditional()
{
    int iResult;

    iResult = !GetIsObjectValid(GetPCSpeaker()) &&
               GetLocalInt(OBJECT_SELF,"NW_L_Moved") == 20;
    return iResult;
}
