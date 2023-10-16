// Starting conditional for J'Nah: the dragon is dead

int StartingConditional()
{
    return GetLocalInt(GetModule(), "X1_TYMOFARRAR_STATUS") == 3;
}
