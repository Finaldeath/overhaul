int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(), "X1_RumgutSecret") == 1 && GetTag(GetArea(OBJECT_SELF)) == "q1rumgutcave")
        return TRUE;
    return FALSE;
}
