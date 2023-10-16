void main()
{
    SetLocalInt(GetModule(), "NW_G_ALHELOR_PLOT", 50);
    ActionGiveItem(GetItemPossessedBy(OBJECT_SELF,"M2Q1ITALHTOOTH"),GetPCSpeaker());
}
