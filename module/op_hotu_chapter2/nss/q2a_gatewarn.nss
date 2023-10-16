///Checks if player warned about gates yet


int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"Gate_Warning")==FALSE;
    return iResult;
}
