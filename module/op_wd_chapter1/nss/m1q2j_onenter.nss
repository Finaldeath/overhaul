void main()
{
   object oMarty = GetObjectByTag("M1Q02Cmarty");
   object oMirinelle = GetObjectByTag("m1q2_Mirinelle");

   if (GetIsObjectValid(oMarty) && GetIsObjectValid(oMirinelle))
   {
      if (GetObjectSeen(oMarty, oMirinelle) && !GetIsInCombat(oMarty))
      {
          DelayCommand(1.0, AssignCommand(oMarty, ActionStartConversation(oMirinelle)));
      }
   }
}
