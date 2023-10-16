void main()
{
    object oHarkon = GetNearestObjectByTag("CT_UNIQ_SH_HARK");

    AssignCommand(OBJECT_SELF, ActionMoveToObject(oHarkon));
}
