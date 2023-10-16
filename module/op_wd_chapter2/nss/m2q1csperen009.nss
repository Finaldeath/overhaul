int StartingConditional()
{
    int iResult;

    iResult = GetIsObjectValid(GetPCSpeaker()) &&
              GetLocalInt(OBJECT_SELF,"NW_L_Heal") == 50;
    return iResult;
}
