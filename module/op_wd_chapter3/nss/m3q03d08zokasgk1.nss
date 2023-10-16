int StartingConditional()
{
    int iResult;

    iResult = GetLocalObject(GetModule(),"NW_L_M3Q03TALKPLAGUECUREPC") == GetPCSpeaker() &&
              GetLocalInt(GetModule(),"NW_G_M3Q03PLOTPLAGUECURED") == 1;

    return iResult;
}
