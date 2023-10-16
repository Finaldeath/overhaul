void main()
{
    object oTooth = GetItemPossessedBy(OBJECT_SELF,"M1Q3A00TOOTH");
    ActionGiveItem(oTooth,GetPCSpeaker());
}
