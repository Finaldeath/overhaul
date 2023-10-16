// if Attiz knows that the PC is here to kill beholders

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "q5_Attiz_Truth") == 1;
    return iResult;
}
