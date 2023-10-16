//::///////////////////////////////////////////////
//:: Gru'ul the Quarry Boss, Give Quest (Action Script)
//:: H2a_Gruul_Give_Q.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Disables Quarry Grinder 5 and spawns in Lazy
     the Imp.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Edited By: Brad Prince
//:: Created On: July 21, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void SpawnLazy(location lLoc)
{
    CreateObject(OBJECT_TYPE_CREATURE, "h2_lazy", lLoc, TRUE);
    //CreateObject(OBJECT_TYPE_PLACEABLE, "h2_lazy", lLoc);
}
void SetupLazy()
{
    object oLazy = GetObjectByTag("H2_LazyBody");
    effect eEffect = GetFirstEffect(oLazy);

    while(GetIsEffectValid(eEffect))
    {
        if(GetEffectCreator(eEffect) == GetModule())
        {
            // Debug.
            //SendMessageToPC(GetFirstPC(), "Removed");
            RemoveEffect(oLazy, eEffect);
        }
        eEffect = GetNextEffect(oLazy);
    }
}
void main()
{
    //Deactivate Quarry Grinder 5
    object oGrinder5 = GetObjectByTag("QuarryGrinder5");
    SetLocalInt(oGrinder5, "bActivated", FALSE);
    SetLocalInt(oGrinder5, "bImpInGrinder", TRUE);

    //Move it out of the way so that Lazy doesn't get bumped out of place.
    //location lGrinder5 = GetLocation(oGrinder5);
    //object oBumpPoint = GetObjectByTag("WP_Grinder5Bump");
    //AssignCommand(oGrinder5, JumpToObject(oBumpPoint));

    //Spawn in Lazy the Imp beside it (both the creature and the invisible placeable).
    object oLazySpawn = GetObjectByTag("WP_Lazy");
    location lLoc = GetLocation(oLazySpawn);
    DelayCommand(2.0, SpawnLazy(lLoc));

    //Return Grinder 5 to its original position after a brief delay.
    //DelayCommand(4.0, AssignCommand(oGrinder5, JumpToLocation(lGrinder5)));
    //SetupLazy();
    //Add journal entry
    object oPC = GetPCSpeaker();
    AddJournalQuestEntry("XP2_Quarry", 20, oPC, TRUE, TRUE);

    //Give non-repeatable XP
    int i2daRow = 100;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }

    //Flag the quest as having been given.
    SetLocalInt(GetModule(), "bGruulQuestGiven", TRUE);
}
