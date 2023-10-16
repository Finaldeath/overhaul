void main()
{
    object oHandmaiden = GetNearestObjectByTag("q2d_handmaiden");
    object oWarrior = GetNearestObjectByTag("q2d_warrior1");
    AssignCommand(oHandmaiden, SetFacingPoint(GetPosition(oWarrior)));
    AssignCommand(oHandmaiden, PlayAnimation(ANIMATION_LOOPING_TALK_FORCEFUL, 1.0, 3.0));
}
