// * Player can never leave
#include "M4PlotInclude"
void main()
{
 // * only ONE person can do the past life plot at a time
  object oClicker = GetLastOpenedBy();
  object oTarget = GetObjectByTag("M4C08_Inside");
  //StripAllEquipmentTo(GetLastUsedBy(), GetNearestObjectByTag("M4Q1C08Chest"));
  ResetPastLife(GetLastOpenedBy(), TRUE); // * with deja vu
  SetAreaTransitionBMP(AREA_TRANSITION_RANDOM);
  AssignCommand(oClicker,JumpToObject(oTarget));
      StripAllEquipmentTo(GetEnteringObject(), GetObjectByTag("M4Q1_INVIS_CHEST"));
          effect eVis = EffectVisualEffect(VFX_IMP_SUNSTRIKE);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, GetLastUsedBy());

    CreateItemOnObject("M4Q01C_NOTEBOOK", GetLastUsedBy());
}
