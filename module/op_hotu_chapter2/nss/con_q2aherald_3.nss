//con_q2aherald_3
int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "nHeralding") == 0)
        return TRUE;
    return FALSE;
}
