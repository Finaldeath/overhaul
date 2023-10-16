// Player accepted the challenge, but did not pull a chain yet

int StartingConditional()
{
    return GetLocalInt(OBJECT_SELF, "STATUS") == 1;
}
