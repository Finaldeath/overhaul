// the PC knows about the gnoll ambush
// Ayala has not been told about the gnoll ambush

int StartingConditional()
{
    int nKnow = GetLocalInt(GetPCSpeaker(), "Know_Ambush");
    int nTold = GetLocalInt(OBJECT_SELF, "Told_Ambush");
    if ((nKnow == 1) && (nTold == 0))
    {
        return TRUE;
    }
    return FALSE;
}
