// * spawn note and then
void main()
{
    SetLocalInt(GetModule(), "NW_G_WRITENOTE", 3);
    CreateItemOnObject("NW_M4Q01C08_SPYN", GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC));
}
