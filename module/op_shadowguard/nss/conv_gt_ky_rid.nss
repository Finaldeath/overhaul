int StartingConditional()
{
    object oPC = GetPCSpeaker();

    if (GetLocalInt(oPC, "N_GOT_KEY_RIDDLER") == 1)
        return TRUE;

    return FALSE;
}
