// the PC knows about Tymofarrar
// but has not talked to Tymofarrar yet
// Ayala has not been told about Tymofarrar

int StartingConditional()
{
    int nKnow = GetLocalInt(GetPCSpeaker(), "Know_Tymo");
    int nTold = GetLocalInt(OBJECT_SELF, "Told_Tymo");
    int nSpeak = GetLocalInt(GetModule(), "X1_TYMOFARRAR_STATUS");
    if ((nKnow == 1) && (nSpeak == 0) && (nTold == 0))
    {
        return TRUE;
    }
    return FALSE;
}
