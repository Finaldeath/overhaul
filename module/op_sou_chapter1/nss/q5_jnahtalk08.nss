// the PC has not agreed to J'Nah's quest

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "X1_JNAHPLOT") != 10;
    return iResult;
}
