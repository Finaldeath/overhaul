//::///////////////////////////////////////////////
//:: PC needs room
//:: con_gar_noroom
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC has not yet rented a room from the silver lily
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"OS_SILVER_ROOM")==0;
    return iResult;
}
