int StartingConditional()
{
    object oPC = GetPCSpeaker();

    if (GetLocalInt(oPC, "N_PREL_SET_UP_LYEN") == 0)
        return TRUE;

    return FALSE;
}
