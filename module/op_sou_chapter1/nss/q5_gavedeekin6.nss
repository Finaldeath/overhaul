// Deekin has not already been freed

int StartingConditional()
{
    int nFree = GetLocalInt(GetModule(), "q5_Deekin_Free");
    int nTry = GetLocalInt(OBJECT_SELF, "q5_Negotiate1");

    if ((nFree == 0) && (nTry == 2))
    {
        return TRUE;
    }
    return FALSE;
}
