// if the PC has not asked Torias to join, yet

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "q1_Torias_Join") == 0;
    return iResult;
}
