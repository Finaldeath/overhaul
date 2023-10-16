int StartingConditional()
{
    AssignCommand(OBJECT_SELF, ClearAllActions());

    SetLocalInt(OBJECT_SELF, "N_CURRENTLY_TALKING", 1);

    return FALSE;
}
