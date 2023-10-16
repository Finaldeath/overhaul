// Player is still inside the arena (for multiplayer)

int StartingConditional()
{
    return GetLocalInt(OBJECT_SELF, "STATUS") == 2;
}
