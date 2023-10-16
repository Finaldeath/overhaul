//::///////////////////////////////////////////////
//:: Name hx_spawn_door
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will create a door in the Temple of
     the Sleeping Man that leads to the ring area.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Aug 25, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    object oPC = GetPCSpeaker();
    object oWP = GetObjectByTag("hx_sleep_2_ring_spawn");
    location lLoc = GetLocation(oWP);
    object oDoor = GetObjectByTag("hx_sleep_2_ring");

    if(!GetIsObjectValid(oDoor))
    {
        CreateObject(OBJECT_TYPE_PLACEABLE, "hx_sleep_2_ring", lLoc);

        //Apply some VFX to make the spawning of the door more obvious.
        effect eVFX = EffectVisualEffect(VFX_IMP_HEALING_X);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFX, lLoc);

        //Reposition the player's camera to make it even *more* obvious.
        AssignCommand(oPC, SetCameraFacing(90.0));
    }

    //Set the dream state variable as well.
    object oMan = GetObjectByTag("H2_SleepingMan");
    SetLocalInt(oMan, "iDreamState", 7);

    //Add the main journal entry
    AddJournalQuestEntry("XP2_Main", 40, oPC, TRUE, TRUE);

    //Give non-repeatable XP
    int i2daRow = 80;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }

    //Add separate Pilgrim journal entries depending on whether he's awake or
    //asleep.
    int bAwake = GetLocalInt(OBJECT_SELF, "bAwake");
    if (bAwake == FALSE)
    {
        AddJournalQuestEntry("XP2_Pilgrims", 140, oPC, TRUE, TRUE);
        //Give non-repeatable XP
        i2daRow = 95;
        bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
        if (bDuplicate == FALSE)
        {
            SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
            Reward_2daXP(oPC, i2daRow);
        }
    }
    else
    {
        AddJournalQuestEntry("XP2_Pilgrims", 170, oPC, TRUE, TRUE);
        //Give non-repeatable XP
        int i2daRow = 98;
        int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
        if (bDuplicate == FALSE)
        {
            SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
            Reward_2daXP(oPC, i2daRow);
        }
    }
}
