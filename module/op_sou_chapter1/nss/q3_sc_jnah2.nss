// Starting conditional for J'Nah: only if PC went to Blumberg and found Deekin gone.

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    if (GetLocalInt(oPC, "X1_DeekinNotInBlumberg") == 1)
        return TRUE;
    return FALSE;
}
