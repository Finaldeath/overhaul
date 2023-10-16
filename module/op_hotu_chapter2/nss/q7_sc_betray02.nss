// the PC has refused to betray the Valsharess

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "q7_Mephisto_Betray") == 0;
    return iResult;
}
