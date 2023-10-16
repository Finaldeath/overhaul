// Seen cutscene yet.
int StartingConditional()
{
    int iResult;

    if(GetLocalInt(GetArea(OBJECT_SELF), "HX_CRYSTAL1_CUTSCENE") == 1)
    {
        return TRUE;
    }
    {
        return FALSE;
    }
}
