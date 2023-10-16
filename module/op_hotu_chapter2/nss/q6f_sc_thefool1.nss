// When talking to the fool again without all the shards.

int StartingConditional()
{
    return GetLocalInt(OBJECT_SELF, "STATUS") == 1;
}
