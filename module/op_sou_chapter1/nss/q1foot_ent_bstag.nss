//::///////////////////////////////////////////////
//:: Name q1foot_ent_bstag
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When a PC enters the Blink Stag Track trigger -
    there is a 10% chance of spawning the stag tracks
    at corresponding trigger (as long as the stag has
    never been spawned before).
    Chance increases for rangers and druids.
    Discovering tracks will increase the chance of
    discovering the stag.
    If the stag tracks do not spawn - the trigger will
    deactivate itself for 60 seconds
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 27/03
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    //If the blink stag has never been created and this trigger is not 'down'
    if (GetLocalInt(GetModule(), "X1_nBlinkStag") != 1 && GetLocalInt(OBJECT_SELF, "nInActive") != 1)
    {
        object oPC = GetEnteringObject();
        //if it was a PC that crossed the trigger
        if (GetIsPlayerCharacter(oPC) == TRUE)
        {
            //Chance of finding the stag is increased every time a PC finds Blink Stag tracks
            int nChance = 5;
            //bonus for being a ranger/druid or barb
            if (GetLevelByClass(CLASS_TYPE_RANGER, oPC ) > 0 || GetLevelByClass(CLASS_TYPE_DRUID, oPC ) > 0 || GetLevelByClass(CLASS_TYPE_BARBARIAN, oPC ) > 0)
            {
                nChance = nChance + 50;
            }
            //bonus chance for smart PCs
            if (GetAbilityScore(oPC, ABILITY_INTELLIGENCE) > 12)
            {
                nChance = nChance + GetAbilityScore(oPC, ABILITY_INTELLIGENCE);
            }
            nChance = nChance + GetSkillRank(SKILL_SPOT);
            //if the roll succeeds - create the blink stag
            if (d100() <= nChance)
            {
                location lStag = GetLocation(GetNearestObjectByTag("wp_stagtracks"));
                CreateObject(OBJECT_TYPE_PLACEABLE, "q1blinkstagtrack", lStag);
                //Change variables
                SetLocalInt(oPC, "X1_nBlinkStagChance", GetLocalInt(oPC, "X1_nBlinkStagChance") + 10);
                //permanently deactivate this trigger
                SetLocalInt(OBJECT_SELF,"nInActive", 1);
                //Send Message to the PC
                FloatingTextStrRefOnCreature(40412, oPC);
            }
            else
            {
                //temporarily deactivate this trigger
                SetLocalInt(OBJECT_SELF,"nInActive", 1);
                DelayCommand(60.0, SetLocalInt(OBJECT_SELF,"nInActive", 0));
            }
        }
    }
}
