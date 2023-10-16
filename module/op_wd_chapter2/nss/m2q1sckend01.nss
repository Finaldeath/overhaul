// the first time Kendrack is talked to by any PC

int StartingConditional()
{
    int iTalk = GetLocalInt(OBJECT_SELF,"NW_L_TALKTIMES");
    if (iTalk == 0)
    {
        return TRUE;
    }
    return FALSE;
}
