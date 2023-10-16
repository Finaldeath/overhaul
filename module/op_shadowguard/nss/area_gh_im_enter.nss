#include "help_general"
#include "help_hench"

void MarketGate(object o)
{
    SetPlotFlag(o, FALSE);

    if (GetLocalInt(GetModule(), "N_CONT_STONE_INACTIVE") == 0)
    {
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_GHOSTLY_VISAGE), o, 6.0);

        object oPed;

        oPed = GetNearestObjectByTag("PLAC_MKT_GAT_PED", o, 1);

        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(VFX_BEAM_LIGHTNING, oPed, BODY_NODE_CHEST), o, 6.0);

        oPed = GetNearestObjectByTag("PLAC_MKT_GAT_PED", o, 2);

        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(VFX_BEAM_LIGHTNING, oPed, BODY_NODE_CHEST), o, 6.0);

        SetPlotFlag(o, TRUE);
    }

    DelayCommand(6.0, MarketGate(o));
}

void MakeSGS(object oPC)
{
    object o;

    //o = CreateCreatureOnWP("CT_UNIQ_SG_MARK", oPC);
    //DelayCommand(6.0, SetLocalInt(o, "N_MOVE_TO_WP", 1));
}


void main()
{
    // Explores area for player
    if (GetIsPC(GetEnteringObject()))
        ExploreAreaForPlayer(OBJECT_SELF, GetEnteringObject());

    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        DoSinglePlayerAutoSave();

        // STAGE 0
        if (GetLocalInt(GetModule(), "N_MODULE_STAGE") == 0)
        {
            // For temporary modification, may leave in, won't make a difference
            AddJournalSingle("JT_ST_0_MAIN", 3, oPC);

            // Remove Henchman unless it is Markius
            object oHench = GetHenchman(oPC);

            if (oHench != OBJECT_INVALID && GetTag(oHench) == "HENCH_BRUK")
            {
                AssignCommand(oHench, ActionStartConversation(oPC, "impprotect_lyen"));
                //SceneSpeak(oHench, "My business lies in the Market District.  I will await your return there.");
                //HenchmanReturn(oHench);
            }

            // REMOVE MARKIUS IF HENCHMAN, AND ASSASSINATION PLOT QUEST HAS BEEN FINISHED
            if (GetTag(oHench) == "HENCH_MARK" && GetJournalQuestState("JT_PREL_MARK", oPC) >= 10)
            {
                RemoveHenchman(oPC, oHench);
                SceneSpeak(oHench, GetName(oPC) + ", I believe we should part paths for the moment...  Please, come speak with me...");
                DelayCommand(1.0f, AssignCommand(oHench, ActionStartConversation(oPC)));
            }

            // Have Gilles inform the player of father's status
            if (GetLocalInt(OBJECT_SELF, "N_DO_ONCE") == 0)
            {
                //Handle it as a cutscene so it can't be aborted.
                object oMessenger = GetNearestObjectByTag("CT_UNIQ_NT_MESS", oPC);

                BlackScreen(oPC);
                SetCutsceneMode(oPC, TRUE);
                AssignCommand(oMessenger, ActionStartConversation(oPC));

                DelayCommand(0.2, AssignCommand(oPC,
                    SetCameraFacing(230.0f, 8.0f, 65.0f, CAMERA_TRANSITION_TYPE_SNAP)));

                SetLocalInt(OBJECT_SELF, "N_DO_ONCE", 1);
            }

            if (GetJournalQuestState("JT_ST_0_MAIN", oPC) >= 8)
            {
                object o;

                o = GetNearestObjectByTag("CT_UNIQ_NT_MESS", oPC);

                if (GetArea(o) == GetArea(oPC))
                    DestroyObject(o);

                if (GetJournalQuestState("JT_ST_0_MAIN", oPC) == 8)
                {
                    o = CreateObject(OBJECT_TYPE_CREATURE, "ct_uniq_nt_mess", GetLocation(oPC));

                    DelayCommand(1.0, AssignCommand(o, ActionStartConversation(oPC)));
                }
            }

            if (GetJournalQuestState("JT_ST_0_MAIN", oPC) >= 11)
            {
                if (GetLocalInt(OBJECT_SELF, "N_DO_ST_0_MARK_CREATE") == 0)
                {
                    object oWP = GetNearestObjectByTag("WP_HENCH_MARK", oPC);

                    location lWP = GetLocation(oWP);

                    CreateHenchman(oPC, "HENCH_MARK", lWP);

                    SetLocalInt(OBJECT_SELF, "N_DO_ST_0_MARK_CREATE", 1);
                }


                if (GetJournalQuestState("JT_PREL_MARK", oPC) >= 9)
                {
                    object o = GetFirstObjectInArea();
                    while (o != OBJECT_INVALID)
                    {
                        if (GetTag(o) == "DOOR_010_0_0")
                        {
                            SetLocked(o, FALSE);
                            object oGuard = GetNearestObjectByTag("CT_COMM_SH_GHGD", o);
                            AssignCommand(oGuard, JumpToLocation(GetLocation(GetNearestObjectByTag("WP_CT_COMM_SH_GHGD", oGuard))));
                        }

                        o = GetNextObjectInArea();
                    }
                }
            }
        } // end if for Stage 0

        // STAGE 1
        else if (GetLocalInt(GetModule(), "N_MODULE_STAGE") == 1)
        {
            if (GetFirstTimeIn())
            {
                SceneSpeak(oPC, "[It seems the Imperial District has already suffered greatly at the hands of the Crimson Prophet... it lies in ruins and ashes all around you...]");
                AddJournalSingle("JT_ST_1_MAIN", 2, oPC);

                object o = GetFirstObjectInArea();

                object oCF = GetNearestObjectByTag("CT_COMM_CF_FOLL", oPC);
                object oAnag = GetNearestObjectByTag("CT_UNIQ_SH_ANAG", oPC);

                while (o != OBJECT_INVALID)
                {
                    if (GetTag(o) == "DOOR_013_0_1")
                        MarketGate(o);

                    else if (GetTag(o) == "CT_COMM_GC_CONS")
                    {
                        SetPlotFlag(o, FALSE);

                        if (GetJournalQuestState("JT_JANTHOS", oPC) == 5)
                            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), o);

                        else
                        {
                            AdjustReputation(oPC, o, -100);
                            AdjustReputation(oAnag, o, -100);
                            AdjustReputation(o, oAnag, -100);
                            ChangeToStandardFaction(o, STANDARD_FACTION_HOSTILE);
                        }
                    }

                    else if (GetTag(o) == "CT_COMM_SH_CITI" || GetTag(o) == "CT_COMM_SH_GUAR")
                    {
                        SetPlotFlag(o, FALSE);

                        SetLocalInt(o, "N_DONT_DESTROY_ON_DEATH", 1);

                        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), o);
                    }

                    o = GetNextObjectInArea();
                }
            }

            if (GetJournalQuestState("JT_ST_1_MAIN", oPC) >= 6)
            {
                object oDoor = GetNearestObjectByTag("DOOR_013_0_1", oPC);

                SetLocalInt(GetModule(), "N_CONT_STONE_INACTIVE", 1);

                SetLocked(oDoor, FALSE);

                AssignCommand(oDoor, ActionOpenDoor(oDoor));

                object o = GetFirstObjectInArea();

                // reset construct states
                while (o != OBJECT_INVALID)
                {
                    if (GetTag(o) == "CT_COMM_GC_CONS")
                    {
                        if (GetLocalInt(oPC, "N_RESET_CONSTS") == 1)
                        {
                            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectResurrection(), o);
                            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(GetMaxHitPoints(o)), o);

                            ChangeToStandardFaction(o, STANDARD_FACTION_MERCHANT);

                            ClearPersonalReputation(GetFirstPC(), o);
                            ClearPersonalReputation(o, GetHenchman(GetFirstPC()));
                            ClearPersonalReputation(GetHenchman(GetFirstPC()), o);

                            ClearPersonalReputation(o, GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, GetFirstPC()));
                            ClearPersonalReputation(o, GetAssociate(ASSOCIATE_TYPE_FAMILIAR, GetFirstPC()));
                            ClearPersonalReputation(o, GetAssociate(ASSOCIATE_TYPE_SUMMONED, GetFirstPC()));
                            ClearPersonalReputation(o, GetAssociate(ASSOCIATE_TYPE_DOMINATED, GetFirstPC()));

                            ClearPersonalReputation(GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, GetFirstPC()), o);
                            ClearPersonalReputation(GetAssociate(ASSOCIATE_TYPE_FAMILIAR, GetFirstPC()), o);
                            ClearPersonalReputation(GetAssociate(ASSOCIATE_TYPE_SUMMONED, GetFirstPC()), o);
                            ClearPersonalReputation(GetAssociate(ASSOCIATE_TYPE_DOMINATED, GetFirstPC()), o);
                        }

                        else if (GetLocalInt(oPC, "N_DEACTIVATE_CONSTS") == 1)
                        {
                            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), o);
                        }
                    }

                    o = GetNextObjectInArea();
                }

                SetLocalInt(oPC, "N_RESET_CONSTS", 0);
                SetLocalInt(oPC, "N_DEACTIVATE_CONSTS", 0);

                // end reset of constructs

                if (!(GetIsUniqueNPCDead("CT_UNIQ_SH_ANAG")))
                {
                    if (GetLocalInt(GetModule(), "N_TEST") == 1)
                        SendMessageToPC(oPC, "[Anagril should still be alive...]");

                    object oAnag = GetNearestObjectByTag("CT_UNIQ_SH_ANAG", oPC);

                    DestroyObject(oAnag);

                    oAnag = CreateCreatureOnWP("CT_UNIQ_SH_ANAG", oPC);
                }
            }
        } // end else if for Stage 1
    }
}
