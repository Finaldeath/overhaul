//Return FALSE if this is a swordsman
//Return TRUE if it is a Cleric or Marksman
int StartingConditional()
{
    if (GetStringLeft(GetTag(OBJECT_SELF), 11) == "q2abat1reb1")
        return FALSE;
    return TRUE;
}
