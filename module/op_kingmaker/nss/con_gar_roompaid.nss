//::///////////////////////////////////////////////
//:: PC paid up
//:: con_gar_roompaid
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC has already paid for his room
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"OS_SILVER_PAID")==10;
    return iResult;
}
