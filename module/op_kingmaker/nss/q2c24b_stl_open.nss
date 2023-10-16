//::///////////////////////////////////////////////
//:: Open Stiletto's Cell
//:: q2c24b_stl_open
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Opens Stiletto's cell door
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    object oPicks1 = GetItemPossessedBy(oPC,"NW_IT_PICKS001");
    object oPicks3 = GetItemPossessedBy(oPC,"NW_IT_PICKS002");
    object oPicks6 = GetItemPossessedBy(oPC,"NW_IT_PICKS003");
    object oPicks8 = GetItemPossessedBy(oPC,"X2_IT_PICKS001");
    object oPicks10 = GetItemPossessedBy(oPC,"NW_IT_PICKS004");
    object oPicks12 = GetItemPossessedBy(oPC,"X2_IT_PICKS002");
    object oDoor = GetObjectByTag("q2c24b_door_stil");
    if(GetIsObjectValid(oPicks1))
    {
        DestroyObject(oPicks1);
    }
    else if(GetIsObjectValid(oPicks3))
    {
        DestroyObject(oPicks3);
    }
    else if(GetIsObjectValid(oPicks6))
    {
        DestroyObject(oPicks6);
    }
    else if(GetIsObjectValid(oPicks8))
    {
        DestroyObject(oPicks8);
    }
    else if(GetIsObjectValid(oPicks10))
    {
        DestroyObject(oPicks10);
    }
    else if(GetIsObjectValid(oPicks12))
    {
        DestroyObject(oPicks12);
    }
    SetLocalInt(OBJECT_SELF,"OS_STIL_FREE",10);
    SetLocked(oDoor,FALSE);
    ActionPauseConversation();
    ActionOpenDoor(oDoor);
    ActionResumeConversation();
}
