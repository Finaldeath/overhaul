int StartingConditional()
{
    object oPC = GetPCSpeaker();

    if (GetLocalInt(oPC, "N_HEARD_RIDDLERS_RIDDLE") == 1)
        return TRUE;

    return FALSE;
}
