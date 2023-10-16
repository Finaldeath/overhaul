int StartingConditional()
{
    int iResult;

    iResult = !GetIsObjectValid(GetPCSpeaker()) &&
               GetLocalInt(OBJECT_SELF,"NW_L_Heal") == 40;
    return iResult;
}
