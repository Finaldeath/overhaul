//The mayor is dead
int StartingConditional()
{
    if (GetLocalInt(GetModule(), "X1_THAYQUEST") == 80)
        return TRUE;
    return FALSE;
}
