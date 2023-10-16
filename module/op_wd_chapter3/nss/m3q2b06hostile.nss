// * This line will only ever play once
// * guzud goes hostile

#include "NW_I0_GENERIC"
int StartingConditional()
{
 if (GetLocalInt(OBJECT_SELF,"NW_L_TALKTIMES")  == 0)
 {
   SetLocalInt(OBJECT_SELF,"NW_L_TALKTIMES",GetLocalInt(OBJECT_SELF,"NW_L_TALKTIMES") + 1);
   ChangeToStandardFaction(OBJECT_SELF,STANDARD_FACTION_HOSTILE);
   DetermineCombatRound();
   return TRUE;
 }
 return FALSE;
}




