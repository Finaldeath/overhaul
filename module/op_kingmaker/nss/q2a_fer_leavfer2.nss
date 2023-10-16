//::///////////////////////////////////////////////
//:: Feran leaves
//:: q2a_fer_leavfer
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Feran leaves.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan
//:: Created On: Sept. 2003
//:://////////////////////////////////////////////

void main()
{
    object oFeran = OBJECT_SELF;
    object oWay = GetObjectByTag("q2ab_way_entry");
    object oKeep = GetObjectByTag("q2ca_feran_office");

    AssignCommand(oFeran,ActionMoveToObject(oWay));
    AssignCommand(oFeran,ActionJumpToObject(oKeep));
}
