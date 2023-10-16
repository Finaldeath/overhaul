// the PC knows about Deekin
// Ayala has not been told about Deekin
// the PC is of normal Intelligence

int StartingConditional()
{
    int nKnow = GetLocalInt(GetPCSpeaker(), "Know_Deekin");
    int nTold = GetLocalInt(OBJECT_SELF, "Told_Deekin");
    if ((nKnow == 1) && (nTold == 0))
    {
        return TRUE;
    }
    return FALSE;
}
