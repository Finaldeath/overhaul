//::///////////////////////////////////////////////
//:: Knower of Places Area (OnEnter)
//:: H5_En_Places.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Journal entries & autosaves
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 8, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    //On PC Enter
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == TRUE)
    {
        //If Player has learned the Knower of Places' True Name
        int bTrueName = GetLocalInt(GetModule(), "bKnower_PlacesNamed");
        if (bTrueName == TRUE)
        {
            //Journal entry
            AddJournalQuestEntry("XP2_Name_Places", 20, oPC, TRUE, TRUE, TRUE);
            //Give non-repeatable XP
            int i2daRow = 168;
            int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
            if (bDuplicate == FALSE)
            {
                SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
                Reward_2daXP(oPC, i2daRow);
            }
            SetLocalInt(GetModule(), "HX_PLACES_LEFT", TRUE);
        }

        //Do Once
        int bAutosaved = GetLocalInt(OBJECT_SELF, "bAutosaved");
        if (bAutosaved == FALSE)
        {
            //Flag the Do Once
            SetLocalInt(OBJECT_SELF, "bAutosaved", TRUE);
            //Do an auto-save for the player.
            DoSinglePlayerAutoSave();
        }
    }
}
