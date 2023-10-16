//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName q1d_ud_kobold
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Kobold's in the Tavern user defined.
    If attacked or spell cast at - change factions
    of all tavern occupents to commoner or hostile
    as appropriate (which means they will kill the
    cook ASAP)
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 11/03
//:://////////////////////////////////////////////

#include "nw_i0_plot"
#include "nw_i0_generic"
void main()
{


    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        if (GetAILevel(OBJECT_SELF) != AI_LEVEL_VERY_LOW)
        {
            //if this is the shaman and the PC attacked the commoners but not the kobolds
            if (GetTag(OBJECT_SELF) == "q1dk_shaman" && GetLocalInt(GetArea(OBJECT_SELF), "nCOMMONSATTACKED") == 1 && GetLocalInt(GetArea(OBJECT_SELF), "nKOBOLDSATTACKED") != 1 && GetLocalInt(OBJECT_SELF, "nRewardedPC") != 1)
            {   //then talk to the PC

                object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
                if (IsInConversation(OBJECT_SELF) == FALSE && GetIsInCombat() == FALSE && GetLocalInt(OBJECT_SELF, "nRewardedPC") != 1)
                {
                    AssignCommand(oPC, ClearAllActions(TRUE));
                    ActionStartConversation(oPC);
                }
            }
            //else if you are the rest of the kobolds in the same situation and the shaman is dead - just head out the door.
            else if (GetIsObjectValid(GetObjectByTag("q1dk_shaman")) == FALSE && GetLocalInt(GetArea(OBJECT_SELF), "nCOMMONSATTACKED") == 1 && GetLocalInt(GetArea(OBJECT_SELF), "nKOBOLDSATTACKED") != 1)
            {

                AssignCommand(GetObjectByTag("q1dk_footpad1"), ClearAllActions(TRUE));
                AssignCommand(GetObjectByTag("q1dk_footpad2"), ClearAllActions(TRUE));
                AssignCommand(GetObjectByTag("q1dk_footpad3"), ClearAllActions(TRUE));
                AssignCommand(GetObjectByTag("q1dk_footpad4"), ClearAllActions(TRUE));

                AssignCommand(GetObjectByTag("q1dk_footpad1"), ActionMoveToObject(GetWaypointByTag("wp_q1d_exit"), TRUE));
                AssignCommand(GetObjectByTag("q1dk_footpad2"), ActionMoveToObject(GetWaypointByTag("wp_q1d_exit"), TRUE));
                AssignCommand(GetObjectByTag("q1dk_footpad3"), ActionMoveToObject(GetWaypointByTag("wp_q1d_exit"), TRUE));
                AssignCommand(GetObjectByTag("q1dk_footpad4"), ActionMoveToObject(GetWaypointByTag("wp_q1d_exit"), TRUE));
                SetCommandable(FALSE, GetObjectByTag("q1dk_footpad1"));
                SetCommandable(FALSE, GetObjectByTag("q1dk_footpad2"));
                SetCommandable(FALSE, GetObjectByTag("q1dk_footpad3"));
                SetCommandable(FALSE, GetObjectByTag("q1dk_footpad4"));
            }
            else
            {
                //If the kobolds are leaving with the hostage
                if (GetLocalInt(GetModule(), "X1_COOKHOSTAGE") == 1 || GetLocalInt(GetArea(OBJECT_SELF), "nKoboldsFleeing") == 1)
                {//run to the exit
                    object oExit = GetWaypointByTag("wp_q1d_exit");
                    SetCommandable(TRUE);
                    ActionMoveToObject(oExit, TRUE);
                    SetCommandable(FALSE);

                }
                else
                {
                    object oCentreRoom = GetWaypointByTag("wp_q1d_centreroom");
                    object oLeader= GetObjectByTag("q1dk_shaman");

                    if (GetIsInCombat(oLeader) == TRUE && GetIsInCombat() == FALSE)
                    {
                        ActionMoveToObject(oCentreRoom, TRUE);
                    }
                }
            }
        }
    }

        //if attacked or harmful spell cast at...
    else if(nUser == 1005 || (nUser == EVENT_SPELL_CAST_AT)) // ATTACKED
    {
        object oPC;
        if (nUser == 1005)
        {
            oPC = GetLastHostileActor();
        }
        else
        {
            oPC = GetLastSpellCaster();
        }

        if (GetIsPC(oPC) == TRUE)
        {
            //Variable for Lodar's conversation
            if (GetLocalInt(oPC, "Lodar_Job") < 2)
                SetLocalInt(oPC, "Lodar_Job", 6);
            else if (GetLocalInt(oPC, "Lodar_Job") == 2)
                SetLocalInt(oPC, "Lodar_Job", 3);
            else if (GetLocalInt(oPC, "Lodar_Job") == 4)
                SetLocalInt(oPC, "Lodar_Job", 5);
            if (GetLocalInt(GetArea(OBJECT_SELF), "nKOBOLDSATTACKED") != 1)
            {
                object oS1 = GetObjectByTag("q1dk_shaman");
                object oK1 = GetObjectByTag("q1dk_footpad1");
                object oK2 = GetObjectByTag("q1dk_footpad2");
                object oK3 = GetObjectByTag("q1dk_footpad3");
                object oK4 = GetObjectByTag("q1dk_footpad4");
                object oC = GetObjectByTag("q1dcook");
                SetCommandable(TRUE, oC);
                SetCommandable(TRUE, oK1);
                SetCommandable(TRUE, oK2);
                SetCommandable(TRUE, oK3);
                SetCommandable(TRUE, oK4);
                SetCommandable(TRUE, oS1);
                ExecuteScript("q1d_attackkobold", oPC);
            }


        }
    }
    else if(nUser == 1007 || nUser == 1100) // DEATH or destroyed by trigger
    {
        //set variable when Hurc dies
        if (GetTag(OBJECT_SELF) == "q1dk_shaman")
            SetLocalInt(GetModule(), "q5_Hurc_Alive", 0);

        if (GetLocalInt(OBJECT_SELF, "nDied") != 1)
        { //Check to see if this was the last kobold
            object oShaman = GetObjectByTag("q1dk_shaman");
            object oKobold1 = GetObjectByTag("q1dk_footpad1");
            object oKobold2 = GetObjectByTag("q1dk_footpad2");
            object oKobold3 = GetObjectByTag("q1dk_footpad3");
            object oKobold4 = GetObjectByTag("q1dk_footpad4");
            object oCook = GetObjectByTag("q1dcook");
            //Area
            object oArea = GetObjectByTag("q1dtavern");

            int nCount = 0;
            if (GetIsObjectValid(oKobold1))
                nCount += 1;
            if (GetIsObjectValid(oKobold2))
                nCount += 1;
            if (GetIsObjectValid(oKobold3))
                nCount += 1;
            if (GetIsObjectValid(oKobold4))
                nCount += 1;
            if (GetIsObjectValid(oShaman))
                nCount += 1;
            if (nCount <= 1)
            {
                if (GetIsObjectValid(oCook) == TRUE)
                {

                    if (GetLocalInt(GetModule(), "X1_REWARDQ1DXP") != 1)
                    {
                        SetLocalInt(GetModule(), "X1_REWARDQ1DXP", 1);
                        //if the cook hasn't been taken captive or killed
                        if (GetLocalInt(GetModule(), "Captive_Cook") != 1 && GetLocalInt(GetModule(), "Captive_Cook") != 2)
                        {
                            RewardXP("q1dcook", 100, GetFirstPC());
                            AddJournalQuestEntry("q1dcook", 30, GetFirstPC(), TRUE, TRUE);
                            SetLocalInt(GetModule(), "Captive_Cook", 3);
                        }


                    }
                }
                SetLocalInt(GetModule(),"X1_Q1DUNEQUIP", 1);
                MusicBackgroundStop(oArea);
                MusicBackgroundChangeDay(oArea, TRACK_TAVERN3);
                MusicBackgroundChangeNight(oArea, TRACK_TAVERN3);
                MusicBackgroundPlay(oArea);
            }
        }

    }




}

