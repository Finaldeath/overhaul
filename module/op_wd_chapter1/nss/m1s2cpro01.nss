void main()
{
    object oArea = GetObjectByTag("Map_M1S2G");
    object oPC = GetPCSpeaker();
    GiveXPToCreature(oPC,50);
    location lPro = Location(oArea,
                             GetPosition(OBJECT_SELF),
                             GetFacing(OBJECT_SELF));
    location lPC =  Location(oArea,
                             GetPosition(oPC),
                             GetFacing(oPC));
    ActionJumpToLocation(lPro);
    ActionDoCommand(ApplyEffectToObject(DURATION_TYPE_PERMANENT,EffectSleep(),OBJECT_SELF));
    SetCommandable(FALSE);
    AssignCommand(oPC,ActionUnequipItem(GetItemInSlot(INVENTORY_SLOT_CHEST,oPC)));
    AssignCommand(oPC,ActionJumpToLocation(lPC));
}
