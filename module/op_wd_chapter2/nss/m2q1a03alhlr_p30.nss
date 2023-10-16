int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"NW_G_URTHISDEAD") &&
              !GetLocalInt(GetModule(),"NW_G_BRANISDEAD") &&
              GetLocalInt(GetModule(),"NW_G_GETHISDEAD");
    return iResult;
}


