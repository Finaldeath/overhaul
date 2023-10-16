// * moves player to the Past Life trap
#include "M4PlotInclude"
void main()
{
    // * only ONE person can do the past life plot at a time
 if (GetLocalInt(GetModule(), "M3Q1C08_PAST_LIFE_STARTED") == 0)
 {
  object oClicker = GetLastUsedBy();
  object oTarget = GetObjectByTag("M4C08_Inside");
  StripAllEquipmentTo(GetLastUsedBy(), GetNearestObjectByTag("M4Q1C08Chest"));
  CreateItemOnObject("M4Q01C_NOTEBOOK", GetLastUsedBy());
  SetAreaTransitionBMP(AREA_TRANSITION_RANDOM);
  SetLocalInt(GetModule(), "M3Q1C08_PAST_LIFE_STARTED",1) ;
  ResetPastLife(GetLastOpenedBy(), FALSE); // * with deja vu
  AssignCommand(oClicker,JumpToObject(oTarget));
 }
}
