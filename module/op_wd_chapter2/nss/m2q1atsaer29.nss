/* Take Fire Beetle Belly,  Spawn in a fire beetle encounter at one of the spawn points.
Spawn in a spider encounter at another. Their factions are hostile to each other.
While their focus is on each other, they cast the occasional fireball and web spells
that players will have to avoid. The surviving faction will teleport away when they are done.*/

void main()
{
    object oItem = GetItemPossessedBy(GetLastSpeaker(),"M2Q1ITFIRBEETBEL");

    ActionTakeItem(oItem,GetLastSpeaker());
    ActionDoCommand(DestroyObject(oItem));
}
