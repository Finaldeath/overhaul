//con_q6deekin_3
//has PC talked with Tymofarrar

int StartingConditional()
{
    if (GetLocalInt(GetModule(), "X1_TYMOFARRAR_STATUS") == 1 || GetLocalInt(GetModule(), "X1_TYMOFARRAR_STATUS") == 2)
        return TRUE;
    return FALSE;
}
