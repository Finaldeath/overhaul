//Open the focus table's inventory for the PC
void main()
{
    object oTable = GetObjectByTag("q1a2focustableinv");

    object oPC = GetPCSpeaker();

    AssignCommand(oPC, DoPlaceableObjectAction(oTable, PLACEABLE_ACTION_USE));
}
