// * returns true if language is still in beholder tongue
int StartingConditional()
{
    if (GetLocalInt(GetModule(), "X2_L_LANGUAGE") == 0)
    {
        return TRUE;
    }
    return FALSE;
}
