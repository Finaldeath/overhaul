//::///////////////////////////////////////////////
//:: Module Item (OnAcquire)
//:: Acq_ModuleItem.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Handle any OnAcquireItem events
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 8, 2003
//:://////////////////////////////////////////////
#include "x0_i0_common"

void DoInterjection(object oHench, object oPC, int MOD_EVENT_NUMBER);
int ValidForInterjection(object oPC, object oHench);
void CheckForInterjection(object oPC, int nEventNum, int bPopUpOnly = TRUE);

void main()
{
    object oPC = GetModuleItemAcquiredBy();
    object oItem = GetModuleItemAcquired();
    string sItem = GetTag(oItem);

    //Only worry about the player's acquisition
    if (GetIsPC(oPC) == TRUE)
    {
        //Dark Wind
        if (sItem == "ITEM_DarkWind")
        {
            //Only add the journal entry once
            int bDoOnce = GetLocalInt(GetModule(), sItem+"bDoOnce");
            if (bDoOnce == FALSE)
            {
                //Add journal entry.
                AddJournalQuestEntry("Journ_Wizard_End", 1, oPC, TRUE, TRUE);
                AddJournalQuestEntry("Journ_Winds_30", 1, oPC, TRUE, TRUE);
                //Remove all other journal entries in this series (except #70, which is
                //an easter egg).
                RemoveJournalQuestEntry("Journ_Wizard_10", oPC, TRUE, TRUE);
                RemoveJournalQuestEntry("Journ_Wizard_20", oPC, TRUE, TRUE);
                RemoveJournalQuestEntry("Journ_Wizard_30", oPC, TRUE, TRUE);
                RemoveJournalQuestEntry("Journ_Wizard_40", oPC, TRUE, TRUE);
                RemoveJournalQuestEntry("Journ_Wizard_50", oPC, TRUE, TRUE);
                RemoveJournalQuestEntry("Journ_Wizard_60", oPC, TRUE, TRUE);
                //Flag the area as restable
                object oArea = GetObjectByTag("Wizard_05");
                SetLocalInt(oArea, "bAllowRest", TRUE);
                //Have the Asabi Thralls make progress on the passageway
                int iThrallCount = 1;
                object oThrall = GetObjectByTag("AsabiLooter", iThrallCount);
                while (oThrall != OBJECT_INVALID)
                {
                    //Destroy the nearest rubble pieces
                    object oRubble = GetNearestObjectByTag("AsabiRubble", oThrall);
                    DestroyObject(oRubble);

                    //Update Loop variables
                    iThrallCount++;
                    oThrall = GetObjectByTag("AsabiLooter", iThrallCount);
                }
                //Flag the DoOnce
                SetLocalInt(GetModule(), sItem+"bDoOnce", TRUE);
                //Auto-Save
                DoSinglePlayerAutoSave();
            }
            //Distribute XP to everyone
            object oPC_XP = GetFirstPC();
            while (oPC_XP != OBJECT_INVALID)
            {
                int bXP = GetLocalInt(oPC_XP, "XP_Wizard_07");
                if (bXP == FALSE)
                {
                    SetLocalInt(oPC_XP, "XP_Wizard_07", TRUE);
                    int iXP = FloatToInt(GetJournalQuestExperience("Journ_Wizard_End") * 0.30);
                    GiveXPToCreature(oPC_XP, iXP);
                }
                oPC_XP = GetNextPC();
            }
            //Destroy Sparkly
            object oSparkly = GetObjectByTag("DarkWind_Sparkly");
            DestroyObject(oSparkly);
        }

        //Dead Wind
        else if (sItem == "ITEM_DeadWind")
        {
            //Only add the journal entry once
            int bDoOnce = GetLocalInt(GetModule(), sItem+"bDoOnce");
            if (bDoOnce == FALSE)
            {
                //Add journal entry.
                AddJournalQuestEntry("Journ_Crypt_End", 1, oPC, TRUE, TRUE);
                AddJournalQuestEntry("Journ_Winds_20", 1, oPC, TRUE, TRUE);
                //Remove all other journal entries in this series
                RemoveJournalQuestEntry("Journ_Crypt_10", oPC, TRUE, TRUE);
                RemoveJournalQuestEntry("Journ_Crypt_20", oPC, TRUE, TRUE);
                RemoveJournalQuestEntry("Journ_Crypt_30", oPC, TRUE, TRUE);
                RemoveJournalQuestEntry("Journ_Crypt_40", oPC, TRUE, TRUE);
                RemoveJournalQuestEntry("Journ_Crypt_50", oPC, TRUE, TRUE);
                //Flag the area as restable
                object oArea = GetObjectByTag("Crypt_04");
                SetLocalInt(oArea, "bAllowRest", TRUE);
                //Have the Asabi Thralls make progress on the passageway
                int iThrallCount = 1;
                object oThrall = GetObjectByTag("AsabiLooter", iThrallCount);
                while (oThrall != OBJECT_INVALID)
                {
                    //Destroy the nearest rubble pieces
                    object oRubble = GetNearestObjectByTag("AsabiRubble", oThrall);
                    DestroyObject(oRubble);

                    //Update Loop variables
                    iThrallCount++;
                    oThrall = GetObjectByTag("AsabiLooter", iThrallCount);
                }
                //Flag the DoOnce
                SetLocalInt(GetModule(), sItem+"bDoOnce", TRUE);
                //Auto-Save
                DoSinglePlayerAutoSave();
            }
            //Distribute XP to everyone
            object oPC_XP = GetFirstPC();
            while (oPC_XP != OBJECT_INVALID)
            {
                int bXP = GetLocalInt(oPC_XP, "XP_Crypt_07");
                if (bXP == FALSE)
                {
                    SetLocalInt(oPC_XP, "XP_Crypt_07", TRUE);
                    int iXP = FloatToInt(GetJournalQuestExperience("Journ_Crypt_End") * 0.30);
                    GiveXPToCreature(oPC_XP, iXP);
                }
                oPC_XP = GetNextPC();
            }
            //Destroy Sparkly
            object oSparkly = GetObjectByTag("DeadWind_Sparkly");
            DestroyObject(oSparkly);
        }

        //Wise Wind
        else if (sItem == "ITEM_WiseWind")
        {
            //Only add the journal entry once
            int bDoOnce = GetLocalInt(GetModule(), sItem+"bDoOnce");
            if (bDoOnce == FALSE)
            {
                //Add journal entry.
                AddJournalQuestEntry("Journ_Library_End", 1, oPC, TRUE, TRUE);
                AddJournalQuestEntry("Journ_Winds_40", 1, oPC, TRUE, TRUE);
                //Remove all other journal entries in this series
                RemoveJournalQuestEntry("Journ_Library_10", oPC, TRUE, TRUE);
                RemoveJournalQuestEntry("Journ_Library_20", oPC, TRUE, TRUE);
                RemoveJournalQuestEntry("Journ_Library_30", oPC, TRUE, TRUE);
                RemoveJournalQuestEntry("Journ_Library_40", oPC, TRUE, TRUE);
                RemoveJournalQuestEntry("Journ_Library_50", oPC, TRUE, TRUE);
                RemoveJournalQuestEntry("Journ_Library_60", oPC, TRUE, TRUE);
                RemoveJournalQuestEntry("Journ_Library_70", oPC, TRUE, TRUE);
                RemoveJournalQuestEntry("Journ_Library_80", oPC, TRUE, TRUE);
                RemoveJournalQuestEntry("Journ_Library_90", oPC, TRUE, TRUE);
                RemoveJournalQuestEntry("Journ_Library_100", oPC, TRUE, TRUE);
                RemoveJournalQuestEntry("Journ_Library_110", oPC, TRUE, TRUE);
                //Flag the area as restable
                object oArea = GetObjectByTag("Library_05");
                SetLocalInt(oArea, "bAllowRest", TRUE);
                //Have the Asabi Thralls make progress on the passageway
                int iThrallCount = 1;
                object oThrall = GetObjectByTag("AsabiLooter", iThrallCount);
                while (oThrall != OBJECT_INVALID)
                {
                    //Destroy the nearest rubble pieces
                    object oRubble = GetNearestObjectByTag("AsabiRubble", oThrall);
                    DestroyObject(oRubble);

                    //Update Loop variables
                    iThrallCount++;
                    oThrall = GetObjectByTag("AsabiLooter", iThrallCount);
                }
                //Flag the DoOnce
                SetLocalInt(GetModule(), sItem+"bDoOnce", TRUE);
                //Auto-Save
                DoSinglePlayerAutoSave();
            }
            //Distribute XP to everyone
            object oPC_XP = GetFirstPC();
            while (oPC_XP != OBJECT_INVALID)
            {
                int bXP = GetLocalInt(oPC_XP, "XP_Library_12");
                if (bXP == FALSE)
                {
                    SetLocalInt(oPC_XP, "XP_Library_12", TRUE);
                    int iXP = FloatToInt(GetJournalQuestExperience("Journ_Library_End") * 0.30);
                    GiveXPToCreature(oPC_XP, iXP);
                }
                oPC_XP = GetNextPC();
            }
            //Destroy Sparkly
            object oSparkly = GetObjectByTag("WiseWind_Sparkly");
            DestroyObject(oSparkly);

            //Remove the Plot Flag on the Pen & Inkwell so the player can drop
            //or sell them as they see fit.
            object oInkwell = GetObjectByTag("Library_Inkwell");
            object oPen = GetObjectByTag("Library_Pen");
            SetPlotFlag(oInkwell, FALSE);
            SetPlotFlag(oPen, FALSE);
        }

        //Golem-Maker's Ring
       else if (sItem == "GolemMakersRing")
        {
            //Make sure it's flagged as plot (in case you're repurchasing it
            //from a store).
            SetPlotFlag(oItem, TRUE);

            //Only add the journal entry once
            int bDoOnce = GetLocalInt(GetModule(), sItem+"bDoOnce");
            if (bDoOnce == FALSE)
            {
                //Add journal entry.
                AddJournalQuestEntry("Journ_Ashtara_40", 1, oPC, TRUE, TRUE);
                //Flag the DoOnce
                SetLocalInt(GetModule(), sItem+"bDoOnce", TRUE);
            }
            //Distribute XP to everyone
            object oPC_XP = GetFirstPC();
            while (oPC_XP != OBJECT_INVALID)
            {
                int bXP = GetLocalInt(oPC_XP, "XP_Ashtara_01");
                if (bXP == FALSE)
                {
                    SetLocalInt(oPC_XP, "XP_Ashtara_01", TRUE);
                    int iXP = FloatToInt(GetJournalQuestExperience("Journ_Ashtara_End") * 0.20);
                    GiveXPToCreature(oPC_XP, iXP);
                }
                oPC_XP = GetNextPC();
            }
        }

        //Quill Pen
        else if (sItem == "Library_Pen")
        {
            //Only add the journal entry once
            int bDoOnce = GetLocalInt(GetModule(), sItem+"bDoOnce");
            if (bDoOnce == FALSE)
            {
                //Add journal entry.
                //AddJournalQuestEntry("Journ_Library_40", 1, oPC, TRUE, TRUE);
                //Flag the area as restable
                object oArea = GetObjectByTag("Library_03a");
                SetLocalInt(oArea, "bAllowRest", TRUE);
                //Flag the DoOnce
                SetLocalInt(GetModule(), sItem+"bDoOnce", TRUE);
            }
            //Distribute XP to everyone
            object oPC_XP = GetFirstPC();
            while (oPC_XP != OBJECT_INVALID)
            {
                int bXP = GetLocalInt(oPC_XP, "XP_Library_03");
                if (bXP == FALSE)
                {
                    SetLocalInt(oPC_XP, "XP_Library_03", TRUE);
                    int iXP = FloatToInt(GetJournalQuestExperience("Journ_Library_End") * 0.07);
                    GiveXPToCreature(oPC_XP, iXP);
                }
                oPC_XP = GetNextPC();
            }
        }

        //Inkwell
        else if (sItem == "Library_Inkwell")
        {
            //Only add the journal entry once
            int bDoOnce = GetLocalInt(GetModule(), sItem+"bDoOnce");
            if (bDoOnce == FALSE)
            {
                //Add journal entry.
                //AddJournalQuestEntry("Journ_Library_60", 1, oPC, TRUE, TRUE);
                //Flag the area as restable
                object oArea = GetObjectByTag("Library_04a");
                SetLocalInt(oArea, "bAllowRest", TRUE);
                //Flag the DoOnce
                SetLocalInt(GetModule(), sItem+"bDoOnce", TRUE);
            }
            //Distribute XP to everyone
            object oPC_XP = GetFirstPC();
            while (oPC_XP != OBJECT_INVALID)
            {
                int bXP = GetLocalInt(oPC_XP, "XP_Library_05");
                if (bXP == FALSE)
                {
                    SetLocalInt(oPC_XP, "XP_Library_05", TRUE);
                    int iXP = FloatToInt(GetJournalQuestExperience("Journ_Library_End") * 0.07);
                    GiveXPToCreature(oPC_XP, iXP);
                }
                oPC_XP = GetNextPC();
            }
        }

        //Portable Door
        else if (sItem == "PortableDoor")
        {
            //Make sure it's flagged as plot (in case you're repurchasing it
            //from a store).
            SetPlotFlag(oItem, TRUE);
            //Destroy Dagget Filth in case they run into him again.
            object oDagget = GetObjectByTag("Dagget");
            DestroyObject(oDagget);
            //Only do the autosave once
            int bDoOnce = GetLocalInt(GetModule(), sItem+"bDoOnce");
            if (bDoOnce == FALSE)
            {
                //Flag the area as restable
                object oArea = GetObjectByTag("Wizard_04");
                SetLocalInt(oArea, "bAllowRest", TRUE);
                //Auto-Save
                DoSinglePlayerAutoSave();
                //Flag the DoOnce
                SetLocalInt(GetModule(), sItem+"bDoOnce", TRUE);
            }
            //Give everyone XP.
            object oPC_XP = GetFirstPC();
            while (oPC_XP != OBJECT_INVALID)
            {
                int bXP = GetLocalInt(oPC_XP, "XP_Wizard_05");
                if (bXP == FALSE)
                {
                    SetLocalInt(oPC_XP, "XP_Wizard_05", TRUE);
                    int iXP = FloatToInt(GetJournalQuestExperience("Journ_Wizard_End") * 0.10);
                    GiveXPToCreature(oPC_XP, iXP);
                }
                oPC_XP = GetNextPC();
            }
        }

        //Crypt Key
        else if (sItem == "Key_Crypt_01")
        {
            //Give everyone XP.
            object oPC_XP = GetFirstPC();
            while (oPC_XP != OBJECT_INVALID)
            {
                int bXP = GetLocalInt(oPC_XP, "XP_Crypt_03");
                if (bXP == FALSE)
                {
                    SetLocalInt(oPC_XP, "XP_Crypt_03", TRUE);
                    int iXP = FloatToInt(GetJournalQuestExperience("Journ_Crypt_End") * 0.04);
                    GiveXPToCreature(oPC_XP, iXP);
                }
                oPC_XP = GetNextPC();
            }

            //Destroy Sparkly
            object oSparkly = GetObjectByTag("Key_Crypt_01_Sparkly");
            DestroyObject(oSparkly);
        }

        //Book: Temple of the Winds - Rites and Rituals
        else if (sItem == "TempleRites")
        {
            //Set the local indicating that they know of the Three Winds.
            SetLocalInt(oPC, "bThreeWinds", TRUE);

            //Only add the journal entry once
            int bDoOnce = GetLocalInt(GetModule(), sItem+"bDoOnce");
            if (bDoOnce == FALSE)
            {
                //Handle any henchman interjections & pop-ups
                /*
                object oHench = GetHenchman(oPC);
                if (GetIsObjectValid(oHench) == TRUE)
                {
                    AssignCommand(oHench, SetHasInterjection(oPC, TRUE, 16));
                    AssignCommand(oHench, ClearAllActions());
                    AssignCommand(oPC, ClearAllActions());
                    AssignCommand(oHench, JumpToObject(oPC));
                    AssignCommand(oHench, DelayCommand(0.1,ActionStartConversation(oPC)));
                }
                */
                //Add journal entry.
                AddJournalQuestEntry("Journ_Winds_10", 1, oPC, TRUE, TRUE);
                //Flag the DoOnce
                SetLocalInt(GetModule(), sItem+"bDoOnce", TRUE);

            }

            //Give the player XP if they haven't already received it.
            int bXP = GetLocalInt(oPC, "XP_Main_03");
            if (bXP == FALSE)
            {
                SetLocalInt(oPC, "XP_Main_03", TRUE);
                int iXP = FloatToInt(GetJournalQuestExperience("Journ_Main_End") * 0.06);
                GiveXPToCreature(oPC, iXP);
            }
        }

        //Book: Krannabar's Guide to the Mythal
        else if (sItem == "MythalGuide")
        {
            //Only add the journal entry once
            int bDoOnce = GetLocalInt(GetModule(), sItem+"bDoOnce");
            if (bDoOnce == FALSE)
            {
                //Add journal entry.
                AddJournalQuestEntry("Journ_Main_20", 1, oPC, TRUE, TRUE);
                //Flag the DoOnce
                SetLocalInt(GetModule(), sItem+"bDoOnce", TRUE);
            }

            //Give the player XP if they haven't already received it.
            int bXP = GetLocalInt(oPC, "XP_Main_02");
            if (bXP == FALSE)
            {
                SetLocalInt(oPC, "XP_Main_02", TRUE);
                int iXP = FloatToInt(GetJournalQuestExperience("Journ_Main_End") * 0.04);
                GiveXPToCreature(oPC, iXP);
            }
        }

        //Books: Miscellaneous
        else if (sItem == "MoldyTome" ||
            sItem == "CityofShadows" ||
            sItem == "MechanicsFlight" ||
            sItem == "ArtofLichdom" ||
            sItem == "PoetryofFilth")
        {
            int iPercentDestroy = 70;
            if (Random(100)+1 <= iPercentDestroy)
            {
                //Inform the player that the book crumbles to dust in their hands.
                FloatingTextStrRefOnCreature(40500, oPC, FALSE);

                //Destroy the book.
                DestroyObject(oItem, 0.1);

                //Create puff of smoke
                effect eBookDust = EffectVisualEffect(VFX_FNF_SMOKE_PUFF);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eBookDust, oPC);
            }
        }

//HENCHMEN SPECIAL ITEMS
        //else if the item is Dorna's battle axe
        if (GetTag(oItem) == "x0_dor_battleaxe")
        {
            //Do a Henchman check
            if (GetTag(oPC) != "x0_hen_dor")
            {
                DestroyObject(oItem);
                object oDorna = GetObjectByTag("x0_hen_dor");
                if (GetIsObjectValid(oDorna) == TRUE)
                    CreateItemOnObject("dor_battleaxe", oDorna);
            }

        }
        //else if the item is Xanos's bracer
        else if (GetTag(oItem) == "x0_xan_bracer")
        {
            //Do a Henchman check
            if (GetTag(oPC) != "x0_hen_xan")
            {
                DestroyObject(oItem);
                object oXanos = GetObjectByTag("x0_hen_xan");
                if (GetIsObjectValid(oXanos) == TRUE)
                    CreateItemOnObject("xan_bracer", oXanos);
            }

        }
    }
}


