//::///////////////////////////////////////////////
//:: On exit or quit dialogue
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Moves Aribeth to her waypoint and
    Updates the journal category when
    a player exits Aribeth's dialogue
    Journal update returns true if:
    - PC journal is at a lower value
    - None of the main plots are done
*/
//:://////////////////////////////////////////////
//:: Created By: Lukas Kristjanson
//:: Created On: March 25, 2002
//:://////////////////////////////////////////////

#include "NW_I0_Plot"
void main()
{
    object oPC = GetPCSpeaker();

    ActionMoveToObject(GetNearestObjectByTag("WP_M1Q1FAribeth"));

    if (GetLocalInt(GetModule(),"NW_G_M1Q2MainPlot")<100)
    {
        if (GetLocalInt(GetModule(),"NW_G_M1Q3MainPlot")<100)
        {
            if (GetLocalInt(GetModule(),"NW_G_M1Q4MainPlot")<100)
            {
                if (GetLocalInt(GetModule(),"NW_G_M1Q5MainPlot")<100)
                {
                    if (GetLocalInt(oPC, "NW_JOURNAL_ENTRYm1q2_News")<10)
                    {
                        AddJournalQuestEntry("m1q1_Main", 10, oPC);
                    }
                }
            }
        }
    }
// gives recall stone if one isn't present
    if(GetIsObjectValid(GetItemPossessedBy(oPC,"NW_IT_RECALL")) == FALSE)
    {
        CreateItemOnObject("NW_IT_RECALL",oPC);
    }
    PlayOldTheme();
}

