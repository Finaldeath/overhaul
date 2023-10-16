int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"NW_G_M1Q5JemanieSpokenToXXX") == 10 &&
              GetLocalInt(GetModule(),"NW_G_M1Q5KrestalSpokenToXXX") < 10;
    return iResult;
}


