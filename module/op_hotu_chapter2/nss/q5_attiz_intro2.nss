// If Attiz has not given his name, yet

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "q5_Attiz_Introduce") == 0;
    return iResult;
}
