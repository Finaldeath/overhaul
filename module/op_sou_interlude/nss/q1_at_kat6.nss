// Katriana action taken: Torias and Katriana turn to face each other

void main()
{
    object oTorias = GetNearestObjectByTag("Q1_TORIAS");
    AssignCommand(oTorias, SetFacingPoint(GetPosition(OBJECT_SELF)));
    AssignCommand(OBJECT_SELF, SetFacingPoint(GetPosition(oTorias)));
}
