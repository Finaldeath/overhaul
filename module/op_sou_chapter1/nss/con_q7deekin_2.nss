// Deekin is not by the High Forest cave

int StartingConditional()
{
    if (GetLocalInt(GetModule(), "X1_DeekinSpawn") != 4)
        return TRUE;
    return FALSE;
}
