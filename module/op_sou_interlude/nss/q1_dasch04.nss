// if this is the first time Daschnaya has been spoken to

int StartingConditional()
{
    int nSpoke = GetLocalInt(GetPCSpeaker(), "qI1_Spoke_Daschnaya");
    if (nSpoke == 0)
    {
        SetLocalInt(GetPCSpeaker(), "qI1_Spoke_Daschnaya", 1);
        return TRUE;
    }
    return FALSE;
}
