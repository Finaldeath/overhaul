void main()
{
    object oWP = GetNearestObjectByTag("WP_CONSTRUCT_FACE");

    AssignCommand(OBJECT_SELF, SetFacing(GetFacing(oWP)));
}
