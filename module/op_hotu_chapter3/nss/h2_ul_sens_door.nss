//::///////////////////////////////////////////////
//:: Sensei Dharvana, Locked Door (OnUnlock)
//:: H2_UL_Sens_Door.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Prevent players from picking the lock while
     the Sensei is nearby.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 12, 2003
//:://////////////////////////////////////////////

void main()
{
    //Only pay attention to player unlockers.
    object oPC = GetLastUnlocked();
    if (GetIsPC(oPC) == TRUE)
    {
        //If the Sensei is not asleep / meditating && player has not completed
        //the 5-Fold Mysteries.
        object oSensei = GetObjectByTag("H2_Sensei");
        int bAsleep = GetLocalInt(oSensei, "bAsleep");
        int bMysteries = GetLocalInt(GetModule(), "bMysteriesComplete");

        if (bAsleep == FALSE &&
            bMysteries == FALSE)
        {
            //Re-lock the door
            ActionCloseDoor(OBJECT_SELF);
            SetLocked(OBJECT_SELF, TRUE);

            //Launch conversation
            AssignCommand(oPC, ClearAllActions(TRUE));
            ActionStartConversation(oPC, "");
        }
        //If the unlock is successful, spawn in the Bigby's VFX in the next room
        //on a DoOnce
        else
        {
            /*int bDoOnce = GetLocalInt(OBJECT_SELF, "bDoOnce");
            if (bDoOnce == FALSE)
            {
                //Flag the DoOnce
                SetLocalInt(OBJECT_SELF, "bDoOnce", TRUE);

                //Loop through all the VFX targets
                int iBigby = 0;
                object oBigby = GetObjectByTag("WP_BigbyVFX", iBigby);
                while (oBigby != OBJECT_INVALID)
                {
                    //Apply VFX
                    //location lBigby = GetLocation(oBigby);
                    effect eBigby = EffectVisualEffect(VFX_DUR_BIGBYS_INTERPOSING_HAND);
                    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eBigby, oBigby);

                    //Update Loop Variables
                    iBigby++;
                    oBigby = GetObjectByTag("WP_BigbyVFX", iBigby);
                }

                //Add the journal entries
                AddJournalQuestEntry("XP2_Pilgrims", 90, oPC, TRUE, TRUE);
                AddJournalQuestEntry("XP2_Mystery1", 40, oPC, TRUE, TRUE);
                AddJournalQuestEntry("XP2_Mystery2", 40, oPC, TRUE, TRUE);
                AddJournalQuestEntry("XP2_Mystery3", 40, oPC, TRUE, TRUE);
                AddJournalQuestEntry("XP2_Mystery4", 40, oPC, TRUE, TRUE);
                AddJournalQuestEntry("XP2_Mystery5", 40, oPC, TRUE, TRUE);
            }*/
        }
    }
}
