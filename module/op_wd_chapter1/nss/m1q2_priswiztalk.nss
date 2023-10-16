void main()
{
    object oTalker = GetNearestObjectByTag("m1q2_FormPrisWiz1");

    AssignCommand(oTalker, ActionStartConversation(OBJECT_SELF));

    DestroyObject(OBJECT_SELF);
}
