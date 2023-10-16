//* Take fen berry from player and destroy it. A flaming brazier (placeable object)
//* spawns in at one of the spawn points. Using it casts 'Flamestrike' on the nearest
//* enemy of the user. If there is no enemy, it casts it on the user. The brazier has
//* unlimited uses.
void main()
{
    object oItem = GetItemPossessedBy(GetLastSpeaker(),"M2Q1ITFENBERRY");

    ActionTakeItem(oItem,GetLastSpeaker());
    ActionDoCommand(DestroyObject(oItem));
}
