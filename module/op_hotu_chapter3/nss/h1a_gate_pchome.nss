//::///////////////////////////////////////////////
//:: Gatekeeper, PC Going Home (Action Script)
//:: H1a_Gate_PCHome.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flags the player as having commanded the
     Gatekeeper by his True Name and summons in
     a door that will lead them home to Waterdeep.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 16, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void CreateDoor(location lTarget, object oPC);

void main()
{
    //Nest everything in a DoOnce
    int bDoor = GetLocalInt(GetModule(), "bGatekeeper_PlayerHome");
    if (bDoor == FALSE)
    {
        //Set the DoOnce on the Module
        SetLocalInt(GetModule(), "bGatekeeper_PlayerHome", TRUE);

        //Pause the conversation
        ActionPauseConversation();

        //Handle the VFX
        object oDoorSpawn = GetObjectByTag("WP_ToWaterdeep");
        location lDoorSpawn = GetLocation(oDoorSpawn);
        ActionCastFakeSpellAtLocation(SPELL_ISAACS_LESSER_MISSILE_STORM, lDoorSpawn);
        effect eVFX = EffectVisualEffect(VFX_FNF_SOUND_BURST);
        DelayCommand(3.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFX, lDoorSpawn));

        //Spawn in the door.
        object oPC = GetPCSpeaker();
        DelayCommand(3.0, CreateDoor(lDoorSpawn, oPC));

        //Add journal entries
        AddJournalQuestEntry("XP2_Main", 80, oPC, TRUE, TRUE);
        //Give non-repeatable XP
        int i2daRow = 84;
        int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
        if (bDuplicate == FALSE)
        {
            SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
            Reward_2daXP(oPC, i2daRow);
        }
        AddJournalQuestEntry("XP2_Name_Gatekeeper", 50, oPC, TRUE, TRUE);
        //Give non-repeatable XP
        i2daRow = 158;
        bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
        if (bDuplicate == FALSE)
        {
            SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
            Reward_2daXP(oPC, i2daRow);
        }

        //Resume the Conversation
        ActionResumeConversation();
    }
}

void CreateDoor(location lTarget, object oPC)
{
    //Spawn in the door.
    object oNewDoor = CreateObject(OBJECT_TYPE_PLACEABLE, "x2_homedoor", lTarget);

    //Make it glow
    effect eGlow = EffectVisualEffect(VFX_DUR_GHOSTLY_VISAGE);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eGlow, oNewDoor);

    //Have it launch conversationwith the player.
    DelayCommand(1.0, AssignCommand(oNewDoor, ActionStartConversation(oPC)));
}

