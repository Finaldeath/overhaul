//::///////////////////////////////////////////////
//:: Default: On User Defined
//:: NW_C2_DEFAULTD
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Determines the course of action to be taken
    on a user defined event.
*/
//:://////////////////////////////////////////////
//:: Created By: Don Moar
//:: Created On: April 28, 2002
//:://////////////////////////////////////////////
#include "nw_i0_generic"
#include "help_spells"
#include "help_general"
#include "help_hench"
#include "help_events"

// ---------  BEGIN SPECIFICATIONS  --------------- //

// NeutralChecker - Special Function to help with Neutral Characters
void NeutralChecker(object o);

// case 1001
void OnHeartbeat();

// case 1002
void OnPerceive();

// case 1003
void OnEndCombatRound();

// case 1004
void OnConversation();

// case 1005
void OnPhysicalAttacked();

// case 1006
void OnDamaged();

// case 1007
void OnDeath();

// case 1008
void OnDisturbed();

// case 1009

// case 1010

// case 1011
void OnSpellCastAt();

// other special functions
void SummonGuardsOnPC(object oPC);

// ---------  END SPECIFICATIONS  --------------- //


void NeutralChecker(object o)
{
    //Adjusting the Reputation of an area causes a crash. This is a workaround
    //until the issue gets patched. As GetObjectType() doesn't have an
    //OBJECT_TYPE_AREA constant, I'm taking a hackier approach... =o(
    int iAreaCheck_o = GetIsAreaNatural(o);
    int iAreaCheck_Self = GetIsAreaNatural(OBJECT_SELF);
    if (iAreaCheck_o == AREA_INVALID &&
        iAreaCheck_Self == AREA_INVALID)
    {
        object oFaction = GetObjectByTag("FACTION_NEUTRAL");

        if (GetFactionEqual(OBJECT_SELF, oFaction))
        {
            int nCurrent = GetReputation(OBJECT_SELF, o);

            AdjustReputation(o, OBJECT_SELF, 100);

            AdjustReputation(o, OBJECT_SELF, -50);

            ClearPersonalReputation(o);

            AssignCommand(OBJECT_SELF, ClearAllActions());
        }
    }
}

void SummonGuardsOnPC(object oPC)
{
    //Adjusting the Reputation of an area causes a crash. This is a workaround
    //until the issue gets patched. As GetObjectType() doesn't have an
    //OBJECT_TYPE_AREA constant, I'm taking a hackier approach... =o(
    int iAreaCheck_o = GetIsAreaNatural(oPC);
    int iAreaCheck_Self = GetIsAreaNatural(OBJECT_SELF);
    if (iAreaCheck_o == AREA_INVALID &&
        iAreaCheck_Self == AREA_INVALID)
    {
        int nCurrRep = GetReputation(OBJECT_SELF, oPC);

        AdjustReputation(oPC, OBJECT_SELF, 50 - nCurrRep);

        if (GetLocalInt(oPC, "N_GUARDS_SUMMONED") == FALSE)
        {
            SceneSpeak(OBJECT_SELF, "Someone help!  Please!  I'm being attacked!");

            SetLocalInt(oPC, "N_GUARDS_SUMMONED", TRUE);
        }
    }
}

void OnHeartbeat()
{
    /* NOT USING RIGHT NOW
    if (GetSubString(GetTag(OBJECT_SELF), 0, 10) == "CT_UNIQ_SG")
    {
        if (GetLocalInt(GetModule(), "N_MODULE_STAGE") == 1)
        {
            if (GetLocalInt(OBJECT_SELF, "N_MOVE_TO_WP") == 1)
            {
                int n = GetLocalInt(OBJECT_SELF, "N_CURR_MOVE_TO_WP");

                if (!GetIsInCombat())
                {
                    object oWP = GetNearestObjectByTag("WP_" + GetTag(OBJECT_SELF) + "_" + IntToString(n));

                    if (GetArea(OBJECT_SELF) == GetArea(oWP))
                        AssignCommand(OBJECT_SELF, ActionMoveToObject(oWP, TRUE));

                }
            }
        }
    }
    */
}

