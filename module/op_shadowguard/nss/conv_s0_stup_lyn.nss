int StartingConditional()
{
    object oPC = GetPCSpeaker();

    if (GetLocalInt(oPC, "N_PREL_SET_UP_LYEN") == 1)
        return TRUE;

    return FALSE;
}
