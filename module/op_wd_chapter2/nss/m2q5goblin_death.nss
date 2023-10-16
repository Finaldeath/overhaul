//::///////////////////////////////////////////////
//:: Death
//:: M2Q5Goblin_Death
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script is used to count the number of goblin
    deaths.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: October 9, 2001
//:://////////////////////////////////////////////

void main()
{
    int nGoblinDeath = GetLocalInt(GetArea(OBJECT_SELF),"NW_A_M2Q5GoblinPatrol");
    if (nGoblinDeath == 11)
    {
        SetLocalInt(GetArea(OBJECT_SELF),"NW_A_GoblinAlarm",20);
        AdjustReputation(GetLastAttacker(),OBJECT_SELF,100);
    }
    SetLocalInt(GetArea(OBJECT_SELF),"NW_A_M2Q5GoblinPatrol",nGoblinDeath + 1);
}
