// Maker's sanctum area on-enter

void AutoSave()
{
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_AUTOSAVE_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_AUTOSAVE_ONCE", 1);

    DoSinglePlayerAutoSave();
}

void GenerateArcaneTreasure()
{
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_WIZ_LOOT_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_WIZ_LOOT_ONCE", 1);

    object oChest1 = GetObjectByTag("q4d_bookcase");

    CreateItemOnObject("theguardianguide", oChest1);
    CreateItemOnObject("magicsofgolemenh", oChest1);

}

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;

    int nSorc = GetLevelByClass(CLASS_TYPE_WIZARD, oPC);
    int nWiz = GetLevelByClass(CLASS_TYPE_SORCERER, oPC);

    if(nSorc >= 5 || nWiz >= 5)
        GenerateArcaneTreasure();
    AutoSave();
}
