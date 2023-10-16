// First time talking to the fool AND the player and Sabal have all the shards
// The player should carry all the shards he found


int StartingConditional()
{
    int nStatus = GetLocalInt(OBJECT_SELF, "STATUS");
    object oSabal = GetNearestObjectByTag("q6_sabal");
    return nStatus == 0 && oSabal != OBJECT_INVALID;
}
