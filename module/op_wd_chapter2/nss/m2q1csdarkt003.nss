int StartingConditional()
{
    int iResult;

    iResult = !GetIsObjectValid(GetPCSpeaker()) &&
               GetLocalInt(GetModule(),"NW_G_CharwoodEntered") == 10 &&
               GetLocalInt(OBJECT_SELF,"NW_L_Moved") == 10;
    return iResult;
}
