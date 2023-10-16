// Starting conditional for Zidan: Zidan is currently following the PC

int StartingConditional()
{
    return GetLocalObject(OBJECT_SELF, "Q3_FOLLOW") != OBJECT_INVALID;
}
