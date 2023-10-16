/* Take Quartz Crystal, Spawn in an angel encounter at one of the spawn points.
Spawn in a demon encounter at another. Their factions are hostile to each other.
Once all of one faction is dead, the opposing faction 'teleports' away. */
void main()
{
    object oItem = GetItemPossessedBy(GetLastSpeaker(),"M2Q1ITQUARTZCRYS");

    ActionTakeItem(oItem,GetLastSpeaker());
    ActionDoCommand(DestroyObject(oItem));
}
