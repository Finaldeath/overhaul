// if there is something in the PC's Deity field

int StartingConditional()
{
    string sDeity = GetDeity(GetPCSpeaker());
    if (sDeity != "")
    {
        return TRUE;
    }
    return FALSE;
}
