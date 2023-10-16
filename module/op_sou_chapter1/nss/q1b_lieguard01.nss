// if the PC helped out the kobolds in the tavern

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "nCOMMONSATTACKED") == 1;
    return iResult;
}
