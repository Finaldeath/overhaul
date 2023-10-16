// Starting conditional for Glendir: After released, after player agreed to let him follow

int StartingConditional()
{
    return GetLocalInt(OBJECT_SELF, "Q3_ALLOWED_TO_FOLLOW") == 1;
}
