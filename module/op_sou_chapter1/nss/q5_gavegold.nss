// Tymofarrar has already rewarded with gold and magic

void main()
{
    int nReward = GetLocalInt(OBJECT_SELF, "q5_Rewards_Given");
    object oPC = GetPCSpeaker();
    GiveGoldToCreature(oPC, 500);
    CreateItemOnObject("nw_it_mboots001", oPC);

    SetLocalInt(OBJECT_SELF, "q5_Gave_Gold", 1);
    SetLocalInt(OBJECT_SELF, "q5_Rewards_Given", (nReward + 1));
}
