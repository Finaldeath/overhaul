int StartingConditional()
{
    object oPC = GetPCSpeaker();

    if (GetHenchman(oPC) != OBJECT_INVALID)
        return TRUE;

    return FALSE;
}
