int StartingConditional()
{
    int iGave = GetLocalInt(GetPCSpeaker(),"HARLOT01_LIKES");
    if (iGave == 1)
    {
        return TRUE;
    }
    return FALSE;
}
