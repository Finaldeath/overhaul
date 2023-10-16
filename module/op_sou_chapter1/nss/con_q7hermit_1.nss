int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(), "X1_Q7TalkedHermitOnce") == 1)
        return TRUE;
    return FALSE;
}
