//A more recent version of all of this already exists in "help_hench" >=o\

/*

#include "help_conv"

// ------------- BEGIN SPECIFICATIONS ------------ //

// AddJournalSingle - sets object o's sQuest state to nState
void AddJournalSingle(string sQuest, int nState, object o);

// RemoveJournalSingle - removes current state of sQuest from object o, and removes journal entry
void RemoveJournalSingle(string sQuest, object o);

// AddJournalParty - does AddJournalSingle for all objects in o's party
void AddJournalParty(string sQuest, int nState, object o);

// AddJournalAll - does AddJournalSingle for all players in the game
void AddJournalAll(string sQuest, int nState, object o);

// SetJournalQuest - sets an NPC's journal scripting to be done on sQuest
void SetJournalQuest(object o, string sQuest);

// GetJournalQuest - returns the string name for object with sObjectTag's current quest
string GetJournalQuest(string sObjectTag);

// GetJournalQuestState - returns what state of sQuest o is currently at
int GetJournalQuestState(string sQuest, object o);

// DeleteJournalSingle - exactly the same as RemoveJournalSingle
void DeleteJournalSingle(string sQuest, object o);

// GiveQuestXP - all XP handling for quests is done here
void GiveQuestXP(string sQuest, int nState, object o);

// SpecialJournal - handles unique situations that arise on journal state changes
void SpecialJournal(string sQuest, int nState, object o);

// ------------- END SPECIFICATIONS -------------- //

// ----------------------------------------------- //

// ------------- BEGIN IMPLEMENTATIONS ----------- //

void AddJournalSingle(string sQuest, int nState, object o)
{
    AddJournalQuestEntry(sQuest, nState, o, FALSE);

    if (GetPCInt(o, sQuest) < nState)
    {
        SetPCInt(o, sQuest, nState);
        GiveQuestXP(sQuest, nState, o);
        SpecialJournal(sQuest, nState, o);
    }
}

void RemoveJournalSingle(string sQuest, object o)
{
    SetPCInt(o, sQuest, 0);
    RemoveJournalQuestEntry(sQuest, o);
}

void AddJournalParty(string sQuest, int nState, object o)
{
    AddJournalQuestEntry(sQuest, nState, o);

    object oPC = GetFirstFactionMember(o);

    while (oPC != OBJECT_INVALID)
    {
        if (GetPCInt(oPC, sQuest) < nState)
            SetPCInt(oPC, sQuest, nState);

        oPC = GetNextFactionMember(o);
    }
}

void AddJournalAll(string sQuest, int nState, object o)
{
    AddJournalQuestEntry(sQuest, nState, o, TRUE, TRUE);
    object oPC;

    oPC = GetFirstPC();

    while (oPC != OBJECT_INVALID)
    {
        if (GetPCInt(oPC, sQuest) < nState)
            SetPCInt(oPC, sQuest, nState);

        oPC = GetNextPC();
    }
}

void SetJournalQuest(object o, string sQuest)
{
    string sTag = GetTag(o);

    SetLocalString(GetModule(), sTag + "_QUEST", sQuest);
}

string GetJournalQuest(string sObjectTag)
{
    return GetLocalString(GetModule(), sObjectTag + "_QUEST");
}

int GetJournalQuestState(string sQuest, object o)
{
    return GetPCInt(o, sQuest);
}

void DeleteJournalSingle(string sQuest, object o)
{
    RemoveJournalQuestEntry(sQuest, o);

    SetPCInt(o, sQuest, 0);
}

void GiveQuestXP(string sQuest, int nState, object o)
{
    int nXP = 0;

    if (sQuest == "JT_PREL_MARK")
    {
        switch (nState)
        {
            // Solved Mikel Ravenclaw portion of Assassination Plot Quest
            case 5: nXP = GetJournalQuestExperience(sQuest);
                break;

            case 11: nXP = GetJournalQuestExperience(sQuest) + 200;
                break;

            default:
                break;
        }
    }

    else if (sQuest == "JT_PREL_TARI")
    {
        switch (nState)
        {
            // Recovered Ghan's Soul Brooch, award XP
            case 4: nXP = GetJournalQuestExperience(sQuest);
                break;

            // ENDINGS OF PRELUDE TARIN QUEST

            case 15: //FALL THRU

            case 16: //FALL THRU

            case 18: nXP = GetJournalQuestExperience(sQuest) * 3;
                break;

            default:
                break;
        }
    }

    else if (sQuest == "JT_ST_1_MAIN")
    {
        switch (nState)
        {
            // Opened gates to Market District, reward XP
            case 6: nXP = GetJournalQuestExperience(sQuest);
                break;

            case 10: nXP = GetJournalQuestExperience(sQuest) / 2;
                break;

            case 18: nXP = GetJournalQuestExperience(sQuest) / 2;
                break;

            case 20: nXP = GetJournalQuestExperience(sQuest);
                break;

            default:
                break;
        }
    }

    if (nXP > 0)
        GiveXPToCreature(o, nXP);
}

void SpecialJournal(string sQuest, int nState, object o)
{
    object oSpecial;
    object oSpecial2;
    int i;

    if (sQuest == "JT_GRAD_TEST")
    {
        switch (nState)
        {

            case 6: oSpecial = GetNearestObjectByTag("DOOR_INT_2_1");

                AssignCommand(oSpecial, ActionOpenDoor(oSpecial));
                break;

            default:
                break;
        }
    }

    else if (sQuest == "JT_ST_1_MAIN")
    {
        switch (nState)
        {
            case 6: oSpecial = GetNearestObjectByTag("CT_UNIQ_SH_HARK", o);
                SignalEvent(oSpecial, EventUserDefined(9001));
                break;

            case 10:
                oSpecial = GetFirstObjectInArea();

                while (oSpecial != OBJECT_INVALID)
                {
                    if (GetTag(oSpecial) == "CT_UNIQ_SH_HARK" || (GetStringLeft(GetTag(oSpecial), 5) == "HENCH" && GetHenchman(GetFirstPC()) != oSpecial))
                    {
                        SetLocalInt(oSpecial, "N_DONT_SPEAK", 1);

                        AssignCommand(oSpecial, ActionMoveToObject(GetNearestObjectByTag("WP_EXIT", oSpecial)));

                        DestroyObject(oSpecial, 8.0);
                    }

                    oSpecial = GetNextObjectInArea();
                }

                break;

            case 19: oSpecial = GetNearestObjectByTag("DOOR_ST_1_DOCK_DOOR_VOY");

                SetLocked(oSpecial, FALSE);

                AssignCommand(oSpecial, ActionOpenDoor(oSpecial));

                oSpecial = GetFirstObjectInArea();
                while (oSpecial != OBJECT_INVALID)
                {
                    if (GetStringLeft(GetTag(oSpecial), 5) == "HENCH" || GetTag(oSpecial) == "CT_UNIQ_SH_HARK")
                    {
                        AssignCommand(oSpecial, ActionMoveToObject(GetNearestObjectByTag("MP_VOYAGER"), TRUE));

                        if (GetTag(oSpecial) != "HENCH_MARK")
                            DestroyObject(oSpecial, 7.0);

                        else
                            DelayCommand(7.0, AssignCommand(oSpecial, JumpToLocation(GetLocation(GetNearestObjectByTag("MP_VOYAGER")))));
                    }

                    oSpecial = GetNextObjectInArea();
                }

                break;

            default:
                break;
        }
    }

    // STAGE 2 MAIN QUEST
    else if (sQuest == "JT_ST_2_MAIN")
    {
        switch (nState)
        {
            case 2: AddHenchman(GetPCSpeaker());
                oSpecial = GetNearestObjectByTag("DOOR_022_1_0");
                SetLocked(oSpecial, FALSE);

                break;

            case 5: oSpecial = GetHenchman(o);
                DeleteLocalInt(GetModule(), "HENCH_MARK_N_DONT_LEAVE_PARTY");

                oSpecial = GetNearestObjectByTag("CT_UNIQ_SH_HARK", o);
                AssignCommand(oSpecial, ActionMoveToObject(GetNearestObjectByTag("WP_EXIT", oSpecial)));
                DestroyObject(oSpecial, 4.0);

                break;

            default:
                break;
        }
    }


    // TARIN'S STAGE 0 QUEST
    else if (sQuest == "JT_PREL_TARI")
    {
        switch (nState)
        {
            case 5: AdjustAlignment(o, ALIGNMENT_EVIL, 5);
                break;

            case 7: AdjustAlignment(o, ALIGNMENT_GOOD, 5);
                DestroyObject(GetItemPossessedBy(o, "IT_PLOT_003"));
                break;

            case 8: oSpecial = GetNearestObjectByTag("WP_CT_UNIQ_PH_MALT", o);
                oSpecial = CreateObject(OBJECT_TYPE_CREATURE, "CT_UNIQ_PH_MALT", GetLocation(oSpecial));
                oSpecial2 = OBJECT_SELF;
                AssignCommand(oSpecial, ClearAllActions());
                AssignCommand(oSpecial, ActionMoveToObject(oSpecial2));
                break;

            case 9: oSpecial = GetNearestObjectByTag("HENCH_BRUK", o);
                if (GetArea(oSpecial) == GetArea(o))
                    AssignCommand(oSpecial, ActionSit(GetNearestObjectByTag("PT_" + GetTag(oSpecial), oSpecial)));

                oSpecial = GetNearestObjectByTag("HENCH_TARI", o);
                if (GetArea(oSpecial) == GetArea(o))
                    AssignCommand(oSpecial, ActionSit(GetNearestObjectByTag("PT_" + GetTag(oSpecial), oSpecial)));

                oSpecial = GetNearestObjectByTag("CT_UNIQ_PH_MALT", o);
                if (GetArea(oSpecial) == GetArea(o))
                    AssignCommand(oSpecial, ActionSit(GetNearestObjectByTag("PT_" + GetTag(oSpecial), oSpecial)));

                break;

            case 10:
                SetLocalInt(GetModule(), "N_ABDUCTED_HENCH_TARI", 1);

                oSpecial = GetNearestObjectByTag("HENCH_TARI", o);
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectSleep(), oSpecial, 15.0);
                DestroyObject(oSpecial, 6.0);

                oSpecial = GetNearestObjectByTag("HENCH_BRUK", o);
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectSleep(), oSpecial, 6.0);

                oSpecial = GetNearestObjectByTag("CT_UNIQ_PH_MALT", o);

                AssignCommand(oSpecial, ClearAllActions());

                if (GetLocalInt(o, "N_DRANK_PH_ALE") == 1)
                {
                    AssignCommand(o, ClearAllActions());
                    DelayCommand(1.0, AssignCommand(o, PlayAnimation(ANIMATION_LOOPING_DEAD_FRONT, 1.0, 6.0)));
                    DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectDarkness(), o, 6.0));
                    AssignCommand(o, SpeakString("[The effects of the tainted drink cause you to slump to the ground, succumbing to the darkness of sleep...]"));
                }

                if (GetLocalInt(o, "N_ST_0_PROTECT_TARIN") == 1)
                {
                    AssignCommand(oSpecial, SpeakString("[" + GetName(oSpecial) + "]  You men take care of this one while I get Tarin out of here!  [Malthar quickly gathers Tarin's prone body and head towards the exit as his men begin to attack...]"));

                    oSpecial2 = GetFirstFactionMember(oSpecial, FALSE);

                    for (i = 1; i <= 2; i++)
                    {
                        oSpecial2 = GetNearestObjectByTag("CT_COMM_PH_MAN0", o, i);

                        AssignCommand(oSpecial2, ClearAllActions());

                        SetLocalInt(oSpecial2, "N_DONT_SPEAK", 1);

                        ChangeToStandardFaction(oSpecial2, STANDARD_FACTION_HOSTILE);

                        DelayCommand(0.5, SetPlotFlag(oSpecial2, FALSE));

                        DelayCommand(1.0, AssignCommand(oSpecial2, ActionAttack(o)));
                    }
                }

                else
                {
                    AssignCommand(oSpecial, SpeakString("[" + GetName(oSpecial) + "]  C'mon, men!  Let's get Tarin out of here... leave the others...  [Malthar quickly gathers Tarin's prone body and head towards the exit...]"));

                    for (i = 1; i <= 2; i++)
                    {
                        oSpecial2 = GetNearestObjectByTag("CT_COMM_PH_MAN0", o, i);

                        AssignCommand(oSpecial2, ClearAllActions());

                        SetLocalInt(oSpecial2, "N_DONT_SPEAK", 1);

                        AssignCommand(oSpecial2, ActionEquipMostDamagingMelee());

                        AssignCommand(oSpecial2, ActionMoveToObject(GetNearestObjectByTag("WP_EXIT", oSpecial2)));

                        DestroyObject(oSpecial2, 4.0);
                    }
                }

                AssignCommand(oSpecial, ActionMoveToObject(GetNearestObjectByTag("WP_EXIT", oSpecial)));

                SetLocalInt(oSpecial, "N_DONT_SPEAK", 1);

                DestroyObject(oSpecial, 10.0);

                oSpecial = GetNearestObjectByTag("CT_UNIQ_NT_GHAN", o);

                AssignCommand(oSpecial, ActionMoveToObject(o, TRUE));

                DelayCommand(6.0, AssignCommand(oSpecial, SpeakString("[" + GetName(oSpecial) + "]  " + GetName(o) + ", what has happened?  Where have they taken little Tarin?")));

                break;

            // ENDINGS OF PRELUDE TARIN QUEST

            // 15 - Allowed Malthar to take Tarin away
            case 15: AdjustAlignment(o, ALIGNMENT_EVIL, 10);
                break;

            // 16 - Allowed Malthar to take both Tarin and Brukus away
            case 16: AdjustAlignment(o, ALIGNMENT_EVIL, 20);
                break;

            // 18 - Tarin free
            case 18:
                SetLocalInt(GetModule(), "N_ABDUCTED_HENCH_TARI", 0);
                oSpecial = GetNearestObjectByTag("HENCH_TARI", o);
                AssignCommand(oSpecial, SpeakString("[" + GetName(oSpecial) + "]  Thank the gods!  I'm free!"));
                DestroyObject(oSpecial, 4.0);

                oSpecial = GetNearestObjectByTag("CT_UNIQ_PH_MALT", o);

                oSpecial2 = GetFirstFactionMember(oSpecial, FALSE);

                while (oSpecial2 != OBJECT_INVALID)
                {
                    if (oSpecial2 != oSpecial)
                    {
                        AssignCommand(oSpecial2, ActionMoveToObject(GetNearestObjectByTag("WP_EXIT", oSpecial2)));

                        DestroyObject(oSpecial2, 5.0);
                    }

                    oSpecial2 = GetNextFactionMember(oSpecial, FALSE);
                }

                AssignCommand(oSpecial, ActionMoveToObject(GetNearestObjectByTag("WP_EXIT", oSpecial)));

                DestroyObject(oSpecial, 12.0);

                AdjustAlignment(o, ALIGNMENT_GOOD, 10);
                break;

            default:
                break;
        }
    }
}

*/
