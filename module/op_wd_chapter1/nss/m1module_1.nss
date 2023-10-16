//::///////////////////////////////////////////////
//:: Chapter One Module Script: OnItemAcquiredBy
//:: m1Module_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    0. All NEWS journal entries commented out
    1. M1Q2: Updates Tanglebrook journal category
       when a player acquires the key to the
       Tanglebrook Estate.
    2. M1Q2: Updates Prison Key journal category
       when a player acquires the key to the
       Prison's main door.
    3. M1Q2: Updates Prison Break journal category
       when a player acquires the Devourer's
       brain. Also updates the shared News journal
       category.
    4. M1Q4: Update the player's journal entry when
       they acquire one of the Auction notices
    5. M1Q4: Update the player's journal entry when
       they acquire Callik's Note in m1q4. The
       journal entry varies depending on whether or
       not they also have the Silver Sails Locket
       from Daranei. Add shared News update,
       regardless.
    6. Update the player's journal entry when they
       acquire the Silver Sails locket from Daranei
       in m1q4. The journal entry varies depending
       on whether or not they also have the note
       from Callik. Add shared News update, regardless
    7. M1Q4: Update the player's journal entry when
       they acquire the feather of the Cockatrice.
       Also updates the shared News category.
    8. M1Q4: Update the player's journal entry when they
       acquire Hemmel Masterson's Amulet.
    9. M1Q5: Updates the player's journal when they
       acquire the heart of the Yuan-Ti. Also updates
       the shared news category.
   10. M1Q5: Updates the player's journal when they
       acquire the Journal of Marcus Penhold.
   11. M1Q5: Update the player's journal entry when they
       acquire Torin's Ring in m1q5.
   12. Update the player's journal entry when they
       acquire M1Q5Book1 in m1q5.
   13. Update the player's journal entry when they
       acquire M1Q5Book2 in m1q5.
   14. Update the player's journal entry when they
       acquire M1Q5Book4 in m1q5.
   15. M1Q5: Updates the shared news journal M1Q5_NEWS when
       players acquire M1Q5Enote.
   16. M1Q1: Gauntlet Arena -- shared journal update when
       someone obtains a pass from Graxx
   17. M1Q1: Gauntlet Arena -- shared journal update when
       someone obtains the key from the bartender
   18. M1Q1: Gauntlet Arena -- individual journal update
       when player obtains 1st Round Medal
   19. M1Q1: Gauntlet Arena -- individual journal update
       when player obtains 2nd Round Medal
   20. M1Q1: Gauntlet Arena -- individual journal update
       when player obtains 3rd Round Medal
   21. M1Q1: Gauntlet Arena -- shared journal update
       when player obtains 4th Round Medal; individual
       update as well.
   22. Clear fog-of-war in the Beggar's Nest when the
       player obtains a map of the district.
   23. M1Q3: Samuel's Rescue -- update journal when player
       obtains key to Samuel's prison cell.
   24. M1Q3: Tension in Blacklake -- update journal when
       player obtains key to dryad's cage.
   25. M1Q3: Tension in Blacklake -- update player journal
       and shared news when player obtains the dryad's
       reagent.
   26. M1Q3: Formosa -- update journal when player obtains
       Meldanen's warehouse key (provided they already have
       journal state 20). If the player has journal state
       40, update to state 50. If player has journal state 45, update to 55.
   27. M1Q3: Formosa -- update journal when player obtains
       Meldanen's silver tooth (provided they already have
       journal state 20). If the player has journal state
       30, update to state 50.  If the player has journal state 35, update to 57
   28. Reveals player map of area when map item is acquired
   29. M1Q1 ThugNotes. Checks if you have the first note
   30. M1Q1 ThugNotes. Checks if you have the second note
   31. M1Q1 ThugNotes. Checks if you have the third note
   32. Updates Trouble in No-Man's-Land Journal when you acquire
       Loxar's head. Checks if you were already on the plot
       or not, and gives apprpriate entry.
   33. updates m1q1_ophala_1 when player acquires portrait
   34. updates m1q1_ophala_2 when player acquires statuette
   35. updates m1q1_ophala_3 when player acquires urn

