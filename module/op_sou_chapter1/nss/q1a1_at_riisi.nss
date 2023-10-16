////////////////////////////////////////////////////////////
// OnClick/OnAreaTransitionClick  - No monsters!!!
// NW_G0_Transition.nss
// Copyright (c) 2001 Bioware Corp.
////////////////////////////////////////////////////////////
//
////////////////////////////////////////////////////////////

void main()
{
    object oClicker = GetClickingObject();

    if (GetLocalInt(GetModule(), "X1_Q1AAYALATALK") != 1)
    {
        FloatingTextStrRefOnCreature(40416, oClicker);

    }
    else
    {
        SetImmortal(oClicker, FALSE);
        if (GetIsPC(oClicker) || GetIsPC(GetMaster(oClicker)) == TRUE)
        {
            object oTarget = GetTransitionTarget(OBJECT_SELF);

            SetAreaTransitionBMP(AREA_TRANSITION_RANDOM);

            AssignCommand(oClicker,JumpToObject(oTarget));
        }
    }
  // * Only PC's or associates of pc's can do this

 /* else
  This turned out to be unnecessary since GetIsPC returns true
  if a player controlled, which includes familiars.
  // * This is an NPC attempting to cross the transition
  // * Clear all actions on it (to prevent system
  // * resource eating by a creature trying to cross
  // * an area transition that it can't
  {
    AssignCommand(oClicker, ClearAllActions());
  }
  */
}
