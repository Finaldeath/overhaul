// Check the amulet's state.
int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "HX_SENSAI_AMULET");
    if(iResult == 1)
        return TRUE;
    else
        return FALSE;
}
