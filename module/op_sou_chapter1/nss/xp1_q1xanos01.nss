// checks to see if Xanos has spoken his original dialogue

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "Xanos_Spoke") == 0;
    return iResult;
}
