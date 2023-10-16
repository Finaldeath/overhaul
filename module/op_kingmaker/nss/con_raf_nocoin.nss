//::///////////////////////////////////////////////
//:: Ask About coin
//:: con_raf_nocoin
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC has never asked about Rafael's coin before
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"OS_RAFAEL_COIN")==0;
    return iResult;
}