void OnPerceive()
{
    object oPC = GetLastPerceived();
    //Adjusting the Reputation of an area causes a crash. This is a workaround
    //until the issue gets patched. As GetObjectType() doesn't have an
    //OBJECT_TYPE_AREA constant, I'm taking a hackier approach... =o(
    int iAreaCheck_o = GetIsAreaNatural(oPC);
    int iAreaCheck_Self = GetIsAreaNatural(OBJECT_SELF);
    if (iAreaCheck_o == AREA_INVALID &&
        iAreaCheck_Self == AREA_INVALID)
    {
        // SPECIAL STAGE 0 NIGHTCRAWLERS FOR TARIN QUEST
        if (GetTag(OBJECT_SELF) == "CT_COMM_PH_MAN0")
        {
            if (GetIsPC(oPC))
            {
                if (!(GetIsEnemy(oPC)))
                {
                    if (GetLocalInt(oPC, "N_ST_0_PH_PERC_SWITCH") == 1)
                    {
                        if (GetTag(GetItemInSlot(INVENTORY_SLOT_CHEST, oPC)) != "IT_ARM_CLOTH_801")
                        {
                            SceneSpeak(OBJECT_SELF, "Intruders!  We have intruders!  Sound the alarm!");

                            AdjustReputation(oPC, OBJECT_SELF, -100);

                            DetermineCombatRound();

                            object o = GetFirstObjectInArea(GetArea(OBJECT_SELF));

                            while (o != OBJECT_INVALID)
                            {
                                if (GetObjectType(o) == OBJECT_TYPE_CREATURE)
                                    AssignCommand(o, DetermineCombatRound());

                                o = GetNextObjectInArea();
                            }
                        }
                    }
                }
            }
        } // END SPECIAL STAGE 0 FOR NIGHTCRAWLERS

        // SPECIAL STAGE 2 BLOODHAWK PERCEIVE
        else if (GetTag(OBJECT_SELF) == "CT_COMM_BH_STG2")
        {
            if (!(GetIsEnemy(oPC)))
            {
                if (GetIsPC(oPC) || GetIsPC(GetMaster(oPC)))
                {
                    if (GetObjectArmorString(oPC) == "Imperial")
                    {
                        SceneSpeak(OBJECT_SELF, "Imperials!  Imperials are here!  Set the alarm!  We must kill them at once!");

                        AdjustReputation(GetMaster(oPC), OBJECT_SELF, -100);

                        AdjustReputation(oPC, OBJECT_SELF, -100);

                        DetermineCombatRound();

                        object o = GetFirstFactionMember(OBJECT_SELF, FALSE);

                        while (o != OBJECT_INVALID)
                        {
                            if ((GetArea(OBJECT_SELF) == GetArea(o))
                            && (GetObjectType(o) == OBJECT_TYPE_CREATURE))
                                AssignCommand(o, DetermineCombatRound(GetNearestSeenOrHeardEnemy()));

                            o = GetNextFactionMember(OBJECT_SELF, FALSE);
                        }
                    }

                    else if (GetObjectArmorString(oPC) == "Bloodhaw")
                    {
                        if (Random(100) < 25)
                            SceneSpeak(OBJECT_SELF, "You must be from Ghajira...  Jhordak's been expecting you, so hurry along now!");
                    }

                    else
                    {
                        if (Random(100) < 25)
                            SceneSpeak(OBJECT_SELF, "I've got my eye on you...  Try anything foolish, and we'll slit your throat, fool!");
                    }
                }
            }
        } // END SPECIAL STAGE 2 BLOODHAWK PERCEIVE

        // SPECIAL STAGE 2 COMMANDER PERCEIVE
        else if (GetTag(OBJECT_SELF) == "CT_COMM_BH_S2CM")
        {

        } // END SPECIAL STAGE 2 BLOODHAWK COMMANDER PERCEIVE
    }
}

