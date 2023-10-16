void main()
{

    object oHench = GetHenchman(GetPCSpeaker());
    object oRight = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND,oHench);
    object oLeft = GetItemInSlot(INVENTORY_SLOT_LEFTHAND,oHench);

    SetLocalObject(oHench,"LeftHand",oLeft);
    SetLocalObject(oHench,"RightHand",oRight);
}
