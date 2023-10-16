// returns TRUE if the player has a black pearl.

int StartingConditional()
{
    object oGem = GetItemPossessedBy(GetPCSpeaker(), "BlackPearl");
    SetLocalObject(OBJECT_SELF, "GEM", oGem);
    return oGem != OBJECT_INVALID;

}
