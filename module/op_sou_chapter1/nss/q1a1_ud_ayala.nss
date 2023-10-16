//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName q1a1_ud_ayala
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  Ayala's user defined.  She should initiate conversation
  with the PC after the initial cutscene battle.  Keep
  initiating with them until they have the plot.
  Afterwards - intermittantly heal drogan..
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 1/03
//:://////////////////////////////////////////////
int CheckForNoKobolds();
void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        if (GetAILevel(OBJECT_SELF) != AI_LEVEL_VERY_LOW)
        {
            //if the first cutscene is over
            if (GetLocalInt(GetModule(), "X1_CUT1RUNNING") == 2 && GetIsInCombat() == FALSE)
            {

                    //Destroy extra kobold corpses
                    object oCorpse1 = GetObjectByTag("cut1_corpse1");
                    object oCorpse2 = GetObjectByTag("cut1_corpse2");
                    object oCorpse3 = GetObjectByTag("cut1_corpse3");
                    AssignCommand(oCorpse1, SetIsDestroyable(TRUE));
                    AssignCommand(oCorpse2, SetIsDestroyable(TRUE));
                    AssignCommand(oCorpse3, SetIsDestroyable(TRUE));
                    DestroyObject(oCorpse1);
                    DestroyObject(oCorpse2);
                    DestroyObject(oCorpse3);


                //If she hasn't told the PC the main plot yet.
                if (GetLocalInt(OBJECT_SELF, "Told_Main_Plot") != 1)
                {
                    //MOve to the nearest PC and start conversation
                    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
                    if (IsInConversation(oPC) == FALSE && GetDistanceToObject(oPC) < 8.0 && GetIsInCombat(oPC) == FALSE)
                    {
                        if (CheckForNoKobolds() == TRUE)
                        {
                            object oItem = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND);
                            if (oItem != OBJECT_INVALID)
                                ActionUnequipItem(oItem);

                            //Have Mischa unequip too.
                            object oMischa = GetObjectByTag("x0_hen_mis");
                            object oMisItem1 = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND);
                            object oMisItem2 = GetItemInSlot(INVENTORY_SLOT_LEFTHAND);
                            AssignCommand(oMischa, ActionUnequipItem(oMisItem1));
                            AssignCommand(oMischa, ActionUnequipItem(oMisItem2));

                            //Clear the PCs actions
                            AssignCommand(oPC, ClearAllActions(TRUE));

                            //Have Ayala approach the PC and start conversation
                            ActionStartConversation(oPC);

                            //Have henchmen move to their posts..
                            AssignCommand(oMischa, ActionMoveToObject(GetWaypointByTag("wp_mischa_post")));
                            DelayCommand(5.0, AssignCommand(GetObjectByTag("x0_hen_mis"), SetFacingPoint(GetPosition(GetObjectByTag("Drogan")))));
                            AssignCommand(GetObjectByTag("x0_hen_dor"), ActionMoveToObject(GetWaypointByTag("wp_dorna_post")));
                            DelayCommand(5.0, AssignCommand(GetObjectByTag("x0_hen_dor"), SetFacingPoint(GetPosition(GetObjectByTag("Drogan")))));
                            AssignCommand(GetObjectByTag("x0_hen_xan"), ActionMoveToObject(GetWaypointByTag("wp_xanos_post")));
                            DelayCommand(5.0, AssignCommand(GetObjectByTag("x0_hen_xan"), SetFacingPoint(GetPosition(GetObjectByTag("Drogan")))));
                        }
                    }
                    else if (IsInConversation(OBJECT_SELF) == FALSE)
                    {
                        ActionMoveToObject(GetWaypointByTag("wp_ayala_post"));
                        DelayCommand(5.0, SetFacingPoint(GetPosition(GetObjectByTag("Drogan"))));

                   }
                    //SpeakString("Talking to PC", TALKVOLUME_SHOUT);
                }
                if (GetLocalInt(GetModule(), "Drogan_Healed") == 0)
                {
                    if (GetLocalInt(OBJECT_SELF, "Told_Main_Plot") == 1 && IsInConversation(OBJECT_SELF) == FALSE)
                    {
                        SetLocalInt(OBJECT_SELF, "nHBCOUNT", GetLocalInt(OBJECT_SELF, "nHBCOUNT") + 1);
                        if (GetLocalInt(OBJECT_SELF, "nHBCOUNT") == 1)
                        {
                            //Heal herself or one of the henchmen...
                            object oXan = GetObjectByTag("x0_hen_xan");
                            object oDorna = GetObjectByTag("x0_hen_dor");
                            object oMischa1 = GetObjectByTag("x0_hen_mis");
                            object oAyala = OBJECT_SELF;

                            //Only heal the henchmen after Drogan has been cured..
                            //UPDATE - Not going to heal anyone before drogan is cured..
                            if (GetCurrentHitPoints(oAyala) < GetMaxHitPoints(oAyala))
                                SetLocalObject(OBJECT_SELF, "oHealTarget", oAyala);
                            /*else if (GetCurrentHitPoints(oMischa1) < GetMaxHitPoints(oMischa1))
                                SetLocalObject(OBJECT_SELF, "oHealTarget", oMischa1);
                            else if (GetCurrentHitPoints(oXan) < GetMaxHitPoints(oXan))
                                SetLocalObject(OBJECT_SELF, "oHealTarget", oXan);
                            else if (GetCurrentHitPoints(oDorna) < GetMaxHitPoints(oDorna))
                                SetLocalObject(OBJECT_SELF, "oHealTarget", oDorna);

                            if (GetDistanceToObject(GetLocalObject(OBJECT_SELF, "oHealTarget")) < 10.0  && GetCurrentHitPoints(GetLocalObject(OBJECT_SELF, "oHealTarget")) < GetMaxHitPoints(GetLocalObject(OBJECT_SELF, "oHealTarget")))
                                ActionCastSpellAtObject(SPELL_CURE_CRITICAL_WOUNDS, GetLocalObject(OBJECT_SELF, "oHealTarget"), METAMAGIC_ANY, TRUE);
                            */
                        }
                        else if (GetLocalInt(OBJECT_SELF, "nHBCOUNT") == 5)
                        {
                            int nSpell;
                            switch (Random(4) + 1)
                            {
                                case 1: nSpell = SPELL_ENDURANCE;
                                        break;
                                case 2: nSpell = SPELL_REMOVE_DISEASE;
                                        break;
                                case 3: nSpell = SPELL_NEUTRALIZE_POISON;
                                        break;
                                case 4: nSpell = SPELL_DEATH_WARD;
                                        break;
                            }
                            ActionCastSpellAtObject(nSpell, GetObjectByTag("Drogan"), METAMAGIC_ANY, TRUE);
                        }
                        else if (GetLocalInt(OBJECT_SELF, "nHBCOUNT") == 10)
                        {
                            ActionMoveToObject(GetObjectByTag("Drogan"), FALSE);
                            if (Random(2) + 1 == 2)
                            {
                                AssignCommand(OBJECT_SELF, ActionPlayAnimation(ANIMATION_LOOPING_MEDITATE,1.0, 3.0));
                            }
                            else
                            {
                                AssignCommand(OBJECT_SELF, ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW,0.8, 3.0));

                            }
                            SetLocalInt(OBJECT_SELF, "nHBCOUNT", 0);
                        }
                        else
                        {
                            ActionMoveToObject(GetWaypointByTag("wp_ayala_post"));
                            DelayCommand(5.0, SetFacingPoint(GetPosition(GetObjectByTag("Drogan"))));
                        }
                    }
                }
            }
            else if (GetLocalInt(GetModule(), "X1_CUT1RUNNING") == 2 && GetIsInCombat() == TRUE)
            {
                if (GetLocalInt(OBJECT_SELF, "nShout") != 1)
                {
                    //Have Henchmen shout when the Kobolds are leaving if the cutscene wasn't aborted
                    SetLocalInt(OBJECT_SELF, "nShout", 1);
                    if (GetLocalInt(GetModule(), "nCut1Aborted") != 1)
                    {

                        DelayCommand(4.0, AssignCommand(GetObjectByTag("x0_hen_xan"), SpeakStringByStrRef(40387)));
                        DelayCommand(3.0, AssignCommand(GetObjectByTag("x0_hen_dor"), SpeakStringByStrRef(40388)));
                    }
                }
            }
        }
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

    }
    else if(nUser == 1007) // DEATH
    {

    }
    else if(nUser == 1008) // DISTURBED
    {

    }

}
int CheckForNoKobolds()
{
    object oArea = GetArea(OBJECT_SELF);
    object oKobold = GetFirstObjectInArea(oArea);
    while (oKobold != OBJECT_INVALID)
    {
        if (GetIsDead(oKobold) == FALSE && (GetAppearanceType(oKobold) == APPEARANCE_TYPE_KOBOLD_A || GetAppearanceType(oKobold) == APPEARANCE_TYPE_KOBOLD_B || GetAppearanceType(oKobold) ==APPEARANCE_TYPE_KOBOLD_CHIEF_A || GetAppearanceType(oKobold) == APPEARANCE_TYPE_KOBOLD_CHIEF_B || GetAppearanceType(oKobold) ==APPEARANCE_TYPE_KOBOLD_SHAMAN_A || GetAppearanceType(oKobold) == APPEARANCE_TYPE_KOBOLD_SHAMAN_B))
            return FALSE;
        oKobold = GetNextObjectInArea(oArea);
    }
    return TRUE;
}

