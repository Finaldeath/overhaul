//::///////////////////////////////////////////////
//:: Death
//:: M2Q5Orc_death
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script counts the number of orcs killed.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: October 9, 2001
//:://////////////////////////////////////////////

void main()
{
    int nOrcDeath = GetLocalInt(GetArea(OBJECT_SELF),"NW_A_M2Q5OrcPatrol");
    if (nOrcDeath == 11)
    {
        AdjustReputation(GetLastAttacker(),OBJECT_SELF,100);
    }
    SetLocalInt(GetArea(OBJECT_SELF),"NW_A_M2Q5OrcPatrol",nOrcDeath + 1);
}
