//The NPC gives a plot item to the player (note that the NPC must already be
//carrying said plot item).

void main()
{
    object oPC = GetPCSpeaker();
    object oItem = GetItemPossessedBy(OBJECT_SELF, "IT_PLOT_017");
    ActionGiveItem(oItem, oPC);
}
