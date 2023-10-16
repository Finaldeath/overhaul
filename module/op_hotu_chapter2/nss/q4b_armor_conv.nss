// Give player the armor and helmet and destroy object

void main()
{
    object oPC = GetLastSpeaker();
    AssignCommand(oPC, ClearAllActions(TRUE));
    ClearAllActions(TRUE);
    object oHelmet = GetItemInSlot(INVENTORY_SLOT_CHEST);
    object oArmor = GetItemInSlot(INVENTORY_SLOT_HEAD);
    CopyObject(oHelmet, GetLocation(oPC), oPC);
    CopyObject(oArmor, GetLocation(oPC), oPC);
    DestroyObject(OBJECT_SELF);
}
