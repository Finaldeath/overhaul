// Leaving queen's cave for very last time: remove all portal bindings.

#include "x0_inc_portal"

int IsInInvalidArea(object oAnchor)
{
    string sTag = GetTag(GetArea(oAnchor));
    return sTag == "q6_NorthernCavern" ||
           sTag == "q6_ShaorisCave" ||
           sTag == "q6_Library" ||
           sTag == "q6e_ShaorisFellTemple" ||
           sTag == "q6f2_ThroneRoom" ||
           sTag == "q6d_wizard_tower1" ||
           sTag == "q6d_wizard_tower2" ||
           sTag == "q6d_wizard_tower3" ||
           sTag == "q6_Castle" ||
           sTag == "q6_ShaorisCave2";
}


void main()
{
  object oClicker = GetClickingObject();
  object oTarget = GetTransitionTarget(OBJECT_SELF);

  SetAreaTransitionBMP(AREA_TRANSITION_RANDOM);
  // remove reaper bindings:
  int i;
  object oAnchor;
  for(i = 1; i <= 5; i++)
  {
     oAnchor = PortalGetAnchor(i, GetFirstPC());
     if(IsInInvalidArea(oAnchor))
         PortalDeleteAnchor(i, GetFirstPC());
  }
  AssignCommand(oClicker,JumpToObject(oTarget));
}
