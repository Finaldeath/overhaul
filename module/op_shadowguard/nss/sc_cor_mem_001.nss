void main()
{
    object oPC = GetPCSpeaker();

    object oCP = GetNearestObjectByTag("CT_UNIQ_NT_CRIM", oPC);

    object oOkar = GetNearestObjectByTag("CT_UNIQ_NT_OKAR", oPC);

    AssignCommand(oCP, ActionMoveToObject(oOkar));
}
