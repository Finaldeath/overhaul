// the PC has not already tried to get free equipment

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "q1h_bilked2") == 0;
    return iResult;
}
