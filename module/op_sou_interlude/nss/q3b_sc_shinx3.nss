// only if Grey Slaad is still alive.

int StartingConditional()
{
    return GetNearestObjectByTag("NW_SLAADGRAY") != OBJECT_INVALID;
}
