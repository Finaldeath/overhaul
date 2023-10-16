// If Drogan has been interrupted after taking the Tower Statue

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "q1_Drogan_Final_Speech") == 1;
    return iResult;
}
