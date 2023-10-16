//::///////////////////////////////////////////////
//:: Destroy the catapult
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
 Destroys the catapult and increments the number of catapults dead global
 AND sets the other global to 1 if all destroyed

*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: April 23, 2002
//:://////////////////////////////////////////////

#include "nw_i0_plot"

void main()
{
    // CreateObject
    int nNumber = GetLocalInt(GetModule(),"NW_G_M4Q01_CATAPULTS");
    nNumber = nNumber + 1;
    SetLocalInt(GetModule(),"NW_G_M4Q01_CATAPULTS", nNumber);
    object oKiller = GetLastUsedBy();
    RewardXP("M4Q01_SIEGE",16,oKiller);

    if (nNumber >= 3 && GetLocalInt(GetModule(),"NW_G_GOLEMS_KILLED") < 2)
    {
        AddJournalQuestEntry("M4Q01_SIEGE",25,oKiller);
    }
    else if(nNumber >= 3 && GetLocalInt(GetModule(),"NW_G_GOLEMS_KILLED") >= 2)
    {
        AddJournalQuestEntry("M4Q01_SIEGE",35,oKiller);
    }

    // * Hack.  LOCKED siege weapons are ballista
    CreateObject(OBJECT_TYPE_PLACEABLE,"M4_CATAPULTBROKE",GetLocation(OBJECT_SELF));
//    SetPlotFlag(OBJECT_SELF,FALSE);
    DestroyObject(OBJECT_SELF);
    effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_1);
    location lVis = GetLocation(OBJECT_SELF);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eVis,lVis);
}

