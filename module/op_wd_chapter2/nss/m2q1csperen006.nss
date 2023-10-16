int StartingConditional()
{
    int iResult;

    iResult = !GetIsObjectValid(GetPCSpeaker()) &&
               GetLocalInt(OBJECT_SELF,"NW_L_Heal") == 20;
    return iResult;
}
