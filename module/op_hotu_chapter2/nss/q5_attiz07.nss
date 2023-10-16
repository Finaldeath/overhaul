// so long as the PC has not failed a persuade attempt

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "q5_Attiz_Failed") == 0;
    return iResult;
}
