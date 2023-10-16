//::///////////////////////////////////////////////
//:: Alias Leaves
//:: q2a_ali_leavali
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Alias leaves.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan
//:: Created On: Sept. 2003
//:: Edited by: Cori
//:://////////////////////////////////////////////

void main()
{
//    object oAlias = OBJECT_SELF;
    object oArea = GetArea(OBJECT_SELF);
    if(GetTag(oArea)!="q2b")
    {
        object oWay = GetObjectByTag("q2aa_way_entry");
        object oMarket = GetObjectByTag("q2_way_aliashome");
        SetLocalInt(OBJECT_SELF,"OS_ALIASATFOUNTAIN",10);
        ActionMoveToObject(oWay);
        ActionJumpToObject(oMarket);
    }
}