void OnEndCombatRound()
{
    object oPC = GetFirstPC();
    //Adjusting the Reputation of an area causes a crash. This is a workaround
    //until the issue gets patched. As GetObjectType() doesn't have an
    //OBJECT_TYPE_AREA constant, I'm taking a hackier approach... =o(
    int iAreaCheck_o = GetIsAreaNatural(oPC);
    int iAreaCheck_Self = GetIsAreaNatural(OBJECT_SELF);
    if (iAreaCheck_o == AREA_INVALID &&
        iAreaCheck_Self == AREA_INVALID)
    {

        if (GetIsEnemy(oPC))
        {
            if (GetImmortal())
            {
                // SPECIAL CASE OF CONSTRUCTS AT BEGINNING
                if (GetTag(OBJECT_SELF) == "CT_COMM_HS_CONS" && GetCurrentHitPoints() == 1)
                {
                    if (GetLocalInt(OBJECT_SELF, "N_DO_SPEAK_ONCE") == 0)
                    {
                        SceneSpeak(OBJECT_SELF, "Main power supply damaged...  Reverting to secondary shields...  Secondary shields activated...");

                        object oMark = GetNearestObjectByTag("HENCH_MARK");

                        int nJournalState = 9;

                        SceneSpeak(oMark, "I... I cannot pierce through these constructs' shields!  " + GetName(GetFirstPC()) + ", you must find a way to disable these constructs!  Go!  I'll hold them off here!");

                        AddJournalSingle("JT_GRAD_TEST", nJournalState, oPC);

                        SetLocalInt(OBJECT_SELF, "N_DO_SPEAK_ONCE", 1);
                    }
                }

                // else if dropped below 5% of hit points, surrender to enemies
                else if (GetCurrentHitPoints() <= 1)
                {
                    object o = GetFirstObjectInArea();

                    while (o != OBJECT_INVALID)
                    {
                        if (GetObjectType(o) == OBJECT_TYPE_CREATURE)
                        {
                            AssignCommand(o, ClearAllActions());

                            if (GetIsEnemy(o))
                            {
                                AdjustReputation(o, OBJECT_SELF, 50);

                                AdjustReputation(OBJECT_SELF, o, 50);
                            }
                        }

                        o = GetNextObjectInArea();
                    }

                    SetImmortal(OBJECT_SELF, FALSE);

                    // SPECIAL CASES HANDLING
                    string sTag = GetTag(OBJECT_SELF);

                    // SC - JHORDAK
                    if (sTag == "CT_UNIQ_BH_JHOR")
                    {
                        // STAGE 2
                        if (GetLocalInt(GetModule(), "N_MODULE_STAGE") == 2)
                        {
                            SceneSpeak(OBJECT_SELF, "Wait!  Please, do not kill me!  I... I surrender...");

                            AddJournalSingle("JT_ST_2_HENCH_LYEN", 10, oPC);
                        }
                    }
                }
            }
        }
    }
}

void OnConversation()
{
    // if Creature is "dead", cause them to set their facing
    if (GetStringLeft(GetTag(OBJECT_SELF), 7) == "CT_DEAD")
        AssignCommand(OBJECT_SELF, SetFacing(GetFacing(OBJECT_SELF)));
}

void OnPhysicalAttacked()
{
    object oAttacker = GetLastAttacker();
    //Adjusting the Reputation of an area causes a crash. This is a workaround
    //until the issue gets patched. As GetObjectType() doesn't have an
    //OBJECT_TYPE_AREA constant, I'm taking a hackier approach... =o(
    int iAreaCheck_o = GetIsAreaNatural(oAttacker);
    int iAreaCheck_Self = GetIsAreaNatural(OBJECT_SELF);
    if (iAreaCheck_o == AREA_INVALID &&
        iAreaCheck_Self == AREA_INVALID)
    {
        object oPC;

        // determine if attacker was a PC
        if (GetIsPC(oAttacker))
            oPC = oAttacker;

        // determine if attacker was an associate of a PC
        else if (GetIsPC(GetMaster(oAttacker)))
            oPC = GetMaster(oAttacker);

        // if either of the above is true, go into if statement
        if (oPC != OBJECT_INVALID)
        {
            if (GetClassByPosition(1) == CLASS_TYPE_COMMONER)
            {
                if (GetReputation(OBJECT_SELF, oPC) > 10)
                {
                    SummonGuardsOnPC(oPC);
                }
            }
        }

        // Safeguard for Neutral characters
        NeutralChecker(oAttacker);
    }
}

void OnDamaged()
{
    object oAttacker = GetLastDamager();
    //Adjusting the Reputation of an area causes a crash. This is a workaround
    //until the issue gets patched. As GetObjectType() doesn't have an
    //OBJECT_TYPE_AREA constant, I'm taking a hackier approach... =o(
    int iAreaCheck_o = GetIsAreaNatural(oAttacker);
    int iAreaCheck_Self = GetIsAreaNatural(OBJECT_SELF);
    if (iAreaCheck_o == AREA_INVALID &&
        iAreaCheck_Self == AREA_INVALID)
    {
        object oPC;

        // determine if attacker was a PC
        if (GetIsPC(oAttacker))
            oPC = oAttacker;

        // determine if attacker was an associate of a PC
        else if (GetIsPC(GetMaster(oAttacker)))
            oPC = GetMaster(oAttacker);

        // if either of the above is true, go into if statement
        if (oPC != OBJECT_INVALID)
        {
            //if I am the Nightcrawler doorman, sound the alarm.
            string sTag = GetTag(OBJECT_SELF);
            int bDoOnce = GetLocalInt(GetModule(), "bNightcrawlerDoormanDoOnce");

            if (((sTag == "CT_COMM_PH_DOORMAN01") || (sTag == "CT_COMM_PH_DOORMAN02")
            || (sTag == "CT_COMM_PH_DOORMAN03")) && bDoOnce == FALSE)
            {
                SetLocalInt(GetModule(), "bNightcrawlerDoormanDoOnce", TRUE);
                SceneSpeak(OBJECT_SELF, "Hey! Tell Malthar we've got trouble out here!");
                AdjustReputation(oPC, OBJECT_SELF, -100);
            }
        }

        // Safeguard for neutral characters
        NeutralChecker(oAttacker);
    }
}

