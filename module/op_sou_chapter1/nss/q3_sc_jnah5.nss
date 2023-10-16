// Starting conditional for J'Nah: chief told player that J'Nah has the tooth

int StartingConditional()
{
    return GetLocalInt(GetPCSpeaker(), "X1_KNOW_ABOUT_TOOTH") == 1;
}
