//* ettin attacks guard
void main()
{
  AssignCommand(GetNearestObjectByTag("M3Q4_D16HillGiant"),ActionAttack(OBJECT_SELF));
  ActionAttack(GetNearestObjectByTag("M3Q4_D16HillGiant"));
  SetLocalInt(OBJECT_SELF,"M3Q4_L_TALK",0);
  object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
  object oGiant = GetNearestObjectByTag("M3Q4_D16HillGiant");
  AdjustReputation(oPC,oGiant,-100);
}