*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Dec 12, 2001
//:: Last Modified By: Lukas Kristjanson
//:: Last Modified On: April 8, 2002
//:://////////////////////////////////////////////
#include "NW_I0_Plot"
void main()
{
    object oItem = GetModuleItemAcquired();
    string sItemTag = GetTag(oItem);
    object oPC = GetItemPossessor(oItem);

    if (GetIsPC(oPC))
    {

        int iTangleState = GetLocalInt(oPC, "NW_JOURNAL_ENTRYm1q2_Tanglebrook");
        int iHemmelState = GetLocalInt(oPC, "NW_JOURNAL_ENTRYm1q4_Amulet");
        int iTorinState = GetLocalInt(oPC, "NW_JOURNAL_ENTRYM1Q5_Begg_Bro");
        int iGulnanState = GetLocalInt(oPC, "NW_JOURNAL_ENTRYM1Q5_Begg_3b");
        int iBeggNewsState = GetLocalInt(oPC, "NW_JOURNAL_ENTRYM1Q5_NEWS");
        int iSCBState = GetLocalInt(oPC, "NW_JOURNAL_ENTRYM1Q5_Begg_2b");
        int iFormosaState = GetLocalInt(oPC, "NW_JOURNAL_ENTRYm1q3_Formosa");
        int iThugNoteState= GetLocalInt(oPC, "NW_JOURNAL_ENTRYM1Q1_ThugNotes");
        int iLoxarState= GetLocalInt(oPC, "NW_JOURNAL_ENTRYm1q3i_Loxar");

// 1. Update the player's journal entry when they acquire the key to the
// Tanglebrook Estate in m1q2.
        if (sItemTag == "m1q2_KeyTangle")
        {
            // If the player has already received the journal entry from talking
            // with the maid or butler, set the JournalState to 30.
            if (iTangleState == 10)
            {
                AddJournalQuestEntry("m1q2_Tanglebrook", 30, oPC);
            }
            // If the player has not received the journal entry from the maid or
            // butler, use the more generic JournalState of 20.
            else
            {
                AddJournalQuestEntry("m1q2_Tanglebrook", 20, oPC);
            }
        }

// 2. Update the player's journal entry when they acquire the key to the
// Prison's main entrance in m1q2.
        if (sItemTag == "m1q2_PrisonKey")
        {
            if(GetLocalInt(GetModule(),"NW_G_M1Q2BPlayerEntered") == FALSE)
            {
                AddJournalQuestEntry("m1q2_PrisonKey", 20, oPC);
            }
        }

// 3. Update the player's journal entry when they acquire the brain of the
// Intellect Devourer in m1q2. Also updates the shared News category.
        if (sItemTag == "M1Q2PlotReagent")
        {
            AddJournalQuestEntry("m1q2_PrisonBreak", 60, oPC);
            SetLocalInt(OBJECT_SELF,"NW_G_M1Q2MainPlot",100);
            //AddJournalQuestEntry("m1q2_News", 30, oPC, TRUE, TRUE);
            if(GetLocalInt(OBJECT_SELF,"NW_G_M1Q2ReagentXPGiven") == FALSE)
            {
                SetLocalInt(OBJECT_SELF,"NW_G_M1Q2ReagentXPGiven",TRUE);
                RewardXP("m1q2_PrisonBreak",100,oPC);
            }
        }

// 4. Update the player's journal entry when they acquire one of the Auction
// Notices in m1q4.
        if (sItemTag == "M1Q04IAUCTION")
        {
            AddJournalQuestEntry("m1q4_Docks", 20, oPC);
        }

// 5. Update the player's journal entry when they acquire Callik's Note in
// m1q4. The journal entry varies depending on whether or not they also have
// the Silver Sails Locket from Daranei. Add shared News update, regardless.
        if (sItemTag == "m1q04INoteCallik")
        {
            //AddJournalQuestEntry("m1q4_News", 30, oPC, TRUE, TRUE);
            object oLocket = GetObjectByTag("M1Q04ILocket");

            if (GetItemPossessor(oLocket) == oPC)
            {
                AddJournalQuestEntry("m1q4_Docks", 100, oPC);
            }
            else
            {
                AddJournalQuestEntry("m1q4_Docks", 80, oPC);
            }
        }

// 6. Update the player's journal entry when they acquire the Silver Sails locket
// from Daranei in m1q4. The journal entry varies depending on whether or not
// they also have the note from Callik. Add shared News update, regardless
        if (sItemTag == "M1Q04ILocket")
       {
            //AddJournalQuestEntry("m1q4_News", 30, oPC, TRUE, TRUE);
            object oNote = GetObjectByTag("m1q04INoteCallik");

            if (GetItemPossessor(oNote) == oPC)
            {
                AddJournalQuestEntry("m1q4_Docks", 100, oPC);
            }
            else
            {
                AddJournalQuestEntry("m1q4_Docks", 90, oPC);
            }
        }

// 7. Update the player's journal entry when they acquire the feather of the
// Cockatrice in m1q4. Also updates the shared News category.
        if (sItemTag == "M1Q4PlotReagent")
        {
            AddJournalQuestEntry("m1q4_Docks", 120, oPC);
            //AddJournalQuestEntry("m1q4_News", 40, oPC, TRUE, TRUE);
            if(GetLocalInt(OBJECT_SELF,"NW_G_M1Q4ReagentXPGiven") == FALSE)
            {
                SetLocalInt(OBJECT_SELF,"NW_G_M1Q4ReagentXPGiven",TRUE);
                RewardXP("m1q4_Docks",100,oPC);
            }
            SetLocalInt(OBJECT_SELF,"NW_G_M1Q4MainPlot",100);
            object oDara = GetObjectByTag("m1Q04CDaranei");
            if(GetIsObjectValid(oDara))
            {
                DestroyObject(oDara);
            }
            object oDoor = GetObjectByTag("M1Q4DsilverSails");
            if(GetIsObjectValid(oDoor) && GetObjectType(oDoor)== OBJECT_TYPE_DOOR)
            {
                SetLocked(oDoor,FALSE);
            }
        }

// 8. Update the player's journal entry when they acquire Hemmel Masterson's
// Amulet in m1q4.
        if (sItemTag == "M1Q04INOBAMULET")
        {
        // If the player has already received the journal entry from talking
        // with Hemmel, set the JournalState to 30.
            if (iHemmelState == 10)
            {
                AddJournalQuestEntry("m1q4_Amulet", 30, oPC);
            }
            // If the player has not received the journal entry from talking with
            // Hemmel, use the more generic JournalState of 20.
            else
            {
                AddJournalQuestEntry("m1q4_Amulet", 20, oPC);
            }
        }
// 9. Update the player's journal entry when they acquire the Yuan-Ti heart in
// m1q5. Also updates the shared news entry.

        if (sItemTag == "M1Q5PlotReagent")
        {
            AddJournalQuestEntry("M1Q1_Begg_1", 50, oPC);
            //AddJournalQuestEntry("M1Q5_NEWS", 60, oPC, TRUE, TRUE);
            if(GetLocalInt(OBJECT_SELF,"NW_G_M1Q5ReagentXPGiven") == FALSE)
            {
                SetLocalInt(OBJECT_SELF,"NW_G_M1Q5ReagentXPGiven",TRUE);
                RewardXP("M1Q1_Begg_1",100,oPC);
            }
            SetLocalInt(OBJECT_SELF,"NW_G_M1Q5MainPlot",100);

            if (iSCBState > 1)
            {
                AddJournalQuestEntry("M1Q5_Begg_2b", 100, oPC);
            }
            if (iGulnanState > 1)
            {
                AddJournalQuestEntry("M1Q5_Begg_3b", 80, oPC);
            }

        }
// 10. Update the player's journal entry when they acquire the Journal of Marcus
// Penhold in m1q5.
        if (sItemTag == "M1Q5MarcNote")
        {
            AddJournalQuestEntry("M1Q5_Bertrand", 20, oPC);
        }
// 11. Update the player's journal entry when they acquire Torin's Ring
// in m1q5.
        if (sItemTag == "M1Q5Signet1")
        {
        // If the player has already received the journal entry from talking
        // with Jemanie, set the JournalState to 30.
            if (iTorinState == 10)
            {
                AddJournalQuestEntry("M1Q5_Begg_Bro", 30, oPC);
            }
        // If the player has not received the journal entry from talking with
        // Jemanie, use the more generic JournalState of 20.
            else
            {
                AddJournalQuestEntry("M1Q5_Begg_Bro", 20, oPC);
            }
        }
// 12. Update the player's journal entry when they acquire M1Q5Book1
// in m1q5.
        if (sItemTag == "M1Q5Book1")
        {
        // If the journal for this plot has not already gone past this
        // point, update the player's journal.
            if (iGulnanState > 0)
            {
                AddJournalQuestEntry("M1Q5_Begg_3b", 60, oPC);
            }
            if (iSCBState > 0 &&
                GetIsObjectValid(GetLocalObject(GetModule(),"NW_G_M1Q5C04Drawl")))
            {
                AddJournalQuestEntry("M1Q5_Begg_2b", 80, oPC);
            }
        }
// 13. Update the player's journal entry when they acquire M1Q5Book2
// in m1q5.
        if (sItemTag == "M1Q5Book2")
        {
            // If the journal for this plot has not already gone past this
            // point, update the player's journal.
            if (iGulnanState > 0)
            {
                AddJournalQuestEntry("M1Q5_Begg_3b", 60, oPC);
            }
            if (iSCBState > 0 &&
                GetIsObjectValid(GetLocalObject(GetModule(),"NW_G_M1Q5C04Drawl")))
            {
                AddJournalQuestEntry("M1Q5_Begg_2b", 80, oPC);
            }
        }
// 14. Update the player's journal entry when they acquire M1Q5Book4
// in m1q5.
        if (sItemTag == "M1Q5Book4")
        {
        // If the journal for this plot has not already gone past this
        // point, update the player's journal.
            if (iGulnanState > 0)
            {
                AddJournalQuestEntry("M1Q5_Begg_3b", 60, oPC);
            }

            if (iSCBState > 0 &&
            GetIsObjectValid(GetLocalObject(GetModule(),"NW_G_M1Q5C04Drawl")))
            {
                AddJournalQuestEntry("M1Q5_Begg_2b", 80, oPC);
            }

        }
        /*
// 15. Update the News journal entry for everyone when a player acquires
// M1Q5Enote in m1q5.
        if (sItemTag == "M1Q5Enote")
        {
        // If the journal for this plot has not already gone past this
        // point, update the player's journal.
            if (iBeggNewsState < 40)
            {
               AddJournalQuestEntry("M1Q5_NEWS", 40, oPC, TRUE, TRUE);
            }
        }
         */
         /*
// 16. M1Q1: Gauntlet Arena -- shared journal update when someone obtains
// a pass from Graxx
        if (sItemTag == "M1S04IFIGHTPASS")
        {
            AddJournalQuestEntry("m1q1_Arena", 10, oPC, TRUE, TRUE);
        }
        */

        /*
// 17. M1Q1: Gauntlet Arena -- shared journal update when someone obtains
// a key from the bartender
        if (sItemTag == "M1S04IFIGHTKEY")
        {
            AddJournalQuestEntry("m1q1_Arena", 20, oPC, TRUE, TRUE);
        }
        */
// 18. M1Q1: Gauntlet Arena -- individual journal update when someone
// wins the 1st Round Medal
        if (sItemTag == "M1S04IBADGELVL01")
        {
            AddJournalQuestEntry("m1q1_Arena", 30, oPC, FALSE);
            if(GetLocalInt(OBJECT_SELF,"NW_G_M1S4Badge1_XP") == FALSE)
            {
                SetLocalInt(OBJECT_SELF,"NW_G_M1S4Badge1_XP",TRUE);
                RewardXP("m1q1_Arena",25,oPC,ALIGNMENT_NEUTRAL,FALSE);
            }
        }

// 19. M1Q1: Gauntlet Arena -- individual journal update when someone
// wins the 2nd Round Medal
        if (sItemTag == "M1S04IBADGELVL02")
        {
            AddJournalQuestEntry("m1q1_Arena", 40, oPC, FALSE);
            if(GetLocalInt(OBJECT_SELF,"NW_G_M1S4Badge1_XP") == FALSE)
            {
                SetLocalInt(OBJECT_SELF,"NW_G_M1S4Badge2_XP",TRUE);
                RewardXP("m1q1_Arena",25,oPC,ALIGNMENT_NEUTRAL,FALSE);
            }

        }

// 20. M1Q1: Gauntlet Arena -- individual journal update when someone
// wins the 3rd Round Medal
        if (sItemTag == "M1S04IBADGELVL03")
        {
            AddJournalQuestEntry("m1q1_Arena", 50, oPC, FALSE);
            if(GetLocalInt(OBJECT_SELF,"NW_G_M1S4Badge4_XP") == FALSE)
            {
                SetLocalInt(OBJECT_SELF,"NW_G_M1S4Badge4_XP",TRUE);
                RewardXP("m1q1_Arena",25,oPC,ALIGNMENT_NEUTRAL,FALSE);
            }
        }

// 21. M1Q1: Gauntlet Arena -- shared & individual journal updates when
// someone wins the 4th Round Medal
        if (sItemTag == "M1S04IBADGELVL04")
        {
            //AddJournalQuestEntry("m1q1_Arena", 60, oPC, TRUE, TRUE);
            AddJournalQuestEntry("m1q1_Arena", 70, oPC, FALSE);
            if(GetLocalInt(OBJECT_SELF,"NW_G_M1S4Badge4_XP") == FALSE)
            {
                SetLocalInt(OBJECT_SELF,"NW_G_M1S4Badge4_XP",TRUE);
                RewardXP("m1q1_Arena",25,oPC,ALIGNMENT_NEUTRAL,FALSE);
            }
        }

// 22. The following updates players maps when they pick up map items

        if(sItemTag == "M1_Map_M1Q5A")
        {
            ExploreAreaForPlayer(GetObjectByTag("BEGGARS_NEST"),oPC);
        }

// 23. M1Q3: Samuel's Rescue -- update journal when player obtains key
// to Samuel's prison cell.
   /*
        if (sItemTag == "M1Q3BKey2")
        {
            AddJournalQuestEntry("m1q3_Samuel", 30, oPC);
        }
   */
// 24. M1Q3: Tension in Blacklake -- update journal when player obtains
// key to dryad's cage.

        if (sItemTag == "M1Q3A00MELDKEY")
        {
            AddJournalQuestEntry("m1q3_Blacklake", 30, oPC);
        }

// 25. M1Q3: Tension in Blacklake -- update player journal and shared news
// when player obtains the dryad's reagent.

        if (sItemTag == "M1Q3PlotReagent")
        {
            SetLocalInt(GetModule(),"NW_G_M1Q3MainPlot",100);
            AddJournalQuestEntry("m1q3_Blacklake", 40, oPC);
            //AddJournalQuestEntry("M1Q3_News", 30, oPC, TRUE, TRUE);
            if(GetLocalInt(OBJECT_SELF,"NW_G_M1Q3ReagentXPGiven") == FALSE)
            {
                SetLocalInt(OBJECT_SELF,"NW_G_M1Q3ReagentXPGiven",TRUE);
                RewardXP("m1q3_Blacklake",100,oPC);
            }
            int nNth;
            object oDoor = GetObjectByTag("M1Q3COuterDoor",nNth);
            while(GetIsObjectValid(oDoor))
            {
                SetLocked(oDoor,FALSE);
                AssignCommand(oDoor,ActionOpenDoor(oDoor));
                nNth++;
                oDoor = GetObjectByTag("M1Q3COuterDoor",nNth);
            }
        }

// 26. M1Q3: Formosa -- update journal when player obtains Meldanen's
// warehouse key (provided they already have journal state 20).
// If the player has journal state 40, update to state 50.

        if (sItemTag == "NW_FORMOSA_KEY01")
        {
            if (iFormosaState < 20)
            {
                if (GetLocalInt(GetModule(),"NW_G_M1Q3MeldanenSaidFormosa") == FALSE)
                {
                    AddJournalQuestEntry("m1q3_Formosa", 33, oPC);
                }
                else
                {
                    AddJournalQuestEntry("m1q3_Formosa", 34, oPC);
                }
            }

            if (iFormosaState == 20)
            {
                AddJournalQuestEntry("m1q3_Formosa", 30, oPC);
            }
            if (iFormosaState == 40)
            {
                AddJournalQuestEntry("m1q3_Formosa", 50, oPC);
            }
            if (iFormosaState == 43)
            {
                AddJournalQuestEntry("m1q3_Formosa", 52, oPC);
            }
            if (iFormosaState == 44)
            {
                AddJournalQuestEntry("m1q3_Formosa", 53, oPC);
            }

            if (iFormosaState == 45)
            {
                AddJournalQuestEntry("m1q3_Formosa", 55, oPC);
            }
        }

// 27. M1Q3: Formosa -- update journal when player obtains Meldanen's
// silver tooth (provided they already have journal state 20).
// If the player has journal state 30, update to state 50.

        if (sItemTag == "M1Q3A00TOOTH")
        {
            if (iFormosaState < 20)
            {
                if (GetLocalInt(GetModule(),"NW_G_M1Q3MeldanenSaidFormosa") == FALSE)
                {
                    AddJournalQuestEntry("m1q3_Formosa", 43, oPC);
                }
                else
                {
                    AddJournalQuestEntry("m1q3_Formosa", 44, oPC);
                }
            }

            if (iFormosaState == 20)
            {
                AddJournalQuestEntry("m1q3_Formosa", 40, oPC);
            }
            if (iFormosaState == 30)
            {
                AddJournalQuestEntry("m1q3_Formosa", 50, oPC);
            }

            if (iFormosaState == 33)
            {
                AddJournalQuestEntry("m1q3_Formosa", 52, oPC);
            }
            if (iFormosaState == 34)
            {
                AddJournalQuestEntry("m1q3_Formosa", 53, oPC);
            }

            if (iFormosaState == 35)
            {
                AddJournalQuestEntry("m1q3_Formosa", 57, oPC);
            }
        }
    // 28. Reveals player map of area when map item is acquired
        if (sItemTag == "M1_Map_M1Q2A") ExploreAreaForPlayer(GetObjectByTag("Map_M1Q2A"),oPC);
        if (sItemTag == "M1_Map_M1Q3A") ExploreAreaForPlayer(GetObjectByTag("Map_M1Q3A"),oPC);
        if (sItemTag == "M1_Map_M1Q4A") ExploreAreaForPlayer(GetObjectByTag("Map_M1Q4A"),oPC);
        if (sItemTag == "M1Q04IAUCTION") ExploreAreaForPlayer(GetObjectByTag("Map_M1Q4A"),oPC);
        if (sItemTag == "M1_Map_M1Q5A") ExploreAreaForPlayer(GetObjectByTag("Map_M1Q5A"),oPC);

// 29. Update the player's journal entry when they acquire Thugnote 1.

        if (sItemTag == "M1Q1_LetterConspiracy")
        {
            AddJournalQuestEntry("M1Q1_ThugNotes", 10, oPC);
        }

// 30. Update the player's journal entry when they acquire Thugnote 2.


        if (sItemTag == "M1Q1_LetterCult")
        {
            AddJournalQuestEntry("M1Q1_ThugNotes2", 10, oPC);
        }
// 31. Update the player's journal entry when they acquire Thugnote 3.

        if (sItemTag == "M1Q1_LetterSpy")
        {
            AddJournalQuestEntry("M1Q1_ThugNotes3", 10, oPC);
        }
//32. Update journal entry when player acquires head of Loxar in no-man's-land


        if (sItemTag == "M1Q3ILoxarHead")
        {
        // If the player has not already spoken to Cendran
        // set the JournalState to 20.
            if (iLoxarState < 10)
            {
                AddJournalQuestEntry("m1q3i_Loxar", 20, oPC);
            }
            // If the player has already spoken to Cendran)
            // set JournalState to 30.
            else
            {
                AddJournalQuestEntry("m1q3i_Loxar", 30, oPC);
            }
        }
        if(sItemTag == "M1S1Armor")
        {
            SetLocalInt(GetModule(),"NW_G_M1S1SubPlot",10);
        }
    //33updates m1q1_ophala_1 when player acquires portrait
        if(sItemTag == "M1S2Portrait")
        {
            AddJournalQuestEntry("m1q1_ophala_1", 10, oPC);
        }

    //34 updates m1q1_ophala_2 when player acquires statuette
        if(sItemTag == "M1S2Statue")
        {
            AddJournalQuestEntry("m1q1_ophala_2", 10, oPC);
        }
    //35 updates m1q1_ophala_3 when player acquires urn
        if(sItemTag == "M1S2Urn")
        {
            AddJournalQuestEntry("m1q1_ophala_3", 10, oPC);
        }
    }
}
