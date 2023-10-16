//::///////////////////////////////////////////////
//:: Mother Runs Away
//:: q2ab_dyl_runbaby
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The commoner woman runs away from the player
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

void main()
{
    object oBaby = GetNearestObjectByTag("q2ab_common_baby");
    object oWay = GetObjectByTag("q2ab_way_baby");
    AssignCommand(oBaby,ActionMoveToObject(oWay,TRUE));
    AssignCommand(oBaby,ActionDoCommand(DestroyObject(OBJECT_SELF)));
//    SetCommandable(FALSE,oBaby);
}
