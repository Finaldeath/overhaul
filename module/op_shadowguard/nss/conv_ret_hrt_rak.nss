int StartingConditional()
{
    object oPC = GetPCSpeaker();

    if (GetLocalInt(oPC, "N_RETRIEVED_HEART_OF_RAKHA") == 1)
        return TRUE;

    return FALSE;
}
