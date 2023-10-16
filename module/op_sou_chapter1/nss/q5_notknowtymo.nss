// the PC does not know about Tymofarrar

int StartingConditional()
{
    int nKnow = GetLocalInt(GetPCSpeaker(), "Know_Tymo");
    if (nKnow == 0)
    {
        return TRUE;
    }
    return FALSE;
}
