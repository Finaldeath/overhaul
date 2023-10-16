// Tymofarrar has already rewarded with gold and magic twice

void main()
{
    int nReward = GetLocalInt(OBJECT_SELF, "q5_Rewards_Given");
    object oPC = GetPCSpeaker();
    GiveGoldToCreature(oPC, 300);
    CreateItemOnObject("x0_it_mthnmisc16", oPC);
    CreateItemOnObject("nw_it_mring013", oPC);

    SetLocalInt(OBJECT_SELF, "q5_Gave_Gold", 2);
    SetLocalInt(OBJECT_SELF, "q5_Rewards_Given", (nReward + 1));
}
