// Player is fighting Sabal.

int StartingConditional()
{
    return GetLocalInt(OBJECT_SELF, "STATUS") == 3;
}
