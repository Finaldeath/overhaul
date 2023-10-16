//If Piper is dead
int StartingConditional()
{
    if (GetLocalInt(GetModule(), "X1_PIPERQUEST") == 80)
        return TRUE;
    return FALSE;
}
