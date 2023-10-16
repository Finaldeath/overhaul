int StartingConditional()
{
    int iResult;

    iResult = !GetIsObjectValid(GetPCSpeaker()) &&
               GetLocalInt(GetModule(),"NW_G_CharwoodEntered") == 10;
    return iResult;
}
