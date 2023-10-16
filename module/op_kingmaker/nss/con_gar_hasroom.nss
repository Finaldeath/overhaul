//::///////////////////////////////////////////////
//:: PC has room
//:: con_gar_hasroom
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC already has a room at the Silver Lily
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"OS_SILVER_ROOM")==10;
    return iResult;
}
