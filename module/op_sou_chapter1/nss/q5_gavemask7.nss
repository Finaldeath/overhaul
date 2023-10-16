// Tymofarrar has not already given the Mask

int StartingConditional()
{
    int nMask = GetLocalInt(OBJECT_SELF, "q5_Gave_Mask");
    int nTry = GetLocalInt(OBJECT_SELF, "q5_Negotiate2");
    int nKnow = GetLocalInt(GetPCSpeaker(), "q5_Know_Tymo_Mask");

    if ((nMask == 0) && (nTry == 0) && (nKnow == 0))
    {
        return TRUE;
    }
    return FALSE;
}
