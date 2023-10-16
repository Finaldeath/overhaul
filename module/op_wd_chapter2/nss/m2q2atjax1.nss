//* Take 200 Gold from Player, Give them Temple Key
void main()
{
    ActionGiveItem(GetItemPossessedBy(OBJECT_SELF,"M2Q2ITKEYTEMPLE"),GetLastSpeaker());
}
