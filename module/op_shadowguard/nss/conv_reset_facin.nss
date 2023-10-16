void main()
{
    float fFacing = GetLocalFloat(OBJECT_SELF, "F_FACING");

    AssignCommand(OBJECT_SELF, SetFacing(fFacing));
}