void OnDeath()
{
    // BODY LOOT GENERATION BEGIN

    object oSelf = OBJECT_SELF;
    object oLoot;

    AssignCommand(OBJECT_SELF, PlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_LEFT));

/*  SetIsDestroyable(FALSE, FALSE, FALSE);

    vector  vHere = GetPosition(OBJECT_SELF);
    vector  vUnder = Vector(vHere.x, vHere.y,vHere.z-0.1f);
    location l = Location(GetArea(OBJECT_SELF), vUnder, 0.0f);

    object oLoot = CreateObject(OBJECT_TYPE_PLACEABLE, "PLAC_BODY_LOOT", l);

    SetLocalObject(OBJECT_SELF, "O_MY_LOOT", oLoot);
    SetLocalObject(oLoot, "O_MY_OWNER", oSelf);

    object o = GetFirstItemInInventory();

    while (o != OBJECT_INVALID)
    {
        if (GetDroppableFlag(o) == TRUE)
        {
            CreateItemOnObject(GetTag(o), oLoot, GetNumStackedItems(o));
            DestroyObject(o);
        }

        o = GetNextItemInInventory();
    }

    int i;

    for (i = 0; i < NUM_INVENTORY_SLOTS; i++)
    {
        o = GetItemInSlot(i);

        if (GetDroppableFlag(o) == TRUE)
        {
            CreateItemOnObject(GetTag(o), oLoot, GetNumStackedItems(o));
            DestroyObject(o);
        }
    }

    if (GetFirstItemInInventory(oLoot) == OBJECT_INVALID)
    {
        DestroyObject(oLoot);
        SetIsDestroyable(TRUE, FALSE, FALSE);
        DestroyObject(OBJECT_SELF, 6.0);
    }

    else
    {
        i = GetLocalInt(GetArea(OBJECT_SELF), "N_BODY_TRACKER");
        i++;

        // if more than 10 bodies in the area, destroy the first one
        if (i > 10)
        {
            int j = GetLocalInt(GetArea(OBJECT_SELF), "N_FIRST_BODY");
            j++;

            o = GetLocalObject(GetArea(OBJECT_SELF), "O_BODY_TRACKER_" + IntToString(j));
            SetLocalInt(GetArea(OBJECT_SELF), "N_FIRST_BODY", j);
            AssignCommand(o, SetIsDestroyable(TRUE, FALSE, FALSE));
            DestroyObject(o, 6.0);
        }

        // Object of body will be set into Area's list of bodies
        SetLocalObject(GetArea(OBJECT_SELF), "O_BODY_TRACKER_" + IntToString(i), OBJECT_SELF);
        SetLocalInt(GetArea(OBJECT_SELF), "N_BODY_TRACKER", i);
    }

    // BODY LOOT GENERATION END
*/

    // DESTROYABLE SETTINGS

    // If object marked not to be destroyed, set destroyable flag to FALSE
    if (GetLocalInt(OBJECT_SELF, "N_DONT_DESTROY_ON_DEATH") == 1)
    {
        int nResult;
        int nRaiseable = FALSE;
        int nSelectable = FALSE;

        nResult = GetLocalInt(OBJECT_SELF, "N_RAISE_WHEN_DEAD");

        if (nResult == 1)
            nRaiseable = TRUE;

        nResult = GetLocalInt(OBJECT_SELF, "N_SELECT_WHEN_DEAD");

        if (nResult == 1)
            nSelectable = TRUE;

        SetIsDestroyable(FALSE, nRaiseable, nSelectable);

        if (GetLocalInt(GetModule(), "N_TEST") == 1)
            SendMessageToPC(GetFirstPC(), "[NPC: " + GetTag(OBJECT_SELF) + " should be set to following settings (TRUE = " + IntToString(TRUE) + ", FALSE = " + IntToString(FALSE) + " :: " + IntToString(FALSE) + ", " + IntToString(nRaiseable) + ", " + IntToString(nSelectable) + "]");

    }

    //------------------------------------------

    // SPECIAL CASES BEGIN

    // Stage 0 Tavern Bloodhawks
    if (GetTag(OBJECT_SELF) == "CT_COMM_BH_S0SP")
    {
        if (GetLocalInt(GetModule(), "N_BH_ST_0_TAV_KEY_CREATED") == 0)
        {
            oLoot = CreateItemOnObject("IT_PLOT_040", OBJECT_SELF);
            SetDroppableFlag(oLoot, TRUE);

            SetLocalInt(GetModule(), "N_BH_ST_0_TAV_KEY_CREATED", 1);
        }

        int i = TRUE;

        object o = GetFirstObjectInArea();

        while (o != OBJECT_INVALID)
        {
            if (GetTag(o) == "CT_COMM_BH_S0SP" && GetIsDead(o) == FALSE)
                i = FALSE;

            o = GetNextObjectInArea();
        }

        if (i == TRUE)
        {
            object oDoor = GetNearestObjectByTag("DT_BH_ST_0_TAV_DOOR");

            SetLocked(oDoor, FALSE);
        }
    }

    // JHORDAK DEATH
    else if (GetTag(OBJECT_SELF) == "CT_UNIQ_BH_JHOR")
    {
        AddJournalSingle("JT_PREL_LYEN", 9, GetFirstPC());

        object oLyen = GetNearestObjectByTag("HENCH_LYEN");

        if (GetArea(oLyen) == GetArea(OBJECT_SELF))
        {
            SceneSpeak(oLyen, "May you rot in the hells for all eternity, Jhordak!");
        }
    }

    // Crimson Followers General
    else if (GetTag(OBJECT_SELF) == "CT_COMM_CF_FOLL")
    {
        // Stage 1 Grand Hall ambush
        if (GetLocalInt(GetModule(), "N_ST_1_CP_AMB") == 1)
        {
            int n = GetLocalInt(GetModule(), "N_ST_1_CP_AMB_NUMB");

            n++;

            SetLocalInt(GetModule(), "N_ST_1_CP_AMB_NUMB", n);

            if (n >= GetLocalInt(GetModule(), "N_ST_1_CP_AMB_TOTAL_NUMB"))
            {
                SceneSpeak(GetFirstPC(), "[As the last of the Crimson Followers falls to the ground, it appears the Crimson Prophet's magic wears off of the chamber doors, and they quickly swing open...]");

                object oHark = GetNearestObjectByTag("CT_UNIQ_SH_HARK");

                SceneSpeak(oHark, "The Crimson Prophet will not escape Ghaarak!  I must end his plans before it is too late!");

                AssignCommand(oHark, ActionMoveToObject(GetNearestObjectByTag("WP_EXIT", oHark), TRUE));

                SetLocalInt(oHark, "N_DONT_SPEAK", 1);

                DestroyObject(oHark, 6.0);

                object oHench = GetHenchman(GetFirstPC());

                if (oHench != OBJECT_INVALID)
                    DelayCommand(6.0, SceneSpeak(oHench, GetName(GetFirstPC()) + ", we must go to Harkon's aid at once!  He will need my assistance to stand against the Crimson Prophet!"));

                DeleteLocalInt(GetModule(), "N_ST_1_CP_AMB");

                object oDoor;

                int i;

                for (i = 1; i <= 3; i++)
                {
                    oDoor = GetNearestObjectByTag("DOOR_GHAA_CONTROL_ROOM", OBJECT_SELF, i);

                    SetLocked(oDoor, FALSE);
                    SetTrapDisabled(oDoor);

                    AssignCommand(oDoor, ActionOpenDoor(oDoor));
                }
            }
        }
    }

    // Stage 0 Xanthar assassination attack
    else if (GetTag(OBJECT_SELF) == "CT_UNIQ_NT_XANT" || GetTag(OBJECT_SELF) == "CT_COMM_CH_ASSA")
    {
        int n = GetLocalInt(GetModule(), "N_ST_0_ASSA_DEAD");

        n++;

        SetLocalInt(GetModule(), "N_ST_0_ASSA_DEAD", n);

        if (n >= 3)
            AddJournalSingle("JT_ST_0_MAIN", 7, GetFirstPC());
    }

    // Stage 0 Jhordak death
    else if (GetTag(OBJECT_SELF) == "CT_UNIQ_BH_JHOR")
    {
        SetMapPinEnabled(GetNearestObjectByTag("MP_JHORDAK"), FALSE);
    }

    // Stage 0 Mikel Ravenclaw Death
    else if (GetTag(OBJECT_SELF) == "CT_UNIQ_RC_MIKE")
    {
        if (GetLocalInt(GetModule(), "N_MODULE_STAGE") == 0)
        {
            object oPC = GetFirstPC();
            SetLocalInt(GetModule(), "N_MIKEL_DEAD", 1);
            object oSelf = OBJECT_SELF;
            object oNeutral = GetObjectByTag("FACTION_NEUTRAL");

            if (GetLocalInt(oPC, "N_PROMISED_MIKEL") == 1)
            {
                SendMessageToPC(oPC, "[Your alignment has shifted toward Chaotic for slaying Mikel after giving him your word...]");
                AdjustAlignment(oPC, ALIGNMENT_CHAOTIC, 5);
            }

            //Change the faction of Mikel's corpse to Neutral
            ChangeFaction(oSelf, oNeutral);

            //Change any remaining guards to Neutral
            int iNth = 1;
            object oCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, oPC, iNth);
            object oMaster;
            int bSurrender;
            while (oCreature != OBJECT_INVALID)
            {
                //Neutralize anyone who's not an associate of the player
                oMaster = GetMaster(oCreature);
                if (oMaster != oPC)
                {
                    //Make the first one say a message.
                    bSurrender = GetLocalInt(GetModule(), "bRCGuard_SurrenderMsg");
                    if (bSurrender == FALSE)
                    {
                        SceneSpeak(oCreature, "Mikel... Mikel is dead? I surrender! Please, I want no more trouble...");
                        SetLocalInt(GetModule(), "bRCGuard_SurrenderMsg", TRUE);
                    }

                    //Change the faction (Hammer to make sure...)
                    SetIsTemporaryNeutral(oPC, oCreature);

                    AssignCommand(oCreature, ClearAllActions(TRUE));
                    AssignCommand(oCreature, SurrenderToEnemies());
                    AssignCommand(oPC, ClearAllActions(TRUE));
                    AssignCommand(GetHenchman(oPC), ClearAllActions(TRUE));

                    SetIsTemporaryNeutral(oPC, oCreature);
                    ChangeToStandardFaction(oCreature, STANDARD_FACTION_COMMONER);

                    //Send them back to a safe spot where they won't block passage.
                    object oSafeWP = GetWaypointByTag("WP_RC_GUARDS_SAFEPOINT");
                    AssignCommand(oCreature, ActionForceMoveToObject(oSafeWP, FALSE, 1.0, 10.0));
                }

                //Clear their actions regardless of who they are.
                AssignCommand(oCreature, ClearAllActions(TRUE));

                //Update the loop variables.
                iNth++;
                oCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, oPC, iNth);
            }

            //Clear the player's actions
            AssignCommand(oPC, ClearAllActions(TRUE));

