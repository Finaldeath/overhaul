//con_q6deekin_4
//has PC talked with Tymofarrar - Tymofarrar dead

int StartingConditional()
{
    if (GetLocalInt(GetModule(), "X1_TYMOFARRAR_STATUS") == 3)
        return TRUE;
    return FALSE;
}
