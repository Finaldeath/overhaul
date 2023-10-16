// the herbalist gives the PC some gold and XP
// the PC has tried to bilk the herbalist already

void main()
{
    SetLocalInt(OBJECT_SELF, "q1h_bilked", 1);
    GiveGoldToCreature(GetPCSpeaker(), 100);
    //GiveXPToCreature(GetPCSpeaker(), 50);
}

