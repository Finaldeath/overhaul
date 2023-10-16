//return true if  the thaymart quest is done
int StartingConditional()
{
    if (GetLocalInt(GetModule(), "X1_SZARENDONE") == 10)
        return TRUE;
    return FALSE;
}

