// the PC has no levels in Cleric or Paladin

int StartingConditional()
{
    if (GetLevelByClass(CLASS_TYPE_CLERIC, GetFirstPC()) == 0
    && GetLevelByClass(CLASS_TYPE_PALADIN, GetFirstPC()) == 0)
        return TRUE;
    return FALSE;
}
