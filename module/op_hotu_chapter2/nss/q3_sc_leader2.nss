// Cordigan's dialog after gong is rang and the player did not got into the temple.

int StartingConditional()
{
    return GetLocalInt(OBJECT_SELF, "STATUS") == 1;
}
