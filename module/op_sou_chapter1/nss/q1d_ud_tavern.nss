//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName q1d_ud_tavern
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    1/3 of the time - spout a Random speak string
    Using for the mob in the Bubbling Cauldron
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 13/03
//:://////////////////////////////////////////////

void main()
{

    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        if (GetAILevel(OBJECT_SELF) != AI_LEVEL_VERY_LOW)
        {
            if (GetTag(OBJECT_SELF) != "q1dlodar" || GetTag(OBJECT_SELF) != "q1dcook")
            {
                //if the cook quest has not been completed.
                if (GetLocalInt(GetFirstPC(),"NW_JOURNAL_ENTRYq1dcook") <= 10)
                {
                    if (IsInConversation(OBJECT_SELF) == FALSE && GetIsInCombat() == FALSE)
                    {
                        if (Random(5) + 1 == 5)
                        {
                            SpeakOneLinerConversation();
                            SetFacingPoint(GetPosition(GetObjectByTag("q1dk_shaman")));
                            ActionPlayAnimation(ANIMATION_LOOPING_TALK_FORCEFUL, 1.0, 5.0);
                        }
                        else
                        {
                             //if the kobolds have not surrendered.
                             if (GetLocalInt(GetModule(), "Q1DKoboldSurrender") != 1)
                             {
                                SetFacingPoint(GetPosition(GetObjectByTag("q1dfacer")));
                             }
                        }
                    }
                }
                if (GetLocalInt(GetModule(), "X1_Q1DUNEQUIP") == 1)
                {
                    if (GetLocalInt(OBJECT_SELF, "nUnEquipped") != 1)
                    {
                        SetLocalInt(OBJECT_SELF, "nUnEquipped", 1);
                        object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND);
                        ActionUnequipItem(oWeapon);

                        //if the cook was saved -
                        if (GetLocalInt(GetModule(), "Captive_Cook") == 3)
                        {
                            //speak of victory
                            int nVictory;
                            //Find the hero pc
                            object oHero;
                            object oPC = GetFirstPC();
                            while (oPC != OBJECT_INVALID)
                            {
                                if (GetLocalInt(oPC, "Lodar_Job") > 0)
                                {
                                    oHero = oPC;
                                }
                                oPC = GetNextPC();
                            }
                            string szPCName = GetName(oHero);
                            int nRandom = Random(3) + 1;
                            if (nRandom == 1)
                                nVictory = 40541;
                            else if(nRandom == 2)
                                nVictory = 40542;
                            else
                            {
                                if (szPCName != "")
                                    nVictory = 40543;
                                else
                                    nVictory = 40544;
                            }
                            //dance of victory
                            int nDance;
                            int nRandom2 = Random(3) + 1;
                            if (nRandom2 == 1)
                                nDance = ANIMATION_FIREFORGET_VICTORY1;
                            else if(nRandom2 == 2)
                                nDance = ANIMATION_FIREFORGET_VICTORY2;
                            else
                                nDance = ANIMATION_FIREFORGET_VICTORY3;

                            //do the victory stuff
                            float fDelay1 = 0.0 + (IntToFloat(Random(10))/10.0);
                            DelayCommand(fDelay1, ActionPlayAnimation(nDance));
                            DelayCommand(2.0 + fDelay1, SpeakStringByStrRef(nVictory));
                        }
                        SetLocalInt(OBJECT_SELF, "nUnequipped", 1);
                        DelayCommand(5.0, ActionForceMoveToObject(GetWaypointByTag("q1dmob_post_" + GetStringRight(GetTag(OBJECT_SELF), 1)), FALSE, 1.0, 8.0));
                        DelayCommand(6.0, SetCommandable(FALSE));
                        DelayCommand(15.0, SetFacingPoint(GetPosition(GetObjectByTag("q1dpostfacer1"))));
                        DelayCommand(16.0, SetCommandable(TRUE));
                    }
                }
            }
            else
            {
                object oLodar = GetObjectByTag("q1dlodar");
                object oPCToReward;
                //if this is the cook
                if (GetTag(OBJECT_SELF) != "q1dlodar")
                {
                    //if the cook quest has not been completed.
                    if (GetLocalInt(GetFirstPC(),"NW_JOURNAL_ENTRYq1dcook") <= 10)
                    {
                        if (IsInConversation(OBJECT_SELF) == FALSE && GetIsInCombat() == FALSE)
                        {
                            object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
                            SetFacingPoint(GetPosition(oPC));
                        }
                    }
                    else if (GetLocalInt(GetModule(), "X1_Q1DUNEQUIP") == 1)
                    {
                        object oCook = GetObjectByTag("q1dcook");
                        if (GetLocalInt(oLodar, "q1d_Lodar_Reward") == 1 && GetLocalInt(oCook, "nGaveThanks") != 1)
                        {
                            oPCToReward = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
                            if (GetLocalInt(oPCToReward, "Lodar_Job") == 2 || GetLocalInt(oPCToReward, "Lodar_Job") == 3 || GetLocalInt(oPCToReward, "Lodar_Job") == 4 || GetLocalInt(oPCToReward, "Lodar_Job") == 5)
                            {
                                if (IsInConversation(oPCToReward) == FALSE)
                                    AssignCommand(oCook, ActionStartConversation(oPCToReward));
                            }
                        }
                   }
                }
                //else this is lodar- so start a conversation with the hero pc if he hasn't
                //been rewarded at the end of the quest yet..
                else
                {
                    if (GetLocalInt(GetModule(), "X1_Q1DUNEQUIP") == 1)
                    {

                        if (GetLocalInt(oLodar, "q1d_Lodar_Reward") == 0)
                        {
                            oPCToReward = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
                            if (GetLocalInt(oPCToReward, "Lodar_Job") == 2 || GetLocalInt(oPCToReward, "Lodar_Job") == 3 || GetLocalInt(oPCToReward, "Lodar_Job") == 4 || GetLocalInt(oPCToReward, "Lodar_Job") == 5)
                            {
                                if (IsInConversation(oPCToReward) == FALSE)
                                    AssignCommand(oLodar, ActionStartConversation(oPCToReward));
                            }
                        }
                   }
                }
            }
        }
    }
        //if attacked or harmful spell cast at...
    else if(nUser == 1005 || nUser == EVENT_SPELL_CAST_AT ) // ATTACKED
    {
        object oShaman = GetObjectByTag("q1dk_shaman");
        object oKobold1 = GetObjectByTag("q1dk_footpad1");
        object oKobold2 = GetObjectByTag("q1dk_footpad2");
        object oKobold3 = GetObjectByTag("q1dk_footpad3");
        object oKobold4 = GetObjectByTag("q1dk_footpad4");
        object oCook = GetObjectByTag("q1dcook");
        object oLodar = GetObjectByTag("q1dlodar");
        object oMob1 = GetObjectByTag("q1dmob1");
        object oMob2 = GetObjectByTag("q1dmob2");
        object oMob3 = GetObjectByTag("q1dmob3");
        object oMob4 = GetObjectByTag("q1dmob4");
        object oMob5 = GetObjectByTag("q1dmob5");
        object oMob6 = GetObjectByTag("q1dmob6");
        object oPC;
        if (nUser == 1005)
        {
            oPC = GetLastAttacker();
        }
        else
        {
            oPC = GetLastSpellCaster();
        }
        if (GetIsPC(oPC) == TRUE && GetLocalInt(GetArea(OBJECT_SELF), "nCOMMONSATTACKED") != 1)
        {//If a commoner is being attacked before the kobolds have attacked.
        //set the commoners to hostile and leave the kobolds


            ExecuteScript("q1d_attackcommons", oPC);

            SetLocalInt(oPC, "Lodar_Job", 7);


        }
    }



}

