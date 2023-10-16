// * Asheera can only be spoke to once
// * she will fade away after speaking

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "NW_L_DOITONCE") == 0;
    if (iResult == TRUE)
    {
        SetLocalInt(OBJECT_SELF, "NW_L_DOITONCE", 10) ;
    }
    return iResult;
}
