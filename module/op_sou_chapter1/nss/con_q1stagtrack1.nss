int StartingConditional()
{
    if (GetLocalInt(GetModule(),"X1_nBlinkStag") == 1)
        return TRUE;
    return FALSE;
}
