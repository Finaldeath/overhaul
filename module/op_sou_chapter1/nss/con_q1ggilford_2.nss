int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(), "X1_GiveGilford100") < 2)
        return TRUE;
    return FALSE;
}
