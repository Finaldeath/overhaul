//::///////////////////////////////////////////////
//:: Feran Leaves
//:: act_fer_findlove
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Feran goes to find Ellysia
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: September 2003
//:://////////////////////////////////////////////

void main()
{
    object oWay = GetNearestObjectByTag("q2_way_ferexit");
    object oElly = GetObjectByTag("q2_ellysia");
    ActionMoveToObject(oWay);
    ActionJumpToObject(oElly);
}
