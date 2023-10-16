//Only allow the player to remove Valen's taint once.
int StartingConditional()
{
    int bTaintGone = GetLocalInt(GetModule(), "bValensTaintGone");
    if (bTaintGone == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
