// Starting conditional for J'Nah: dragon asked to kill J'Nah

int StartingConditional()
{
    return GetLocalInt(GetModule(), "X1_TYMOFARRAR_STATUS") == 2;
}
