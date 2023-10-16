///Checks if gate is closed
///Return true if gate is closed


int StartingConditional()
{
    int iResult;

    iResult = GetIsOpen(GetObjectByTag("q2acitygate"))==FALSE;
    return iResult;
}
