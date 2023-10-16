int StartingConditional()
{
    if (GetLocalObject(OBJECT_SELF,"NW_G_M3Q2G_GONG")
        == GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR,PLAYER_CHAR_IS_PC))
    {
        return TRUE;
    }
    return FALSE;
}
