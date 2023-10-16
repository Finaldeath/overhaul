// Tymofarrar has not already given the Mask

int StartingConditional()
{
    int nMask = GetLocalInt(OBJECT_SELF, "q5_Gave_Mask");
    int nTry = GetLocalInt(OBJECT_SELF, "q5_Negotiate2");

    if ((nMask == 0) && (nTry == 1))
    {
        return TRUE;
    }
    return FALSE;
}
