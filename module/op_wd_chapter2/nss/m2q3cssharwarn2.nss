int StartingConditional()
{
    int iResult;

    iResult = !GetIsObjectValid(GetPCSpeaker()) && GetLocalInt(OBJECT_SELF,"NW_L_Warning") == 2;
    return iResult;
}
