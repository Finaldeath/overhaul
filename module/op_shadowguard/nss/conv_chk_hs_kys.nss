int StartingConditional()
{
    object oPC = GetPCSpeaker();

    if (GetLocalInt(oPC, "N_GOT_SAKARA_KEY") == 1)
        return TRUE;

    return FALSE;
}
