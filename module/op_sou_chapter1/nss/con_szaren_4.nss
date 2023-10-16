//The mayor doesn't want the red wizards..
int StartingConditional()
{
    if (GetLocalInt(GetModule(), "X1_THAYQUEST") == 15)
        return TRUE;
    return FALSE;
}
