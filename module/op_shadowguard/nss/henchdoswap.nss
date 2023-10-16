void main()
{
    object oRight = GetLocalObject(OBJECT_SELF,"RightHand");
    object oLeft = GetLocalObject(OBJECT_SELF,"LeftHand");

    ClearAllActions();
    ActionUnequipItem(oRight);
    ActionUnequipItem(oLeft);
    ActionEquipItem(oLeft,INVENTORY_SLOT_RIGHTHAND);
    ActionEquipItem(oRight,INVENTORY_SLOT_LEFTHAND);
}
