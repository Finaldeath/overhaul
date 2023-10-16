int StartingConditional()
{
    object oRope = GetLocalObject(OBJECT_SELF, "O_ROPE");

    if (oRope == OBJECT_INVALID)
        return FALSE;

    return TRUE;
}
