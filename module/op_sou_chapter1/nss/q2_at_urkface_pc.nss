void main()
{
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    object oUrko = GetNearestObjectByTag("Q2_URKO");
    AssignCommand(oUrko, SetFacingPoint(GetPosition(oPC)));
    SetFacingPoint(GetPosition(oPC));
}
