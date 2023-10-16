int StartingConditional()
{
    if (GetLocalInt(GetModule(), "X1_DeekinSpawn") == 3)
        return TRUE;
    return FALSE;
}
