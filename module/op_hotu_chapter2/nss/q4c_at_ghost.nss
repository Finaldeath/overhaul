// Set player as knowing password

void main()
{
    SetLocalInt(GetPCSpeaker(), "X2Q4_KNOW_PASSWORD", 1);
    GiveXPToCreature(GetPCSpeaker(), 250);
    object oGem = GetItemPossessedBy(GetPCSpeaker(), "SoulGem");
    ActionTakeItem(oGem, GetPCSpeaker());
}
