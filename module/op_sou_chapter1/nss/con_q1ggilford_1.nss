int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(), "X1_GiveGilford10") < 2)
        return TRUE;
    return FALSE;
}
