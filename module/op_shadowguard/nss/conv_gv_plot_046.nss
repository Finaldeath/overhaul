void main()
{
    object oPC = GetPCSpeaker();

    object oItem = GetItemPossessedBy(OBJECT_SELF, "IT_PLOT_046");

    AssignCommand(OBJECT_SELF, ActionGiveItem(oItem, oPC));
}
