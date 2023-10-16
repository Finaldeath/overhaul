//::///////////////////////////////////////////////
//:: Dolin Leaves
//:: act_dsc_leave
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Dolin walks away and disappears
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

void main()
{
    //dwarf walks away and destroys self
    object oWay = GetNearestObjectByTag("q3_map_exit");
    ActionMoveToObject(oWay, TRUE);
    ActionDoCommand(DestroyObject(OBJECT_SELF));
}
