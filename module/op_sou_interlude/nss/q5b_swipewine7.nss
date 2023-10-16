// the player steals the bottle

void main()
{
    SetLocalInt(OBJECT_SELF, "q5b_Bottle_Gone", 1);
    CreateItemOnObject("q5b_bottle", GetPCSpeaker());
}
