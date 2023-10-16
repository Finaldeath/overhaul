#include "x2_inc_globals"

void main()
{
   //SetGlobalInt("Beholder Plot Started", 10);
   ExecuteScript("x2_c2_end", GetPCSpeaker());
   object oTarget = GetWaypointByTag("wp_q2atempleexit");
   object oPC = GetPCSpeaker();
   AssignCommand(oPC, JumpToObject(oTarget));
}

