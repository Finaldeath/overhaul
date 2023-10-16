void main()
{
    object oCP = GetNearestObjectByTag("CT_UNIQ_NT_CRIM");

    object o = GetNearestObjectByTag("CT_UNIQ_SH_HARK");

    AssignCommand(o, ActionEquipMostDamagingMelee());
    AssignCommand(o, ActionMoveToObject(oCP, TRUE));
}
