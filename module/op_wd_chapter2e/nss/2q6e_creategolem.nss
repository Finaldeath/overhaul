//::///////////////////////////////////////////////
//:: Create Helmed Horror
//:: 2q6e_creategolem
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If locals are true create the golem.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: April 7, 2002
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    int nRod = GetLocalInt(OBJECT_SELF, "NW_2Q6E_REPLICATION_ROD");
    int nControl = GetLocalInt(OBJECT_SELF, "NW_2Q6E_CONTROL_ROD");

    if(nRod == TRUE && nControl == TRUE)
    {
        object oWay = GetNearestObjectByTag("2Q6E_GolemSpawn");
        CreateObject(OBJECT_TYPE_CREATURE, "2Q6_HELMHORROR", GetLocation(oWay), TRUE);
        SetLocalInt(OBJECT_SELF, "NW_2Q6E_REPLICATION_ROD", 100);
        RewardXP("2q6e_golem_made",100, GetPCSpeaker());
    }
}
