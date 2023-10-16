///Give the player tebimar's sword
///Only do this if they don't already have his sword

void main()
{
    //Give PC Reward (Scythe + 5)
    if (GetLocalInt(OBJECT_SELF, "nGiveSecondReward") == 1)
        return;
    SetLocalInt(OBJECT_SELF, "nGiveSecondReward", 1);
///Check if player has Tebimar's sword in inventory
///Give them Tebimar's sword
    object oTebomir = GetObjectByTag("q2amaecapt");
    object oPC = GetPCSpeaker();
    object oWeapon = GetItemPossessedBy(oTebomir, "q2a_teb_scythe");
    DestroyObject(oWeapon);
    CreateItemOnObject("q2a_teb_scythe", oPC);
}
