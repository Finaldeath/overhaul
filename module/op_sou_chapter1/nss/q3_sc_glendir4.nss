// Starting conditional for Glendir: Glendir is not currently following the PC

int StartingConditional()
{
    return GetLocalObject(OBJECT_SELF, "Q3_FOLLOW") == OBJECT_INVALID;
}
