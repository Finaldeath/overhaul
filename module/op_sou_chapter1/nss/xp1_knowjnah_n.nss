// the PC knows about J'Nah
// but has not yet spoken to her
// Ayala has not been told about J'Nah

int StartingConditional()
{
    int nKnow = GetLocalInt(GetPCSpeaker(), "Know_Jnah");
    int nTold = GetLocalInt(OBJECT_SELF, "Told_Jnah");
    int nSpeak = GetLocalInt(GetModule(), "X1_JNAH_STATUS");
    if ((nKnow == 1) && (nSpeak == 0) && (nTold == 0))
    {
        return TRUE;
    }
    return FALSE;
}
