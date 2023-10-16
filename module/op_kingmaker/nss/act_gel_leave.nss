//::///////////////////////////////////////////////
//:: Gelani leaves for the Merchant Guild office
//:: act_gel_leave
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Gelani leaves for the Merchant Guild office
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

void main()
{
//Gelani leaves and goes to the guild office
    object oDoor = GetObjectByTag("q2_way_gelexit");
    object oWay = GetObjectByTag("q2_way_merchoff");
    ActionMoveToObject(oDoor);
    ActionJumpToObject(oWay);
}
