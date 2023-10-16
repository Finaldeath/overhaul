void main()
{
    object oChair = GetObjectByTag("q1gmayorchair");
    AssignCommand(OBJECT_SELF, ActionSit(oChair));
}
