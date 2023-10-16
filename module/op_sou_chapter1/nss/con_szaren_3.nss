//The mayor agrees to keep the red wizard
int StartingConditional()
{
    if (GetLocalInt(GetModule(), "X1_THAYQUEST") == 99)
        return TRUE;
    return FALSE;
}
