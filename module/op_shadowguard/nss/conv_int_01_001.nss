void main()
{
    object oPC = GetPCSpeaker();

    object oVhorkas = GetNearestObjectByTag("CT_UNIQ_SH_VHOR");

    AssignCommand(oVhorkas, ActionMoveToObject(oPC));
}
