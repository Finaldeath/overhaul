// Starting conditional for Glendir: when Glendir gets in sight of the exit while he is following the PC
// Glendir will init dialogue

int StartingConditional()
{
    return GetLocalInt(OBJECT_SELF, "Q3_GOT_TO_EXIT") == 1;
}
