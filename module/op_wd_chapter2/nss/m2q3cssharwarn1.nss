int StartingConditional()
{
    int iResult;

    iResult = !GetIsObjectValid(GetPCSpeaker()) && GetLocalInt(OBJECT_SELF,"NW_L_Warning") == 1;
    return iResult;
}
