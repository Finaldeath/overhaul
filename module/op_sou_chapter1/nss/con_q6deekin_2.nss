int StartingConditional()
{
    object oPC = GetPCSpeaker();
    if (GetLocalInt(oPC, "X1_DeekinNotInBlumberg") == 0)
        return TRUE;
    return FALSE;
}
