//::///////////////////////////////////////////////
//:: Name q1foot_ent_blink
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When a PC enters the Blink Stag Track trigger -
    there is a 10% chance of spawning the blink stag
    at corresponding trigger (as long as the stag has
    never been spawned before).
    Chance increases depending on how many tracks the
    PC has discovered.
    Discovering tracks will increase the chance of
    discovering the stag by 10% per track.
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
            int nChance = GetLocalInt(oPC, "X1_nBlinkStagChance");

            //if the roll succeeds - create the blink stag
            if (d100() <= nChance)
            {
                location lStag = GetLocation(GetWaypointByTag("wp_q1foot_stag" + GetStringRight(GetTag(OBJECT_SELF), 1)));
                CreateObject(OBJECT_TYPE_CREATURE, "q1blinkstag", lStag);
                //permanently deactivate all triggers
                SetLocalInt(GetModule(),"X1_nBlinkStag", 1);
                //Send Message to the PC
                FloatingTextStrRefOnCreature(40414, oPC);
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