///////////////////////////////////
//Henchman interjection functions//
///////////////////////////////////
void DoInterjection(object oHench, object oPC, int MOD_EVENT_NUMBER)
{
        AssignCommand(oHench, SetHasInterjection(oPC, TRUE, MOD_EVENT_NUMBER));
        AssignCommand(oHench, ClearAllActions());
        AssignCommand(oPC, ClearAllActions());
//        AssignCommand(oHench, ActionMoveToObject(oPC, TRUE, 6.0));
        AssignCommand(oHench, ActionStartConversation(oPC));
}
// * am I valid for doing an interjection
int ValidForInterjection(object oPC, object oHench)
{
    if (!IsInConversation(oPC)
        && GetDistanceBetweenLocations(GetLocation(oPC), GetLocation(oHench)) <= 20.0)
    {
        return TRUE;
    }
    return FALSE;
}
void CheckForInterjection(object oPC, int nEventNum, int bPopUpOnly = TRUE)
{
    // * choose which henchmen gets to interject

    object oDeekin = GetObjectByTag("x0_hen_dee");
    object oDorna = GetObjectByTag("x0_hen_dor");
    object oXanos = GetObjectByTag("x0_hen_xan");
    object oHench = OBJECT_INVALID;
    object oMaster = OBJECT_INVALID;

    if (GetIsObjectValid(oDeekin))
    {
        oMaster = GetMaster(oDeekin);
        if (GetIsObjectValid(oMaster))
        {
            oHench = oDeekin;
        }
    }
    if (GetIsObjectValid(oDorna))
    {
        oMaster = GetMaster(oDorna);
        if (GetIsObjectValid(oMaster))
        {
            oHench = oDorna;
        }
    }
    if (GetIsObjectValid(oXanos))
    {
        oMaster = GetMaster(oXanos);
        if (GetIsObjectValid(oMaster))
        {
            oHench = oXanos;
        }
    }

    //SpawnScriptDebugger();
    // The key tag of the trigger is the module event number
    int MOD_EVENT_NUMBER = nEventNum;

    string sHenchTag = GetTag(oHench);
    if (ValidForInterjection(oMaster, oHench) && ValidForInterjection(oHench, oMaster))
    {
        AssignCommand(oHench, SetOneLiner(TRUE, MOD_EVENT_NUMBER));
        //PopUp
        if (bPopUpOnly == TRUE)
        {
            AssignCommand(oHench, SpeakOneLinerConversation("", oMaster));
        }
        //Full Conversation
        else
        {
            AssignCommand(oHench, ActionStartConversation(oMaster, ""));
        }
    }
}
