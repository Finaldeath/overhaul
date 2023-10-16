//::///////////////////////////////////////////////
//:: Garrot Leaves
//:: act_gar_postfght
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Garrot goes back to the inn
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

void main()
{
    object oWay = GetObjectByTag("q2_way_garrot");
    SetLocalInt(OBJECT_SELF,"OS_GARROT_HELPED",40);
    ActionJumpToObject(oWay);
}
