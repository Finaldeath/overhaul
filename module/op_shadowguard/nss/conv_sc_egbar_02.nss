int StartingConditional()
{
    object oPC = GetPCSpeaker();

    if (GetLocalInt(oPC, "N_EGBAR_TOLD_OF_BODY") == 0)
        return TRUE;

    return FALSE;
}
