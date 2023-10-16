void main()
{
    ActionGiveItem(GetItemPossessedBy(OBJECT_SELF,"M2Q1ITGEMSETARA"),GetLastSpeaker());
    SignalEvent(GetObjectByTag("M2Q2JSetaraChest"),EventUserDefined(200));
}
