////////Final battle over, Pavel already initiated dialog,
////////dialog broken out of by player before final line spoken


int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"PavelLeaves")==99;
    return iResult;
}


