// the PC has agreed to betray the Valsharess

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "q7_Mephisto_Betray") == 1;
    return iResult;
}
