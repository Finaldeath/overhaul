int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"NW_G_M2Q3KharlatIn") == 0 &&
              GetLocalInt(GetModule(),"NW_G_M2Q3QuintGive") == 10;
    return iResult;
}