/*            object o = GetFirstFactionMember(oSelf, FALSE);
            while (o != OBJECT_INVALID)
            {
                AssignCommand(o, ClearAllActions());
                object oCursor = GetFirstObjectInArea();
                while (oCursor != OBJECT_INVALID)
                {
                    //Adjusting the Reputation of an area causes a crash. This is a workaround
                    //until the issue gets patched. As GetObjectType() doesn't have an
                    //OBJECT_TYPE_AREA constant, I'm taking a hackier approach... =o(
                    int iAreaCheck_o = GetIsAreaNatural(o);
                    int iAreaCheck_Self = GetIsAreaNatural(oCursor);
                    if (iAreaCheck_o == AREA_INVALID &&
                        iAreaCheck_Self == AREA_INVALID)
                    {
                        if (!(GetFactionEqual(oCursor, o)))
                        {
                            SetIsTemporaryNeutral(oCursor, o);
                            ClearPersonalReputation(oCursor, o);
                        }
                    }
                    oCursor = GetNextObjectInArea();
                }

                SceneSpeak(o, "Mikel... Mikel is dead?  I surrender!  Please, I want no more trouble...");

                o = GetNextFactionMember(oSelf, FALSE);
            }

            o = GetFirstObjectInArea();
            while (o != OBJECT_INVALID)
            {
                //Adjusting the Reputation of an area causes a crash. This is a workaround
                //until the issue gets patched. As GetObjectType() doesn't have an
                //OBJECT_TYPE_AREA constant, I'm taking a hackier approach... =o(
                int iAreaCheck_o = GetIsAreaNatural(o);
                int iAreaCheck_Self = GetIsAreaNatural(oSelf);
                if (iAreaCheck_o == AREA_INVALID &&
                    iAreaCheck_Self == AREA_INVALID)
                {
                    if (!(GetFactionEqual(o, oSelf)))
                    {
                        AssignCommand(o, ClearAllActions());

                        object oCursor = GetFirstObjectInArea();

                        while (oCursor != OBJECT_INVALID)
                        {
                            //Adjusting the Reputation of an area causes a crash. This is a workaround
                            //until the issue gets patched. As GetObjectType() doesn't have an
                            //OBJECT_TYPE_AREA constant, I'm taking a hackier approach... =o(
                            int iAreaCheck_o = GetIsAreaNatural(o);
                            int iAreaCheck_Self = GetIsAreaNatural(oCursor);
                            if (iAreaCheck_o == AREA_INVALID &&
                                iAreaCheck_Self == AREA_INVALID)
                            {
                                if (!(GetFactionEqual(oCursor, o)))
                                {
                                    SetIsTemporaryNeutral(oCursor, o);

                                    ClearPersonalReputation(oCursor, o);

                                }
                            }

                            oCursor = GetNextObjectInArea();

                        }
                    }
                }
                o = GetNextObjectInArea();
            }
*/
        }
    }

    // Stage 0 Kara's Spirit Death
    else if (GetTag(OBJECT_SELF) == "CT_UNIQ_KS_KRSP")
    {
        object oDoor = GetNearestObjectByTag("PLAC_S0_KARAS_DOOR");

        SetLocked(oDoor, FALSE);

        AssignCommand(oDoor, ActionOpenDoor(oDoor));

        SceneSpeak(GetFirstPC(), "[As the summoned spirit fades from existence, Kara's spell of holding on the door lifts, and you see your chance to escape this chamber...]");

        //Add in a DestroyObject call to deal with reported invulnerability wackiness.
        DestroyObject(OBJECT_SELF, 0.5);
    }


    // Stage 0 Ghasaran's Death
    else if (GetTag(OBJECT_SELF) == "CT_UNIQ_AK_GHAS")
    {
        object oDoor = GetNearestObjectByTag("PLAC_S0_KARAS_DOOR");

        SetLocked(oDoor, FALSE);

        SceneSpeak(GetFirstPC(), "[As Ghasaran falls to the ground, you feel that it is probably safe to unbar the door and escape now...]");

        AddJournalSingle("JT_PREL_KARA_2", 19, GetFirstPC());
    }

    // Stage 0 Varhun Death
    else if (GetTag(OBJECT_SELF) == "CT_UNIQ_SH_VARH" && GetLocalInt(GetModule(), "N_MODULE_STAGE") == 0)
    {
        SetLocalInt(GetFirstPC(), "N_VARH_DEAD", 1);

        AddJournalSingle("JT_PREL_MARK", 11, GetFirstPC());

        object o = GetFirstObjectInArea();

        while (o != OBJECT_INVALID)
        {
            if (GetTag(o) == "DOOR_VARH_CHAMB")
            {
                SetLocked(o, FALSE);
            }

            o = GetNextObjectInArea();
        }

        o = GetFirstFactionMember(OBJECT_SELF, FALSE);

        while (o != OBJECT_INVALID)
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), o);

            o = GetNextFactionMember(OBJECT_SELF, FALSE);
        }

        object oPC = GetFirstPC();

        object oAnag = GetNearestObjectByTag("CT_UNIQ_SH_ANAG", oPC);

        if (GetDistanceBetween(oPC, oAnag) > 10.0)
            AssignCommand(oAnag, JumpToObject(oPC));

        SceneSpeak(oAnag, GetName(oPC) + ", are you alright?  What has Varhun done...  [The Captain glances at the ruined body of Chancellor Varhun for a moment, then hurries over to you.]");
    }

    // Stage 1 Imperial Constructs
    else if (GetTag(OBJECT_SELF) == "CT_COMM_GC_CONS")
    {
        if (GetLocalInt(GetModule(), "N_MODULE_STAGE") == 1)
        {
                SetIsDestroyable(FALSE, TRUE, FALSE);
        }
    }

    // Stage 1 Crimson Prophet demons at Docks
    else if (GetLocalInt(OBJECT_SELF, "N_ST_1_CP_ENC") == 1)
    {
        int n = GetLocalInt(GetModule(), "N_ST_1_CP_ENC_NUMB");
        n--;
        SetLocalInt(GetModule(), "N_ST_1_CP_ENC_NUMB", n);

        if (n <= 0)
        {
            object oPC = GetFirstPC();

            AddJournalSingle("JT_ST_1_MAIN", 18, oPC);

            object oMark = GetNearestObjectByTag("HENCH_MARK", oPC);
            object oHark = GetNearestObjectByTag("CT_UNIQ_SH_HARK", oPC);

            RemoveAllEffects(oMark);

            RemoveAllEffects(oHark);

            SceneSpeak(oHark, "[Harkon slowly rises from the ground, apparently recovered from the Crimson Prophet's attack...]");

            SceneSpeak(oMark, "We must ensure Harkon has survived that assault unscathed...  Please, " + GetName(oPC) + ", come with me...");

            AssignCommand(oMark, ActionMoveToObject(oHark, TRUE));

            AssignCommand(oMark, DelayCommand(6.0, JumpToObject(oHark)));
        }
    }

    else if (GetTag(OBJECT_SELF) == "CT_UNIQ_HS_GOLD")
    {
        SetLocalInt(GetFirstPC(), "N_GW_DEAD", 1);

        object oDoor = GetNearestObjectByTag("DOOR_RK_CHAM_002");

        DestroyObject(oDoor);

        object oHench = GetHenchman(GetFirstPC());

        string sTest = GetStringLeft(GetTag(oHench), 11);

        TestMessage("[Should be testing out to get rid of Henchman : " + sTest + "]");

        if (sTest == "CT_UNIQ_GW_")
        {
            RemoveHenchman(oHench, GetFirstPC());

            SceneSpeak(oHench, "So falls the mighty Golden Warrior...  May Rakha welcome him in peace.  Fare thee well, " + GetName(GetFirstPC()) + ".  Rakha has surely blessed thee.");

            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_CELESTIAL), oHench);

            DestroyObject(oHench, 5.0);
        }

        object oInvs = GetNearestObjectByTag("PLAC_GW_PC_BEAM");

        DestroyObject(oInvs);
    }

    // SPECIAL CASES END

    //-----------------------------------------

    // GENERAL CASES BEGIN

    object oAttacker = GetLastKiller();

    object oPC;

    // determine if attacker was a PC
    if (GetIsPC(oAttacker))
        oPC = oAttacker;

    // determine if attacker was an associate of a PC
    else if (GetIsPC(GetMaster(oAttacker)))
        oPC = GetMaster(oAttacker);

    // if either of the above is true, go into if statement
    if (oPC != OBJECT_INVALID)
    {
        if (GetClassByPosition(1) == CLASS_TYPE_COMMONER)
        {
            //Adjusting the Reputation of an area causes a crash. This is a workaround
            //until the issue gets patched. As GetObjectType() doesn't have an
            //OBJECT_TYPE_AREA constant, I'm taking a hackier approach... =o(
            int iAreaCheck_o = GetIsAreaNatural(oPC);
            int iAreaCheck_Self = GetIsAreaNatural(OBJECT_SELF);
            if (iAreaCheck_o == AREA_INVALID &&
                iAreaCheck_Self == AREA_INVALID)
            {
                if (GetReputation(OBJECT_SELF, oPC) > 10)
                {
                    AdjustAlignment(oPC, ALIGNMENT_CHAOTIC, 3);
                    AdjustAlignment(oPC, ALIGNMENT_EVIL, 3);
                    SummonGuardsOnPC(oPC);
                }
            }
        }
    }

    // Handling of Unique NPC's
    if (GetStringLeft(GetTag(OBJECT_SELF), 7) == "CT_UNIQ")
    {
        SetLocalInt(GetModule(), "N_" + GetTag(OBJECT_SELF) + "_DEAD", 1);
    }

    // Safeguard for Neutral characters
    NeutralChecker(oAttacker);
    // GENERAL CASES END
}

