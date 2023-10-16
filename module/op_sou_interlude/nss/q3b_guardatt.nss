// shield guarding should attack if still active

#include "nw_i0_generic"

void main()
{
   object oGuard = GetNearestObjectByTag("NW_SHGUARD");

   if (GetLocalInt(GetLastOpenedBy(),"X1_Q3SHIELDGUARDIAN")==20)
        return;
   object oPC = GetFirstPC();
   while(oPC != OBJECT_INVALID)
   {
       AdjustReputation(oGuard, oPC, -100);
       AdjustReputation(oPC, oGuard, -100);
       oPC = GetNextPC();
   }
   oPC = GetLastOpenedBy();
   AssignCommand(oGuard, DetermineCombatRound(oPC));
}
