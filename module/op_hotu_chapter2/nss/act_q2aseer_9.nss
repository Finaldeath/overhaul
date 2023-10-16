void main()
{
    object oPC = GetPCSpeaker();
    object oValen = GetObjectByTag("x2_hen_valen");
    AssignCommand(oValen, ActionMoveToObject(oPC, FALSE, 5.0));
}