void OnDisturb()
{
    object oDisturb = GetLastDisturbed();

    TurnToFaceObject(oDisturb);
    ActionPlayAnimation(ANIMATION_LOOPING_TALK_FORCEFUL, 1.0f, 2.0);
}

void OnSpellCastAt()
{
    object oAttacker = GetLastSpellCaster();

    object oPC;

    // determine if attacker was a PC
    if (GetIsPC(oAttacker))
        oPC = oAttacker;

    // determine if attacker was an associate of a PC
    else if (GetIsPC(GetMaster(oAttacker)))
        oPC = GetMaster(oAttacker);

    // if either of the above is true, go into if statement
    if (oPC != OBJECT_INVALID)
    {
        if (GetLastSpellHarmful())
        {
        }
    }

    // Safeguard for Neutral Characters
    NeutralChecker(oAttacker);
}

void main()
{
    int n = GetUserDefinedEventNumber();
    object o;
    string s;
    location l;

    switch (n)
    {
        // Heartbeat
        case 1001:
            OnHeartbeat();
            break;

        // Perception
        case 1002:
            OnPerceive();
            break;

        // End Combat Round
        case 1003:
            OnEndCombatRound();
            break;

        // Dialogue
        case 1004:
            OnConversation();
            break;

        // Physical Attacked
        case 1005:
            OnPhysicalAttacked();
            break;

        // Damaged
        case 1006:
            OnDamaged();
            break;

        // Death
        case 1007:
            OnDeath();
            break;

        // Disturbed
        case 1008:
            OnDisturb();
            break;

        // On Spell Cast At
        case 1011:
            OnSpellCastAt();
            break;

        // Stage 1 Crimson Prophet Event in Grand Hall
        case 9001:
            Stage1CrimsonProphetArrival(GetFirstPC());
            break;

        default:
            break;
    }

    return;

}
