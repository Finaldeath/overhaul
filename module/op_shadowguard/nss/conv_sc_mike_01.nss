int StartingConditional()
{
    object oPC = GetPCSpeaker();

    if (GetLocalInt(oPC, "N_RATTED_MIKE") == 1)
        return TRUE;

    return FALSE;
}
