// Tymofarrar frees Deekin
// and destroys the chest
// act_q5tymo_3
void main()
{
    int nReward = GetLocalInt(OBJECT_SELF, "q5_Rewards_Given");

    SetLocalInt(GetModule(), "q5_Deekin_Free", 1);
    SetLocalInt(OBJECT_SELF, "q5_Rewards_Given", (nReward + 1));
    CreateItemOnObject("q5_Deekin_Shoe", GetPCSpeaker());

    object oChest = GetObjectByTag("q5dragonchest");
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_DUR_PROT_PREMONITION), GetLocation(oChest));
    object oItem = GetFirstItemInInventory(oChest);
    while (oItem != OBJECT_INVALID)
    {
        DestroyObject(oItem);
        oItem = GetNextItemInInventory(oChest);
    }
    DestroyObject(oChest);

}
