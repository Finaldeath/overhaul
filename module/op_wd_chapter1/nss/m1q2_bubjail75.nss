int StartingConditional()
{
    return GetLocalInt(OBJECT_SELF, "SetFree") == FALSE &&
           Random(2) == 0;
}
