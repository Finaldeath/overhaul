void main()
{
object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);

     ClearAllActions();
     SetLocalInt(OBJECT_SELF,"M2Q1WyvernSurrender",2);
     AdjustReputation(oPC,OBJECT_SELF,50);
}
