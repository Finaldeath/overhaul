// Finds the nearest chair with the correct tag for
// the NPC, and causes them to sit down
// Chairs are tagged by "PT_" + <Tag of NPC object>

void main()
{
    AssignCommand(OBJECT_SELF, SetFacing(GetFacing(OBJECT_SELF)));

    string s = "PT_" + GetTag(OBJECT_SELF);

    AssignCommand(OBJECT_SELF, ActionSit(GetNearestObjectByTag(s)));
}
