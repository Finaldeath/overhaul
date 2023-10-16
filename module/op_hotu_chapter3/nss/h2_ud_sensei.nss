//::///////////////////////////////////////////////
//:: Githzerai Sensei, User-Defined Events
//:: H2_UD_Sensei.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Handle Sensei's sleeping / meditation cycle
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 23, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 4444) // Added By: Brad Prince. Destroys her undroppable amulet.
    {
        object oAmulet = GetItemPossessedBy(OBJECT_SELF, "H2_SenseiAmulet");
        string sAmulet = "h2_senseiamulet";

        if(GetIsObjectValid(oAmulet))
        {
            SetPlotFlag(oAmulet, FALSE);
            DestroyObject(oAmulet);
        }
        CreateItemOnObject(sAmulet, GetFirstPC());
    }
    if(nUser == 1001) //HEARTBEAT
    {

    }
    else if(nUser == 1002) // PERCEIVE
    {

    }
    else if(nUser == 1003) // END OF COMBAT
    {

    }
    else if(nUser == 1004) // ON DIALOGUE
    {

    }
    else if(nUser == 1005) // ATTACKED
    {

    }
    else if(nUser == 1006) // DAMAGED
    {
        object oAmulet = GetItemPossessedBy(OBJECT_SELF, "H2_SenseiAmulet");

        if(GetIsObjectValid(oAmulet))
        {
           // SendMessageToPC(GetFirstPC(), "Inside valid check");
            DestroyObject(oAmulet);
        }
    }
    else if(nUser == 1007) // DEATH
    {
        object oSelf = OBJECT_SELF;
        SetIsDestroyable(FALSE, FALSE, FALSE);
        //Unlock door.
        object oDoor = GetObjectByTag("x2_doormed2");
        AssignCommand(oDoor, ActionUnlockObject(OBJECT_SELF));

        // Added By: Brad Prince. Gives PC Amulet.
        if(GetLocalInt(GetModule(), "bKnower_GatekeeperNamed") == FALSE)
        {
            string sAmulet = "h2_senseiamulet";

            if(GetItemPossessedBy(GetFirstPC(), "H2_SenseiAmulet") == OBJECT_INVALID)
            {
                CreateItemOnObject(sAmulet, GetFirstPC());
            }
        }

        //Handle journal entries.
        object oSleepingMan = GetObjectByTag("H2_SleepingMan");
        object oPC = GetFirstPC();
        int bAwake = GetLocalInt(oSleepingMan, "bAwake");
        if (bAwake == FALSE)
        {
            AddJournalQuestEntry("XP2_Pilgrims", 110, oPC, TRUE, TRUE);
            //Give non-repeatable XP
            int i2daRow = 93;
            int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
            if (bDuplicate == FALSE)
            {
                SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
                Reward_2daXP(oPC, i2daRow);
            }
        }
        else
        {
            AddJournalQuestEntry("XP2_Pilgrims", 160, oPC, TRUE, TRUE);
            //Give non-repeatable XP
            int i2daRow = 97;
            int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
            if (bDuplicate == FALSE)
            {
                SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
                Reward_2daXP(oPC, i2daRow);
            }
        }
        int bNamed = GetLocalInt(GetModule(), "bKnower_SenseiNamed");
        if (bNamed == TRUE)
        {
            AddJournalQuestEntry("XP2_Name_Sensei", 50, oPC, TRUE, TRUE, TRUE);
        }
        string sLove = GetLocalString(GetModule(), "sKnower_SleepingMansLove");
        if (sLove == "Sensei")
        {
            AddJournalQuestEntry("XP2_Name_SMansLove", 120, oPC, TRUE, TRUE, TRUE);
        }
        int bMysteries = GetLocalInt(GetModule(), "bMysteriesComplete");
        if (bMysteries == FALSE)
        {
            AddJournalQuestEntry("XP2_Mystery1", 50, oPC, TRUE, TRUE);
            AddJournalQuestEntry("XP2_Mystery2", 50, oPC, TRUE, TRUE);
            AddJournalQuestEntry("XP2_Mystery3", 50, oPC, TRUE, TRUE);
            AddJournalQuestEntry("XP2_Mystery4", 50, oPC, TRUE, TRUE);
            AddJournalQuestEntry("XP2_Mystery5", 50, oPC, TRUE, TRUE);
        }
    }
    else if(nUser == 1008) // DISTURBED
    {
    }
    else if(nUser == 1050) // CUSTOM UD EVENT (ASLEEP)
    {
        //Ignore this action if engaged in conversation.
        int bInConv = IsInConversation(OBJECT_SELF);
        if (bInConv == FALSE)
        {
            //Only do Asleep stuff if the Sleeping Man hasn't been wakened.
            object oMan = GetObjectByTag("H2_SleepingMan");
            int bManAwake = GetLocalInt(oMan, "bAwake");
            if (bManAwake == FALSE)
            {
/*DEBUG*///SendMessageToPC(GetFirstPC(), "DEBUG: Sensei is falling asleep.");
                //Set Asleep variable
                SetLocalInt(OBJECT_SELF, "bAsleep", TRUE);

                //Clear All Actions
                ClearAllActions();

                //Move to Asleep location
                object oAsleep = GetObjectByTag("WP_SenseiAsleep");
                location lAsleep = GetLocation(oAsleep);
                float fFacing = GetFacing(oAsleep);
                ActionForceMoveToLocation(lAsleep);
                ActionDoCommand(SetFacing(fFacing));

                DelayCommand(120.0, SignalEvent(OBJECT_SELF, EventUserDefined(1051)));
            }
        }
        //If they are in conversation, refire the event in 15 seconds so they
        //don't have to wait the full 2 minutes.
        else
        {
            DelayCommand(15.0, SignalEvent(OBJECT_SELF, EventUserDefined(1050)));
        }
    }

    else if(nUser == 1051) // CUSTOM UD EVENT (AWAKE)
    {
        //Ignore this action if engaged in conversation.
        int bInConv = IsInConversation(OBJECT_SELF);
        if (bInConv == FALSE)
        {
            //Only do Awake stuff if the Sleeping Man hasn't been wakened.
            object oMan = GetObjectByTag("H2_SleepingMan");
            int bManAwake = GetLocalInt(oMan, "bAwake");
            if (bManAwake == FALSE)
            {
/*DEBUG*///SendMessageToPC(GetFirstPC(), "DEBUG: Sensei is waking up.");
                //Remove Asleep variable
                SetLocalInt(OBJECT_SELF, "bAsleep", FALSE);

                //Clear All Actions
                ClearAllActions();

                //Return to Awake location when meditations are complete.
                object oAwake = GetObjectByTag("WP_SenseiAwake");
                location lAwake = GetLocation(oAwake);
                float fFacing = GetFacing(oAwake);
                ActionForceMoveToLocation(lAwake);
                ActionDoCommand(SetFacing(fFacing));

                DelayCommand(120.0, SignalEvent(OBJECT_SELF, EventUserDefined(1050)));
            }
        }
        //If they are in conversation, refire the event in 15 seconds so they
        //don't have to wait the full 2 minutes.
        else
        {
            DelayCommand(15.0, SignalEvent(OBJECT_SELF, EventUserDefined(1051)));
        }
    }
}


