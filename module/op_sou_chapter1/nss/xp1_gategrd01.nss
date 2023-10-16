// checks to see if the gate guard has already given his warning
// if not, return TRUE

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "x1d_Gave_Warning") == 0;
    return iResult;
}
