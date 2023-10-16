void main()
{
    object oHandmaiden = GetNearestObjectByTag("q2d_handmaiden");
    object oHalaster = GetNearestObjectByTag("q2d_halaster");
    AssignCommand(oHandmaiden, SetFacingPoint(GetPosition(oHalaster)));
    AssignCommand(oHandmaiden, PlayAnimation(ANIMATION_LOOPING_TALK_FORCEFUL, 1.0, 3.0));
}
