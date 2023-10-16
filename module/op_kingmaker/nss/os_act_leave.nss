//::///////////////////////////////////////////////
//:: NPC Leaves
//:: os_act_leave
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    NPC walks away and disappears
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

void main()
{
    //NPC walks away and destroys self
    object oWay = GetNearestObjectByTag("q3_map_exit");
    ActionMoveToObject(oWay);
    ActionDoCommand(DestroyObject(OBJECT_SELF));
}
