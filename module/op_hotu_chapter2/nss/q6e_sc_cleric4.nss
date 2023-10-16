// Talking after returning to the temple while the challenge is still active.

int StartingConditional()
{
    return GetLocalInt(OBJECT_SELF, "STATUS") == 4;
}
