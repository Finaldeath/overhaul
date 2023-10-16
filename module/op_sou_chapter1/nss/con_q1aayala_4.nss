int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "nOpenningSpeech2") != 1)
        return TRUE;
    return FALSE;
}
