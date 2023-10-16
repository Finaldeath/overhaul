//::///////////////////////////////////////////////
//:: Make Golems
//:: 2Q6_MakeGolem
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the PC puts a control rod in the slot the
    golem wakes up and moves out to attack
    nearby enemies in other rooms.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 24, 2004
//:://////////////////////////////////////////////
#include "NW_I0_HOSTINCL"
void main()
{
    object oWay = GetNearestObjectByTag("2Q6E_GolemSpawn");
    int nCnt, nIdx;
    object oRod1, oRod2;
    object oItem = GetFirstItemInInventory();

    while(GetIsObjectValid(oItem))
    {
        if(GetTag(oItem) == "2Q6E_ControlRod")
        {
            oRod1 = oItem;
            nIdx = 1;
        }
        if(GetTag(oItem) == "2Q6E_GolemRod")
        {
            oRod2 = oItem;
            nCnt = 1;
        }
        oItem = GetNextItemInInventory();
    }
    if(nCnt == 1 && nIdx == 1)
    {
        CreateObject(OBJECT_TYPE_CREATURE, "2Q6_HELMHORROR", GetLocation(oWay), TRUE);
        DestroyObject(oRod1, 0.0);
        DestroyObject(oRod2, 0.0);
    }
}
