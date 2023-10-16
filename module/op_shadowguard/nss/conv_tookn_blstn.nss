int StartingConditional()
{
    object oPC = GetPCSpeaker();

    if (GetLocalInt(oPC, "N_TOOK_BLOODSTONE") == 1)
        return FALSE;

    return TRUE;
}
