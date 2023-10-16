// Player completed last round of the challenge

int StartingConditional()
{
    return GetLocalInt(OBJECT_SELF, "STATUS") == 3;
}
