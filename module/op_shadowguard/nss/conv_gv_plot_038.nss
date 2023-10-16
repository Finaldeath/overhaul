void main()
{
    object oPC = GetPCSpeaker();

    object oItem = GetItemPossessedBy(OBJECT_SELF, "IT_PLOT_038");

    AssignCommand(OBJECT_SELF, ActionGiveItem(oItem, oPC));
}
