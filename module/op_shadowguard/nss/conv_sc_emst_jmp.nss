//Jump Lyen to you so that the conversation doesn't break

void main()
{
    object oLyen = GetNearestObjectByTag("HENCH_LYEN");
    AssignCommand(oLyen, JumpToObject(OBJECT_SELF));
}
