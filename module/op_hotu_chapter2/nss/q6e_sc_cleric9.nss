// Player finsihed first round.

int StartingConditional()
{
    return GetLocalInt(OBJECT_SELF, "ROUND") == 3;
}
