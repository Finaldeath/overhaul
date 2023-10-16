// Starting conditional for Glendir: After released, when following the player

int StartingConditional()
{
    return GetLocalObject(OBJECT_SELF, "Q3_FOLLOW") != OBJECT_INVALID;
}
