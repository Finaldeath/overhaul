//:://////////////////////////////////////////////////
//:: NW_C2_DEFAULT7
/*
  Default OnDeath event handler for NPCs.

  Adjusts killer's alignment if appropriate and
  alerts allies to our death.
 */
//:://////////////////////////////////////////////////
//:: Copyright (c) 2002 Floodgate Entertainment
//:: Created By: Naomi Novik
//:: Created On: 12/22/2002
//:://////////////////////////////////////////////////

#include "x0_i0_spawncond"

void main()
{
    // destroy trap if both gargoyls are destroyed
    string sTrap = GetStringRight(GetTag(OBJECT_SELF), 9);
    object oTrap = GetNearestObjectByTag(sTrap);
    int nStatus = GetLocalInt(oTrap, "ONE_DOWN");
    if(nStatus > 0) // the other statue set it to greater the 0 -> I am the second -> remove the trap
        DestroyObject(oTrap);
    else
        SetLocalInt(oTrap, "ONE_DOWN", 1);
}
