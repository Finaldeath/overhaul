void main()
{
   object oMhaere = GetObjectByTag("q2amhaere");
   object oPC = GetPCSpeaker();
   AssignCommand(oMhaere,ClearAllActions());
   AssignCommand(oMhaere,ActionMoveToObject(oPC));
}
