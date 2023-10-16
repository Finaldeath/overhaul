// Player completed one round of the challenge (killed a monster)

int StartingConditional()
{
    return GetLocalInt(OBJECT_SELF, "STATUS") == 6;
}
