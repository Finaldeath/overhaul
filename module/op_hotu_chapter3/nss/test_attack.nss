void main()
{
   object oBessy = GetObjectByTag("q4a_bessy_ox");
   object oBoulder = GetObjectByTag("q4a_boulder");

   AssignCommand(oBessy, ActionAttack(oBoulder));
}
