//:://////////////////////////////////////////////////
//:: q2b_death_dragon
/*
  Open the dragon's door upon its death.

 */
//:://////////////////////////////////////////////////
//:: Copyright (c) 2002 Floodgate Entertainment
//:: Created By: Naomi Novik
//:: Created On: 12/22/2002
//:://////////////////////////////////////////////////

#include "x2_inc_compon"


void main()
{
    object oKiller = GetLastKiller();
    if (GetLocalInt(OBJECT_SELF, "nDieOnce") == 1)
        return;

    object oDoor = GetObjectByTag("q2bdragondoor");
    SetLocked(oDoor, FALSE);
    AssignCommand(oDoor, ActionOpenDoor(oDoor));

    object oDoor2 = GetObjectByTag("q2bgrimdoor");
    SetLocked(oDoor2, FALSE);
    AssignCommand(oDoor2, ActionOpenDoor(oDoor2));


    craft_drop_items(oKiller);
}
