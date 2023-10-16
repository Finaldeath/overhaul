// the PC knows about Tymofarrar

int StartingConditional()
{
    int nKnow = GetLocalInt(GetPCSpeaker(), "Know_Tymo");
    if (nKnow == 1)
    {
        return TRUE;
    }
    return FALSE;
}
