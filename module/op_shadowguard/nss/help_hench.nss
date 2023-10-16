#include "help_conv"
#include "nw_i0_generic"
#include "inc_rob"

const int NEUTRAL = 0;
const int FRIENDLY = 1;
const int UNFRIENDLY = 2;

const int HENCH_INTERLUDE_XP = 200;

// -------------------------------------------------------------------------------------------------
// BEGIN SPECIFICATIONS
// -------------------------------------------------------------------------------------------------

// Creates a Henchman object at the specified location based on Master Henchman
object CreateHenchman(object oPC, string sTag, location l);

// Causes Henchman to equip appropriate items
void HenchmanEquipAppropriateItems(object oHench);

// Spawns a Henchman at the appropriate Waypoint for the current Stage
object SpawnHenchman(object oPC, string sTag);

// Permanently kill a Henchman
void PermKillHenchman(object oHenchman, object oPC);

// Returns the Reference Henchman object (the Master Henchman)
object GetRefHench(object oSelf);

// Makes new Reference Henchman object (the Master Henchman) (used mainly during level ups)
void MakeNewRefHench(object oSelf);

// Destroy a Henchman item (destroys on the Master Henchman as well)
void DestroyHenchObject(object o);

// Causes the Master Henchman to equip appropriate items
void UpdateHenchItems(object oSelf);

// Gets the appropriate Waypoint for the Henchman depending on the current Stage's main quest state
object GetHenchmanSpawnPoint(string sTag);

// Causes the Henchman to return to its appropriate Waypoint
void HenchmanReturn(object oHench);

// Spawn all Henchmen at their respective Waypoints
void SpawnAllHenchmen(object oPC);

// Levels up one particular Henchmen
void LevelUpSingleHenchman(object oPC, object oHench);

// Level up all Henchmen (this raises level of all Henchman in the game)
void LevelUpAllHenchmen(object oPC);

// Destroys any associate "Henchmen" of a Henchman - used for Henchmen such as Kara who summon companions
void DestroyAssociate(object oAssociate, int nAssociateClass);

// Moves a Henchman to their appropriate Area waypoint (custom designed in an area)
void MoveHenchman_Area(object oArea, string sHench, int nRun = TRUE);

// Henchman Death Script
void HenchmanDeath(object oHench = OBJECT_SELF);

// Increments Area move counter for sHench by i amount
void IncrementHenchAreaCounter(object oArea, string sHench, int i = 1);

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

// Causes object oPC to begin cutscene "sConv" with themself
void BeginCutscene(object oPC, string sConv, int nFadeToBlack = FALSE, float fTransitionSpeed = FADE_SPEED_FASTEST);

// Used in first line of Cutscene conversation to initialize PC's state
void InitializeCutscene(object oPC, int nDominated = TRUE, int nParalyzed = FALSE, int nInvisible = FALSE, float fDirection = -1.0, float fDistance = 20.0, float fPitch = -1.0, int nTransitionType = CAMERA_TRANSITION_TYPE_SLOW);

// Causes object oPC to end current cutscene and remove all cutscene Effects
void EndCutscene(object oPC);

// Changes Camera Mode during Cutscene
void ChangeCameraFacing(object oPC, int nCameraMode, float fDegrees);

// Causes object oPC to be jumped to "i-th" Waypoint for oPC's current area
void CutsceneJumpToWaypoint(object oPC, int i);

// Return the current Cutscene "stage" that oPC is in
int GetCutsceneStage(object oPC);

// Causes all Enemy creatures to object o to immediately die
void DestroyAllEnemyCreaturesInArea(object o);

// Get Henchman-PC friendliness - returns int telling how Henchman feels about oPC
int GetHenchmanReaction(object oPC, object oHench);

// Strip any weapons from oCreature and deposit them in oContainer.
void StripWeapons(object oCreature, object oContainer);

// ------------- END SPECIFICATIONS -------------- //

object CreateHenchman(object oPC, string sTag, location l)
{
    int i;

    // Get the Master Henchman
    object oMasterHench = GetLocalObject(GetModule(), "O_MASTER_" + sTag);

    // Destroy all other copies of this Henchman
    object oOther = GetObjectByTag(sTag);

    while (oOther != OBJECT_INVALID)
    {
        // if not the reference henchman, destroy copy
        if (oOther != oMasterHench)
            DestroyObject(oOther, 5.0);

        i++;

        oOther = GetObjectByTag(sTag, i);
    }

    object o = OBJECT_INVALID;

    // Copy from Master Henchman
    o = CopyObject(oMasterHench, l);
    HenchmanEquipAppropriateItems(o);

    SetLocalInt(o, "N_SPAWNED_ITEMS", 1);

/*DEBUG*///Flag the henchman as immortal until a proper system for henchman
/*DEBUG*///death can be established.
/*DEBUG*/SetImmortal(o, TRUE);

    //Make sure they're the right level for the player
    LevelUpSingleHenchman(oPC, o);

    return o;
}

void HenchmanEquipAppropriateItems(object oHench)
{
    int i;

    object o;

    string sItemTag;

    for (i = 0; i <= NUM_INVENTORY_SLOTS; i++)
    {
        sItemTag = GetLocalString(GetModule(), "S_HENCH_SLOT_" + GetTag(oHench) + "_" + IntToString(i));

        o = GetItemPossessedBy(oHench, sItemTag);

        AssignCommand(oHench, ActionEquipItem(o, i));
    }
}

object SpawnHenchman(object oPC, string sTag)
{
    object oWP = GetHenchmanSpawnPoint(sTag);
    location lWP = GetLocation(oWP);

    PrintString("SpawnHenchman -" + sTag);

    return CreateHenchman(oPC, sTag, lWP);
}

void PermKillHenchman(object oHenchman, object oPC)
{
    // Set the Module's int value to reflect that Henchman is permanently dead
    SetLocalInt(GetModule(), "N_" + GetTag(OBJECT_SELF) + "_PERM_DEAD", 1);

    // Destroy all copies of Henchman in module
    int i = 0;

    object o = GetObjectByTag(GetTag(oHenchman), i);

    while (o != OBJECT_INVALID)
    {
        DestroyObject(o, 5.0);

        i++;

        o = GetObjectByTag(GetTag(oHenchman), i);
    }

    // Update the PC's journal to reflect that Henchman can no longer be used
    AddJournalSingle("JT_" + GetTag(OBJECT_SELF), 200, oPC);

}

object GetRefHench(object oSelf)
{
    return GetLocalObject(GetModule(), "O_MASTER_" + GetTag(oSelf));
}

void MakeNewRefHench(object oSelf)
{
    object oOldRef = GetLocalObject(GetModule(), "O_MASTER_" + GetTag(oSelf));

    location l = GetLocation(oOldRef);

    DestroyObject(oOldRef);

    CopyObject(oSelf, l);
}

void DestroyHenchObject(object o)
{
    // first, destroy the referenced object
    DestroyObject(GetLocalObject(o, "N_REF_ITEM"));

    // then, destroy this object
    DestroyObject(o);
}

void UpdateHenchItems(object oSelf)
{
    // Cause the Master Henchman to equip reference items
    // in same fashion as oSelf

    int i;

    object o;

    for (i = 0; i <= NUM_INVENTORY_SLOTS; i++)
    {
        o = GetItemInSlot(i, oSelf);

        if (o != OBJECT_INVALID)
            SetLocalString(GetModule(), "S_HENCH_SLOT_" + GetTag(oSelf) + "_" + IntToString(i), GetTag(o));
    }
}

object GetHenchmanSpawnPoint(string sTag)
{
    object oPC = GetFirstPC();
    int nModStage = GetLocalInt(GetModule(), "N_MODULE_STAGE");
    int nStageMainQuest = GetJournalQuestState("JT_ST_" + IntToString(nModStage) + "_MAIN", oPC);
    object oWP = OBJECT_INVALID;


    // SPECIAL STAGE 2 QUEST HANDLING
    if (GetLocalInt(GetModule(), "N_MODULE_STAGE") == 2 && GetLocalString(GetModule(), "S_ST_2_SP_HENCH_QUEST") == sTag)
    {
        oWP = GetWaypointByTag("WP_S2_BEG_QST_" + sTag);
    }

    else
    {
        while ((oWP == OBJECT_INVALID) && (nStageMainQuest >= 0))
        {
            oWP = GetWaypointByTag("WP_HR_" + sTag + "_" + IntToString(nModStage) + "_" + IntToString(nStageMainQuest));

            if (GetLocalInt(GetModule(), "N_TEST") == 1)
                SendMessageToPC(oPC, "[Henchman Tag : " + sTag + " : No Valid Waypoint at WP_HR_" + sTag + "_" + IntToString(nModStage) + "_" + IntToString(nStageMainQuest));

            nStageMainQuest--;
        }
    }

    // for testing purposes
    if (GetLocalInt(GetModule(), "N_TEST") == 1)
        SendMessageToPC(oPC, "[Henchman Tag : " + sTag + " should be spawning at waypoint tag : " + GetTag(oWP));

    return oWP;
}

// Fired when Henchman leaves PC's party, or dies
void HenchmanReturn(object oHench)
{
    // Destroy Henchman's Henchman if it exists
    object oHenchHench = GetHenchman(oHench);

    if (oHenchHench != OBJECT_INVALID)
        DestroyAssociate(oHenchHench, GetClassByPosition(1, oHenchHench));

    object oPC = GetMaster(oHench);
    string sTag = GetTag(oHench);
    int nModStage = GetLocalInt(GetModule(), "N_MODULE_STAGE");
    int nStageMainQuest = GetJournalQuestState("JT_ST_" + IntToString(nModStage) + "_MAIN", oPC);

    //AddJournalSingle("JT_" + GetTag(oHench), (nModStage * 10) + nStageMainQuest, oPC);

    object oWP;
    location lWP;

    RemoveHenchman(oPC, oHench);

    // Update the Master Henchman's items
    UpdateHenchItems(oHench);

    /*/ if Henchman is dead, send message to PC, destroy,
    // and recreate Henchman at designated spawn point
    if (GetIsDead(oHench))
    {
    //    SendMessageToPC(oPC, GetName(oHench) + " has been hurt badly and forced to retreat for now.]");
    }

    /*/// otherwise, Henchman has been removed.  Handle this
    // case
        // If area of return point is different from
        // Henchman's current area, make Henchman walk
        // to nearest exit
    if (GetArea(oWP) != GetArea(oHench))
        oWP = GetNearestObjectByTag("WP_EXIT");

    else
        oWP = GetHenchmanSpawnPoint(sTag);

    SetLocalInt(oHench, "N_DONT_SPEAK", 1);
    AssignCommand(oHench, ClearAllActions());
    AssignCommand(oHench, ActionMoveToObject(oWP, FALSE, 3.0));

    // under any circumstances, destroy Henchman, then
    // recreate Henchman at return point

    oWP = GetHenchmanSpawnPoint(sTag);
    lWP = GetLocation(oWP);

    DelayCommand(4.5, SetIsDestroyable(TRUE));
    DestroyObject(oHench, 5.0);
    SpawnHenchman(GetFirstPC(), GetTag(OBJECT_SELF));
}

void SpawnAllHenchmen(object oPC)
{
    string sTag;

    if (GetIsPC(oPC))
    {
        sTag = "HENCH_MARK";
        SpawnHenchman(oPC, sTag);

        sTag = "HENCH_LYEN";
        SpawnHenchman(oPC, sTag);

        sTag = "HENCH_KARA";
        SpawnHenchman(oPC, sTag);

        sTag = "HENCH_TARI";
        SpawnHenchman(oPC, sTag);

        sTag = "HENCH_BRUK";
        SpawnHenchman(oPC, sTag);
    }
}

void LevelUpSingleHenchman(object oPC, object oHench)
{
    // Now, level up the Henchman
    if (GetTag(oHench) == "HENCH_BRUK")
    {
        LevelUpHenchman(oHench, CLASS_TYPE_ROGUE);
    }
    else
    {
        LevelUpHenchman(oHench);
    }
}

void LevelUpAllHenchmen(object oPC)
{
    // First, level up all Henchman objects not currently working for PC

    object oMarkius = GetObjectByTag("HENCH_MARK");
    object oHench = GetFirstFactionMember(oMarkius, FALSE);

    while (oHench != OBJECT_INVALID)
    {
        if (GetStringLeft(GetTag(oHench), 5) == "HENCH")
        {
            LevelUpSingleHenchman(oPC, oHench);
        }

        oHench = GetNextFactionMember(oMarkius, FALSE);
    }

    // Now, check to see if Henchman currently in PC's party, if so, level up
    oHench = GetHenchman(oPC);

    if (oHench != OBJECT_INVALID)
        LevelUpSingleHenchman(oPC, oHench);
}



void DestroyAssociate(object oAssociate, int nAssociateClass)
{
    // Effect to be played for Associate
    effect e;

    switch (nAssociateClass)
    {
        case CLASS_TYPE_UNDEAD:
            e = EffectVisualEffect(VFX_FNF_SUMMON_UNDEAD);
            break;

        default:
            e = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_1);
            break;
    }

    RemoveHenchman(GetMaster(oAssociate), oAssociate);

    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, e, GetLocation(oAssociate));

    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oAssociate);
}

void MoveHenchman_Area(object oArea, string sHench, int nRun)
{
    object oAreaMarker = GetWaypointByTag("WP_" + GetTag(oArea));

    object oHench = GetNearestObjectByTag(sHench, oAreaMarker);

    int i = 1;

    object oWP = OBJECT_INVALID;

    location lWP;

    // FIND HENCHMAN IN AREA IF IT EXISTS
    while (GetArea(oArea) != GetArea(oHench) && oHench != OBJECT_INVALID)
    {
        i++;

        oHench = GetNearestObjectByTag(sHench, oAreaMarker, i);
    }

    // SO LONG AS HENCHMAN OBJECT IS IN AREA
    if (oHench != OBJECT_INVALID)
    {
        int nCurrHenchMove = GetLocalInt(oArea, "N_H_AREA_" + sHench);

        oWP = GetNearestObjectByTag("WP_H_AREA_" + sHench + "_" + IntToString(nCurrHenchMove), oHench);

        // SO LONG AS AREAS ARE THE SAME, AND oWP IS VALID OBJECT
        if (GetArea(oWP) == GetArea(oArea) && oWP != OBJECT_INVALID)
        {
            lWP = GetLocation(oWP);

            AssignCommand(oHench, ActionMoveToLocation(lWP, nRun));
        }
    }
}

void HenchmanDeath(object oHench)
{
    object oPC = GetFirstPC();

    location l = GetLocation(OBJECT_SELF);

    // Create new version of Henchman
    object oNew = CreateHenchman(oPC, GetTag(OBJECT_SELF), l);

    effect e;

    float fDeath = 60.0;

    // Make new object ethereal to avoid attacks by enemies, and dazed to avoid making attacks
    e = SupernaturalEffect(EffectEthereal());

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, e, oNew, fDeath);

    // ANIMATION TO CAUSE NEW HENCHMAN TO APPEAR "DEAD"
    AssignCommand(oNew, PlayAnimation(ANIMATION_LOOPING_DEAD_BACK, 1.0, fDeath));

    if (GetLocalString(oPC, "S_FORMER_HENCH") == GetTag(oNew))
    {
        // Add new object as Henchman of former master
        AddHenchman(oPC, oNew);

        DeleteLocalString(oPC, "S_FORMER_HENCH");
    }
}

void IncrementHenchAreaCounter(object oArea, string sHench, int i)
{
    int nValue = GetLocalInt(oArea, "N_H_AREA_" + sHench);

    nValue += i;

    SetLocalInt(oArea, "N_H_AREA_" + sHench, nValue);
}

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

    if (sQuest == "JT_GRAD_TEST")
    {
        switch (nState)
        {
            case 14:
                nXP = GetJournalQuestExperience(sQuest);
                break;

            default:
                break;
        }
    }

    else if (sQuest == "JT_GRAD_CEREMONY")
    {
        switch(nState)
        {
            // GRADUATED
            case 11:
                nXP = GetJournalQuestExperience(sQuest);
                break;

            default: break;
        }
    }

    else if (sQuest == "JT_ST_0_MAIN")
    {
        switch (nState)
        {
            // OKARIS ASSASSINATION
            case 12: nXP = GetJournalQuestExperience(sQuest);
            break;

            default: break;
        }
    }

    else if (sQuest == "xxxxxxx")
    {
        switch (nState)
        {
            default:
                break;
        }
    }

    else if (sQuest == "JT_PREL_MARK")
    {
        switch (nState)
        {
            // Solved Mikel Ravenclaw portion of Assassination Plot Quest
            case 5: nXP = GetJournalQuestExperience(sQuest);
                break;

            case 11: nXP = GetJournalQuestExperience(sQuest) * 2;
                break;

            default:
                break;
        }
    }

    else if (sQuest == "JT_PREL_KARA")
    {
        switch (nState)
        {
            // SET SPIRIT OF MALGOR TO REST
            case 12:
                nXP = GetJournalQuestExperience(sQuest);
                break;
        }
    }

    else if (sQuest == "JT_PREL_KARA_2")
    {
        switch (nState)
        {
            // KARA ESCAPED FROM DISCIPLES
            case 20:
                nXP = GetJournalQuestExperience(sQuest) * 2;
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

            case 18: nXP = GetJournalQuestExperience(sQuest) * 2;
                break;

            default:
                break;
        }
    }

    else if (sQuest == "JT_PREL_LYEN")
    {
        switch (nState)
        {
            // KILLED JHORDAK
            case 9: nXP = GetJournalQuestExperience(sQuest);
                break;

            // Quest finished
            case 20: nXP = GetJournalQuestExperience(sQuest) * 2;
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

    else if (sQuest == "JT_ST_2_MAIN")
    {
        switch (nState)
        {

            // HOLY IDOL PIECES XP
            case 5: nXP = GetJournalQuestExperience(sQuest) / 4;
                break;

            case 6: nXP = GetJournalQuestExperience(sQuest) / 4;
                break;

            case 7: nXP = GetJournalQuestExperience(sQuest) / 4;
                break;

            case 11: nXP = GetJournalQuestExperience(sQuest) / 2;
                break;

            case 20: nXP = GetJournalQuestExperience(sQuest) / 2;
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
    effect e;
    object oPC = GetFirstPC();

    if (sQuest == "JT_ST_0_MAIN")
    {
        switch (nState)
        {
            // CASE 3: FINISHED THE RITUAL OF RAKHA, ACADEMY DOORS NOW OPEN
            case 3:
                //Unlock Academy doors
                oSpecial = GetNearestObjectByTag("DOOR_011_1_0", o);
                SetLocked(oSpecial, FALSE);

                //Add Shadowguard Journal Entry
                AddJournalQuestEntry("JT_SHADOWGUARD", 10, oPC, TRUE, TRUE, TRUE);
                break;

            //CASE 5: Crimson Prophet Cutscene
            case 5:
                //Add Shadowguard Journal Entry
                AddJournalQuestEntry("JT_SHADOWGUARD", 160, oPC, TRUE, TRUE, TRUE);
                break;

            // CASE 12: OKARIS ASSASSINATION
            case 12:
                //NO SUCH JOURNAL ENTRY EXISTS
                //AddJournalSingle("JT_DEMO", 2, o);
                break;

            default:
                break;
        }
    }

    else if (sQuest == "JT_GRAD_TEST")
    {
        switch (nState)
        {

            // PLACED BOTH THE ITEMS IN STATUE OF RAKHA'S HANDS, GATES NOW OPEN
            case 6: oSpecial = GetNearestObjectByTag("DOOR_INT_1", OBJECT_SELF, 1);

                SetLocked(oSpecial, FALSE);

                AssignCommand(oSpecial, ActionOpenDoor(oSpecial));

                oSpecial = GetNearestObjectByTag("DOOR_INT_1", OBJECT_SELF, 2);

                SetLocked(oSpecial, FALSE);

                AssignCommand(oSpecial, ActionOpenDoor(oSpecial));

                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SCREEN_SHAKE), o);

                oSpecial = GetNearestObjectByTag("HENCH_MARK", o);

                AssignCommand(oSpecial, SpeakString("[" + GetName(oSpecial) + "]  The Gates of Rakha have lowered!  Come, my companions!  Let us make our way into the Sepulcher!"));

                break;

            // KILLED ALL 4 BATTLE CONSTRUCTS
            case 10:
                oSpecial = GetNearestObjectByTag("HENCH_LYEN", o);

                e = GetFirstEffect(oSpecial);

                while (GetIsEffectValid(e) == TRUE)
                {
                    RemoveEffect(oSpecial, e);

                    e = GetNextEffect(oSpecial);
                }

                oSpecial = GetNearestObjectByTag("HENCH_KARA", o);

                e = GetFirstEffect(oSpecial);

                while (GetIsEffectValid(e) == TRUE)
                {
                    RemoveEffect(oSpecial, e);

                    e = GetNextEffect(oSpecial);
                }

                break;

            // LOWERED BOTH SHIELDS ON THE HEART OF RAKHA ALTAR
            case 12:
                for (i = 1; i <= 3; i++)
                {
                    oSpecial = GetNearestObjectByTag("PLAC_MAGIC_SPARK", OBJECT_SELF, i);
                    DestroyObject(oSpecial);
                }

                break;

            // RECOVERED HEART OF RAKHA
            case 13: CreateItemOnObject("IT_PLOT_035", o);

                SetLocalInt(o, "N_RETRIEVED_HEART_OF_RAKHA", 1);

                oSpecial = GetNearestObjectByTag("PLAC_LIGHT");

                DestroyObject(oSpecial);

                oSpecial = GetFirstObjectInArea();

                while (oSpecial != OBJECT_INVALID)
                {
                    if (GetObjectType(oSpecial) == OBJECT_TYPE_CREATURE && GetIsEnemy(o, oSpecial))
                    {
                        SetPlotFlag(oSpecial, FALSE);

                        SetImmortal(oSpecial, FALSE);

                        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(TRUE), oSpecial);
                    }

                    else if (GetTag(oSpecial) == "WP_TILE_MARKER")
                    {
                        SetTileMainLightColor(GetLocation(oSpecial), TILE_MAIN_LIGHT_COLOR_WHITE, TILE_MAIN_LIGHT_COLOR_WHITE);

                        SetTileSourceLightColor(GetLocation(oSpecial), TILE_SOURCE_LIGHT_COLOR_WHITE, TILE_SOURCE_LIGHT_COLOR_WHITE);
                    }

                    oSpecial = GetNextObjectInArea();
                }

                MusicBackgroundChangeDay(GetArea(OBJECT_SELF), TRACK_RURALNIGHT);
                MusicBackgroundChangeNight(GetArea(OBJECT_SELF), TRACK_RURALNIGHT);

                break;

            // GIVE HEART OF RAKHA TO MARKIUS
            case 14:
                oSpecial = GetItemPossessedBy(o, "IT_PLOT_035");

                DestroyObject(oSpecial);

                break;

            // PC DIES IN THE SEPULCHER
            case 15:
                SetLocalInt(o, "N_DIED_IN_LABYRINTH", 1);

                oSpecial = CreateHenchman(o, "HENCH_LYEN", GetLocation(o));

                oSpecial = CreateHenchman(o, "HENCH_KARA", GetLocation(o));

                oSpecial = CreateHenchman(o, "HENCH_MARK", GetLocation(o));

                AssignCommand(oSpecial, DelayCommand(3.0, ActionStartConversation(o)));

                DestroyAllEnemyCreaturesInArea(o);

                oSpecial = GetFirstObjectInArea();

                while (oSpecial != OBJECT_INVALID)
                {
                    if (GetTag(oSpecial) == "WP_TILE_MARKER")
                    {
                        SetTileMainLightColor(GetLocation(oSpecial), TILE_MAIN_LIGHT_COLOR_WHITE, TILE_MAIN_LIGHT_COLOR_WHITE);

                        SetTileSourceLightColor(GetLocation(oSpecial), TILE_SOURCE_LIGHT_COLOR_WHITE, TILE_SOURCE_LIGHT_COLOR_WHITE);
                    }

                    oSpecial = GetNextObjectInArea();
                }

                MusicBackgroundChangeDay(GetArea(OBJECT_SELF), TRACK_RURALNIGHT);
                MusicBackgroundChangeNight(GetArea(OBJECT_SELF), TRACK_RURALNIGHT);

                break;

            // VHORKAS SUMMONED
            case 19:
                oSpecial2 = GetNearestObjectByTag("HENCH_MARK", o);

                oSpecial = CreateObject(OBJECT_TYPE_CREATURE, "CT_UNIQ_SH_VHOR", GetLocation(oSpecial2));

                DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_UNDEAD), oSpecial));

                AssignCommand(oSpecial, DelayCommand(1.5, SetFacingPoint(GetPosition(oSpecial2))));

                AssignCommand(oSpecial2, DelayCommand(1.5, SetFacingPoint(GetPosition(oSpecial))));

                ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_GHOSTLY_VISAGE), oSpecial);

                break;

            // case 20 : EVERYONE LEAVES
            case 20:
                i = VFX_FNF_MASS_HEAL;

                oSpecial = GetFirstObjectInArea();

                while (oSpecial != OBJECT_INVALID)
                {
                    if (GetStringLeft(GetTag(oSpecial), 6) == "HENCH_" || GetTag(oSpecial) == "CT_UNIQ_SH_VHOR")
                    {
                        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(i), oSpecial);

                        DestroyObject(oSpecial, 1.5);
                    }

                    oSpecial = GetNextObjectInArea();
                }

                FadeToBlack(o, FADE_SPEED_FAST);

                //Grad Ceremony cutscene
                AssignCommand(o, DelayCommand(4.0, BeginCutscene(o, "sc_st_0_memory")));

                break;

            default:
                break;
        }
    }

    else if (sQuest == "JT_GRAD_CEREMONY")
    {
        switch (nState)
        {
            //Graduate of the Academy
            case 5:

                //Give out Grad amulet
                AssignCommand(o, ActionEquipItem(oSpecial, INVENTORY_SLOT_NECK));

                //Spawn Henchmen
                SpawnHenchman(o, "HENCH_LYEN");
                SpawnHenchman(o, "HENCH_TARI");
                SpawnHenchman(o, "HENCH_BRUK");
                oSpecial = GetWaypointByTag("WP_ST_0_KARA_SPAWN");
                object oKara = CreateHenchman(o, "HENCH_KARA", GetLocation(oSpecial));

                //Set her faction to Defender so as not to interfere with other
                //goings on in the Market District (Defender's been edited so
                //it's neutral to everything). She'll be changed back to her normal
                //faction once her time in the market it done.
                ChangeToStandardFaction(oKara, STANDARD_FACTION_DEFENDER);
                SetPlotFlag(oKara, TRUE);

                break;
        }
    } // END GRAD CEREMONY QUEST

/*    else if (sQuest == "xxxxxxxx")
    {
        switch (nState)
        {
            // FLASHBACK TO PAST (Ghaarak Market District)
            case 1:
                SpawnHenchman(o, "HENCH_LYEN");

                SpawnHenchman(o, "HENCH_TARI");

                SpawnHenchman(o, "HENCH_BRUK");

                oSpecial = GetWaypointByTag("WP_ST_0_KARA_SPAWN");

                object oKara = CreateHenchman(o, "HENCH_KARA", GetLocation(oSpecial));

                //Set her faction to Defender so as not to interfere with other
                //goings on in the Market District (Defender's been edited so
                //it's neutral to everything). She'll be changed back to her normal
                //faction once her time in the market it done.
                ChangeToStandardFaction(oKara, STANDARD_FACTION_DEFENDER);

                AssignCommand(o, ActionPauseConversation());

                oSpecial = GetWaypointByTag("WP_ST_0_FORT_BEGIN");

                AssignCommand(o, JumpToLocation(GetLocation(oSpecial)));

                break;
        }
    }
*/
    else if (sQuest == "JT_ST_1_MAIN")
    {
        switch (nState)
        {
            case 6:
                oSpecial = GetNearestObjectByTag("WP_AFTER_CS_JUMP", o);
                AssignCommand(o, JumpToLocation(GetLocation(oSpecial)));
                oSpecial = GetNearestObjectByTag("CT_UNIQ_SH_HARK", o);
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

            // PC AND VHORKAS LEAVE THE SG BARRACKS
            case 1: oSpecial = GetNearestObjectByTag("DT_SG_PLAYERS_DOOR", o);
                    oSpecial2 = GetNearestObjectByTag("CT_UNIQ_SH_VHOR", o);

                    SetLocalInt(oSpecial2, "N_DONT_SPEAK", 1);

                    AssignCommand(oSpecial2, ActionMoveToObject(oSpecial));
                    DestroyObject(oSpecial2, 3.0);

                    AssignCommand(o, ActionMoveToObject(oSpecial));
                    oSpecial = GetWaypointByTag("WP_ZHAN_FORT_JUMP");
                    AssignCommand(o, DelayCommand(5.0, JumpToLocation(GetLocation(oSpecial))));
                    FadeToBlack(o, FADE_SPEED_FAST);

                    break;

            // PC TOUCHES ALTAR OF RAKHA, AND TO BE TAKEN TO CHAMBERS OF RAKHA
            case 3: oSpecial = GetWaypointByTag("WP_FINAL_INIT_ENT");
                    FadeToBlack(o, FADE_SPEED_FAST);
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_CELESTIAL), o);
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SCREEN_SHAKE), o);
                    AssignCommand(o, DelayCommand(6.0, JumpToLocation(GetLocation(oSpecial))));

                    break;

            // SPOKE TO EMPEROR RAKHA, DOORS ARE NOW OPENED TO CHALLENGES
            case 4: oSpecial = GetFirstObjectInArea();
                while (oSpecial != OBJECT_INVALID)
                {
                    if (GetTag(oSpecial) == "DOOR_RK_CHAM_001")
                        DestroyObject(oSpecial);

                    oSpecial = GetNextObjectInArea();
                }

                break;

            // RECOVERED ALL THREE PARTS OF THE HOLY IDOL
            case 7:
                AssignCommand(o, SpeakString("[" + GetName(o) + "] [As you take the last portion of the idol into your hands, you are amazed to see the broken relic slowly fuse and mend itself together again...]"));

                oSpecial = GetFirstItemInInventory(o);

                while (oSpecial != OBJECT_INVALID)
                {
                    if (GetTag(oSpecial) == "IT_PLOT_HOLY_IDOL_PIECE")
                        DestroyObject(oSpecial);

                    oSpecial = GetNextItemInInventory(o);
                }

                CreateItemOnObject("IT_PLOT_045", o);

                break;

            // DOOR TO OKARIS TRIAL IS OPENED
            case 8:
                oSpecial = GetItemPossessedBy(o, "IT_PLOT_045");
                DestroyObject(oSpecial);

                oSpecial = GetNearestObjectByTag("DT_RK_CHAM_DOOR_004", o);
                SetLocked(oSpecial, FALSE);
                AssignCommand(oSpecial, ActionOpenDoor(oSpecial));

                oSpecial = GetNearestObjectByTag("MP_EMPEROR_RAKHA", o);

                SetMapPinEnabled(oSpecial, FALSE);

                oSpecial = GetNearestObjectByTag("CT_UNIQ_NT_RAKH", o);

                SetLocalInt(oSpecial, "N_DONT_SPEAK", 1);

                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_CELESTIAL), GetLocation(oSpecial));

                DestroyObject(oSpecial, 5.0);

                break;

            // FATE DECIDED FOR OKARIS, SPIRIT DESTROYED
            case 11:
                i = GetLocalInt(o, "N_COR_MEM_OKAR_DECISION");

                if (i == 1)
                    AdjustAlignment(o, ALIGNMENT_LAWFUL, 10);

                else if (i == 2)
                    AdjustAlignment(o, ALIGNMENT_CHAOTIC, 10);

                oSpecial = GetNearestObjectByTag("CT_UNIQ_NT_OKAR", o);
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_CELESTIAL), GetLocation(oSpecial));
                SetLocalInt(oSpecial, "N_DONT_SPEAK", 1);
                DestroyObject(oSpecial, 6.0);

                break;

            // DOOR BACK TO IMPERIAL FORTRESS OPENED
            case 12: SetLocalInt(o, "N_FINAL_INIT_FIN", 1);
                oSpecial = GetNearestObjectByTag("CT_UNIQ_NT_RAKH", o);
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_CELESTIAL), GetLocation(oSpecial));
                SetLocalInt(oSpecial, "N_DONT_SPEAK", 1);
                DestroyObject(oSpecial, 6.0);

                break;

            // FINAL JOURNAL ENTRY
            case 20: oSpecial2 = GetNearestObjectByTag("WP_FINAL_INIT_MOVE_TO", o);

            oSpecial = GetFirstObjectInArea();

            while (oSpecial != OBJECT_INVALID)
            {
                if (GetObjectType(oSpecial) == OBJECT_TYPE_CREATURE)
                {
                    AssignCommand(oSpecial, ActionMoveToObject(oSpecial2));
                }

                oSpecial = GetNextObjectInArea();
            }

            FadeToBlack(o);

            oSpecial = GetWaypointByTag("WP_ETERNAL_CRYPT_JUMP");

            AssignCommand(o, DelayCommand(5.0, JumpToLocation(GetLocation(oSpecial))));

            default:
                break;
        }
    }


    // LYEN'S STAGE 0 QUEST
    else if (sQuest == "JT_PREL_LYEN")
    {
        object oChest;
        object oLyen;
        object oShrak;
        object oShrakChest;
        object oShrakItem;
        int iKara = Rob_GetJournalState(oPC, "JT_PREL_KARA");
        int iTarin = Rob_GetJournalState(oPC, "JT_PREL_TARI");
        int iJournal = 0;
        switch (nState)
        {
            // Met Lyen, refused job
            case 1:
                //Add Shadowguard Journal Entry
                AddJournalQuestEntry("JT_SHADOWGUARD", 20, oPC, TRUE, TRUE, TRUE);
                break;

            // Met Lyen, accepted job
            case 2:
                //Add Shadowguard Journal Entry
                AddJournalQuestEntry("JT_SHADOWGUARD", 20, oPC, TRUE, TRUE, TRUE);
                break;

            // BETRAYED LYEN
            case 4:
                SetLocalInt(o, "N_ST_0_BETRAYED_LYEN", 1);
                break;

            // ON BRINGING INFORMATION BACK FROM SHRAK
            case 5:
                oSpecial = GetItemPossessedBy(o, "IT_PLOT_010");
                DestroyObject(oSpecial);

                GiveGoldToCreature(o, GetLocalInt(o, GetJournalQuest(GetTag(OBJECT_SELF)) + "N_REWARD"));

                break;

            // PC AND LYEN TAKEN TO BH LAIR
            case 8:
                //Fade to black.
                FadeToBlack(oPC);

                // JUMP PC TO THE BLOODHAWK LAIR
                oSpecial = GetWaypointByTag("WP_BH_LAIR_PC_JUMP");
                oLyen = GetNearestObjectByTag("HENCH_LYEN", oPC);
                AssignCommand(oLyen, JumpToLocation(GetLocation(oSpecial)));
                AssignCommand(oPC, JumpToLocation(GetLocation(oSpecial)));

                //Force a rest.
                ForceRest(oPC);

                //Start cutscene mode
                SetCutsceneMode(oPC, TRUE);

                //Strip Weapons
                oChest = GetObjectByTag("BH_WEAPON_CHEST");
                oLyen = GetNearestObjectByTag("HENCH_LYEN", oPC);
                StripWeapons(oPC, oChest);
                StripWeapons(oLyen, oChest);

                //Have the player launch a conversation with themself.
                DelayCommand(3.0, AssignCommand(oPC, ActionStartConversation(oPC, "sc_bh_enter", FALSE, FALSE)));

                // DESTROY BOTH THE BLOODHAWKS IN TAVERN ROOM
                oSpecial = GetNearestObjectByTag("CT_COMM_BH_S0SP", oPC, 1);
                oSpecial2 = GetNearestObjectByTag("CT_COMM_BH_S0SP", oPC, 2);
                DestroyObject(oSpecial, 10.0);
                DestroyObject(oSpecial2, 10.0);

                //Destroy Shrak and his chest in the Market District
                oShrak = GetObjectByTag("CT_COMM_NT_MRBM");
                oShrakChest = GetObjectByTag("CHEST_SHRAK");
                oShrakItem = GetFirstItemInInventory(oShrakChest);

                while (oShrakItem != OBJECT_INVALID)
                {
                    DestroyObject(oShrakItem, 9.0);
                    oShrakItem = GetNextItemInInventory(oShrakChest);
                }

                AssignCommand(oShrak, SetIsDestroyable(TRUE, FALSE, FALSE));
                AssignCommand(oShrakChest, SetIsDestroyable(TRUE, FALSE, FALSE));

                DestroyObject(oShrak, 10.0);
                DestroyObject(oShrakChest, 10.0);
                DoSinglePlayerAutoSave();
                break;

            // LYEN DEPARTS AND DISAPPEARS UNTIL STAGE 1
            case 20:
                //Add Shadowguard Journal Entry
                if (iTarin >= 15 && iKara >= 6)
                    iJournal == 150;
                else if (iTarin >= 15 && iKara >= 5)
                    iJournal == 110;
                else if (iTarin >= 15 && iKara < 5)
                    iJournal == 70;
                else if (iTarin >= 10 && iKara >= 6)
                    iJournal == 140;
                else if (iTarin >= 10 && iKara >= 5)
                    iJournal == 100;
                else if (iTarin >= 10 && iKara < 5)
                    iJournal == 60;
                else if (iTarin >= 5 && iKara >= 6)
                    iJournal == 130;
                else if (iTarin >= 5 && iKara >= 5)
                    iJournal == 90;
                else if (iTarin >= 5 && iKara < 5)
                    iJournal == 50;
                else if (iTarin >= 1 && iKara >= 6)
                    iJournal == 120;
                else if (iTarin >= 1 && iKara >= 5)
                    iJournal == 80;
                else if (iTarin >= 1 && iKara < 5)
                    iJournal == 40;
                else if (iTarin == 0 && iKara >= 6)
                    iJournal == 115;
                else if (iTarin == 0 && iKara >= 5)
                    iJournal == 75;
                else if (iTarin == 0 && iKara < 5)
                    iJournal == 30;
                AddJournalQuestEntry("JT_SHADOWGUARD", iJournal, oPC, TRUE, TRUE, TRUE);

                oSpecial = GetNearestObjectByTag("HENCH_LYEN", o);
                AssignCommand(oSpecial, ActionMoveAwayFromObject(o));
                SetLocalInt(oSpecial, "N_DONT_SPEAK", 1);
                DestroyObject(oSpecial, 3.0);
                break;

            default:
                break;
        }
    }


    // TARIN'S STAGE 0 QUEST
    else if (sQuest == "JT_PREL_TARI")
    {
        //Determine corresponding journal states
        int iKara = Rob_GetJournalState(oPC, "JT_PREL_KARA");
        int iProphet = Rob_GetJournalState(oPC, "JT_ST_0_MAIN");
        int iLyen = Rob_GetJournalState(oPC, "JT_PREL_LYEN");
        int iJournal = 0;

        switch (nState)
        {
            //Met Tarin but haven't completed the Ghan Plot
            case 1:
                //Only deal with cases prior to the Crimson Prophet's appearance
                //and following completion of Lyen's slaver plot.
                if (iProphet < 5 &&
                    iLyen == 20)
                {
                    //Kara has entered her trance.
                    if (iKara >= 6)
                    {
                        iJournal = 120;
                    }
                    //Player has met Kara but she hasn't entered her trance.
                    else if (iKara >= 5)
                    {
                        iJournal = 80;
                    }
                    //Player has not been introduced to Kara.
                    else if (iKara < 5)
                    {
                        iJournal = 40;
                    }

                    //Add the Shadowguard journal entry
                    if (iJournal != 0)
                    {
                        AddJournalQuestEntry("JT_SHADOWGUARD", iJournal, oPC, TRUE, TRUE, TRUE);
                    }
                }
                break;

            //Sold Ghan's brooch
            case 5:
                AdjustAlignment(o, ALIGNMENT_EVIL, 5);

                SetLocalInt(oPC, "JT_PREL_TARI_SOLDBROOCH", TRUE);
                oSpecial = GetItemPossessedBy(oPC, "IT_PLOT_003");
                SetPlotFlag(oSpecial, FALSE);

                //Only deal with cases prior to the Crimson Prophet's appearance
                //and following completion of Lyen's slaver plot.
                if (iProphet < 5 &&
                    iLyen == 20)
                {
                    //Kara has entered her trance.
                    if (iKara >= 6)
                    {
                        iJournal = 130;
                    }
                    //Player has met Kara but she hasn't entered her trance.
                    else if (iKara >= 5)
                    {
                        iJournal = 90;
                    }
                    //Player has not been introduced to Kara.
                    else if (iKara < 5)
                    {
                        iJournal = 50;
                    }

                    //Add the Shadowguard journal entry
                    if (iJournal != 0)
                    {
                        AddJournalQuestEntry("JT_SHADOWGUARD", iJournal, oPC, TRUE, TRUE, TRUE);
                    }
                }
                break;

            //Told Ghan about the brooch in such a way that he loses honor and
            //refuses it.
            case 6:
                SetLocalInt(oPC, "JT_PREL_TARI_KEPTBROOCH", TRUE);
                oSpecial = GetItemPossessedBy(oPC, "IT_PLOT_003");
                SetPlotFlag(oSpecial, FALSE);

                //Only deal with cases prior to the Crimson Prophet's appearance
                //and following completion of Lyen's slaver plot.

                if (iProphet < 5 &&
                    iLyen == 20)
                {
                    //Kara has entered her trance.
                    if (iKara >= 6)
                    {
                        iJournal = 130;
                    }
                    //Player has met Kara but she hasn't entered her trance.
                    else if (iKara >= 5)
                    {
                        iJournal = 90;
                    }
                    //Player has not been introduced to Kara.
                    else if (iKara < 5)
                    {
                        iJournal = 50;
                    }

                    //Add the Shadowguard journal entry
                    if (iJournal != 0)
                    {
                        AddJournalQuestEntry("JT_SHADOWGUARD", iJournal, oPC, TRUE, TRUE, TRUE);
                    }
                }
                break;

            //Helped Tarin return Ghan's brooch.
            case 7:
                AdjustAlignment(o, ALIGNMENT_GOOD, 5);
                DestroyObject(GetItemPossessedBy(o, "IT_PLOT_003"));

                SetLocalInt(oPC, "JT_PREL_TARI_RETURNEDBROOCH", TRUE);

                //Only deal with cases prior to the Crimson Prophet's appearance
                //and following completion of Lyen's slaver plot.
                if (iProphet < 5 &&
                    iLyen == 20)
                {
                    //Kara has entered her trance.
                    if (iKara >= 6)
                    {
                        iJournal = 130;
                    }
                    //Player has met Kara but she hasn't entered her trance.
                    else if (iKara >= 5)
                    {
                        iJournal = 90;
                    }
                    //Player has not been introduced to Kara.
                    else if (iKara < 5)
                    {
                        iJournal = 50;
                    }

                    //Add the Shadowguard journal entry
                    if (iJournal != 0)
                    {
                        AddJournalQuestEntry("JT_SHADOWGUARD", iJournal, oPC, TRUE, TRUE, TRUE);
                    }
                }
                break;

            case 8:
                oSpecial = GetNearestObjectByTag("WP_CT_UNIQ_PH_MALT", o);
                oSpecial = CreateObject(OBJECT_TYPE_CREATURE, "CT_UNIQ_PH_MALT", GetLocation(oSpecial));
                oSpecial2 = OBJECT_SELF;
                AssignCommand(oSpecial, ClearAllActions());
                AssignCommand(oSpecial, ActionMoveToObject(oSpecial2));
                break;

            case 9:
                oSpecial = GetNearestObjectByTag("HENCH_BRUK", o);
                if (GetArea(oSpecial) == GetArea(o))
                    AssignCommand(oSpecial, ActionSit(GetNearestObjectByTag("PT_" + GetTag(oSpecial), oSpecial)));

                oSpecial = GetNearestObjectByTag("HENCH_TARI", o);
                if (GetArea(oSpecial) == GetArea(o))
                    AssignCommand(oSpecial, ActionSit(GetNearestObjectByTag("PT_" + GetTag(oSpecial), oSpecial)));

                oSpecial = GetNearestObjectByTag("CT_UNIQ_PH_MALT", o);
                if (GetArea(oSpecial) == GetArea(o))
                    AssignCommand(oSpecial, ActionSit(GetNearestObjectByTag("PT_" + GetTag(oSpecial), oSpecial)));

                break;

            //Tarin is kidnapped.
            case 10:
                SetLocalInt(GetModule(), "N_ABDUCTED_HENCH_TARI", 1);

                oSpecial = GetNearestObjectByTag("HENCH_TARI", o);
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectSleep(), oSpecial, 15.0);
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_IMP_SLEEP), oSpecial, 15.0f);
                DestroyObject(oSpecial, 2.0f);

                oSpecial = GetNearestObjectByTag("HENCH_BRUK", o);
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectSleep(), oSpecial, 6.0);
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_IMP_SLEEP), oSpecial, 6.0f);
                DelayCommand(6.0f, AssignCommand(oSpecial, ClearAllActions()));

                oSpecial = GetNearestObjectByTag("CT_UNIQ_PH_MALT", o);

                AssignCommand(oSpecial, ClearAllActions());
                AssignCommand(GetModule(), AssignCommand(oSpecial, SetIsDestroyable(TRUE, FALSE, FALSE)));
                AssignCommand(GetModule(), DestroyObject(oSpecial, 6.0f));

                if (GetLocalInt(o, "N_DRANK_PH_ALE") == 1)
                {
                    AssignCommand(o, ClearAllActions(TRUE));
                    DelayCommand(0.5, AssignCommand(o, PlayAnimation(ANIMATION_LOOPING_DEAD_FRONT, 1.0, 6.0)));
                    DelayCommand(0.7, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectDarkness(), o, 6.0));
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

                AssignCommand(oSpecial, ActionMoveToObject(GetNearestObjectByTag("WP_EXIT", oSpecial), TRUE));
                SetLocalInt(oSpecial, "N_DONT_SPEAK", 1);

                oSpecial = GetNearestObjectByTag("CT_UNIQ_NT_GHAN", o);
                AssignCommand(oSpecial, ActionMoveToObject(o, TRUE));
                DelayCommand(5.0, AssignCommand(oSpecial, SpeakString("[" + GetName(oSpecial) + "]  " + GetName(o) + ", what has happened?  Where have they taken little Tarin?")));

                //Only deal with cases prior to the Crimson Prophet's appearance
                //and following completion of Lyen's slaver plot.
                if (iProphet < 5 &&
                    iLyen == 20)
                {
                    //Kara has entered her trance.
                    if (iKara >= 6)
                    {
                        iJournal = 140;
                    }
                    //Player has met Kara but she hasn't entered her trance.
                    else if (iKara >= 5)
                    {
                        iJournal = 100;
                    }
                    //Player has not been introduced to Kara.
                    else if (iKara < 5)
                    {
                        iJournal = 60;
                    }

                    //Add the Shadowguard journal entry
                    if (iJournal != 0)
                    {
                        AddJournalQuestEntry("JT_SHADOWGUARD", iJournal, oPC, TRUE, TRUE, TRUE);
                    }
                }
                break;

            // ENDINGS OF PRELUDE TARIN QUEST

            // 15 - Allowed Malthar to take Tarin away
            case 15:
                AdjustAlignment(o, ALIGNMENT_EVIL, 10);

                //Only deal with cases prior to the Crimson Prophet's appearance
                //and following completion of Lyen's slaver plot.
                if (iProphet < 5 &&
                    iLyen == 20)
                {
                    //Kara has entered her trance.
                    if (iKara >= 6)
                    {
                        iJournal = 150;
                    }
                    //Player has met Kara but she hasn't entered her trance.
                    else if (iKara >= 5)
                    {
                        iJournal = 110;
                    }
                    //Player has not been introduced to Kara.
                    else if (iKara < 5)
                    {
                        iJournal = 70;
                    }

                    //Add the Shadowguard journal entry
                    if (iJournal != 0)
                    {
                        AddJournalQuestEntry("JT_SHADOWGUARD", iJournal, oPC, TRUE, TRUE, TRUE);
                    }
                }
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
                        //AssignCommand(oSpecial2, ActionMoveToObject(GetNearestObjectByTag("WP_EXIT", oSpecial2)));
                        ChangeToStandardFaction(oSpecial2, STANDARD_FACTION_HOSTILE);

                        //AssignCommand(oSpecial2, SetIsDestroyable(TRUE, FALSE, FALSE));
                        //DestroyObject(oSpecial2, 5.0);
                    }

                    oSpecial2 = GetNextFactionMember(oSpecial, FALSE);
                }

                AssignCommand(oSpecial, ActionMoveToObject(GetNearestObjectByTag("WP_EXIT", oSpecial)));
                ChangeToStandardFaction(oSpecial, STANDARD_FACTION_HOSTILE);
                //DestroyObject(oSpecial, 12.0);

                AdjustAlignment(o, ALIGNMENT_GOOD, 10);

                //Only deal with cases prior to the Crimson Prophet's appearance
                //and following completion of Lyen's slaver plot.
                if (iProphet < 5 &&
                    iLyen == 20)
                {
                    //Kara has entered her trance.
                    if (iKara >= 6)
                    {
                        iJournal = 150;
                    }
                    //Player has met Kara but she hasn't entered her trance.
                    else if (iKara >= 5)
                    {
                        iJournal = 110;
                    }
                    //Player has not been introduced to Kara.
                    else if (iKara < 5)
                    {
                        iJournal = 70;
                    }

                    //Add the Shadowguard journal entry
                    if (iJournal != 0)
                    {
                        AddJournalQuestEntry("JT_SHADOWGUARD", iJournal, oPC, TRUE, TRUE, TRUE);
                    }
                }
                break;

            default:
                break;
        }
    }

    // ELSE IF KARA'S PRELUDE QUEST
    else if (sQuest == "JT_PREL_KARA")
    {
        //Determine corresponding journal states
        object oTemp;
        int iTarin = Rob_GetJournalState(oPC, "JT_PREL_TARI");
        int iProphet = Rob_GetJournalState(oPC, "JT_ST_0_MAIN");
        int iLyen = Rob_GetJournalState(oPC, "JT_PREL_LYEN");
        int iJournal = 0;

        switch (nState)
        {
            // CASE 1: SPIRIT OF MALGOR SUMMONED
            case 1:
                oSpecial = GetNearestObjectByTag("WP_CT_UNIQ_UN_MALG", o);
                oSpecial2 = GetNearestObjectByTag("CT_UNIQ_UN_MALG", o);

                if (GetArea(oSpecial2) != GetArea(o))
                {
                    DelayCommand(2.0, Rob_CreateMalgor(o));
                    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_GATE), GetLocation(oSpecial));
                }

                break;

            // CASE 2: KARA RUNS OFF FROM NELGIR'S STAND
            case 2:
                oSpecial = GetNearestObjectByTag("HENCH_KARA", o);
                oSpecial2 = GetNearestObjectByTag("WP_ST_0_KARA_RUN_TO", oSpecial);

                AssignCommand(oSpecial, ActionMoveToObject(oSpecial2, TRUE));

                DestroyObject(oSpecial, 3.0);

                break;

            // CASE 3: ASKED BY NELGIR FOR AID
            case 3:
                oTemp = SpawnHenchman(o, "HENCH_KARA");
                ChangeToStandardFaction(oTemp, STANDARD_FACTION_MERCHANT);
                SetPlotFlag(oTemp, FALSE);

                break;

            // CASE 4: GOT KEY FROM RUKNAR
            case 4:
                CreateItemOnObject("IT_PLOT_039", o);

                break;

            // CASE 5: KARA INTRODUCES HERSELF
            case 5:
                //Only deal with cases prior to the Crimson Prophet's appearance
                //and following completion of Lyen's slaver plot.
                if (iProphet < 5 &&
                    iLyen == 20)
                {
                    //Tarin has been rescued
                    if (iTarin >= 15)
                    {
                        iJournal = 110;
                    }
                    //Tarin has been kidnapped
                    else if (iTarin >= 10)
                    {
                        iJournal = 100;
                    }
                    //Ghan plot complete
                    else if (iTarin >= 5)
                    {
                        iJournal = 90;
                    }
                    //Met Tarin but Ghan plot incomplete
                    else if (iTarin >= 1)
                    {
                        iJournal = 80;
                    }
                    //Have not met Tarin
                    else if (iTarin == 0)
                    {
                        iJournal = 75;
                    }

                    //Add the Shadowguard journal entry
                    if (iJournal != 0)
                    {
                        AddJournalQuestEntry("JT_SHADOWGUARD", iJournal, oPC, TRUE, TRUE, TRUE);
                    }
                }
                break;

            // CASE 6: KARA ENTERS TRANCE
            case 6:
                //Only deal with cases prior to the Crimson Prophet's appearance
                //and following completion of Lyen's slaver plot.
                if (iProphet < 5 &&
                    iLyen == 20)
                {
                    //Tarin has been rescued
                    if (iTarin >= 15)
                    {
                        iJournal = 150;
                    }
                    //Tarin has been kidnapped
                    else if (iTarin >= 10)
                    {
                        iJournal = 140;
                    }
                    //Ghan plot complete
                    else if (iTarin >= 5)
                    {
                        iJournal = 130;
                    }
                    //Met Tarin but Ghan plot incomplete
                    else if (iTarin >= 1)
                    {
                        iJournal = 120;
                    }
                    //Have not met Tarin
                    else if (iTarin == 0)
                    {
                        iJournal = 115;
                    }

                    //Add the Shadowguard journal entry
                    if (iJournal != 0)
                    {
                        AddJournalQuestEntry("JT_SHADOWGUARD", iJournal, oPC, TRUE, TRUE, TRUE);
                    }
                }
                break;

            // CASE 9: GIVE BODY OF MALGOR TO NELGIR
            case 9:
                //Spawn in the Disciples.
                SignalEvent(GetModule(), EventUserDefined(1001));

                oSpecial = GetItemPossessedBy(o, "IT_PLOT_038");
                DestroyObject(oSpecial);

                AdjustAlignment(o, ALIGNMENT_EVIL, 5);
                GiveGoldToCreature(o, 300);

                break;

            // CASE 10: GIVE BODY OF MALGOR TO GANOLIN
            case 10:
                oSpecial = GetItemPossessedBy(o, "IT_PLOT_038");

                DestroyObject(oSpecial);

                GiveGoldToCreature(o, 200);

                oSpecial = GetNearestObjectByTag("WP_CT_COMM_IM_PRKA", o, 1);

                CreateObject(OBJECT_TYPE_CREATURE, "CT_COMM_IM_PRKA", GetLocation(oSpecial));

                oSpecial = GetNearestObjectByTag("WP_CT_COMM_IM_PRKA", o, 2);

                CreateObject(OBJECT_TYPE_CREATURE, "CT_COMM_IM_PRKA", GetLocation(oSpecial));

                SetLocalInt(o, "N_NELGIR_ARRESTED", 1);

                break;

            // CASE 11: GIVE BLOODSTONE BACK TO SPIRIT OF MALGOR
            case 11:
                oSpecial = GetItemPossessedBy(o, "IT_PLOT_037");

                DestroyObject(oSpecial);

                AdjustAlignment(o, ALIGNMENT_EVIL, 3);

                break;

            // CASE 12: SPIRIT OF MALGOR DISPERSES
            case 12:
                //Spawn in Disciples
                SignalEvent(GetModule(), EventUserDefined(1001));

                // IF NELGIR ARRESTED
                if (GetLocalInt(o, "N_NELGIR_ARRESTED") == 1)
                {
                    oSpecial2 = GetNearestObjectByTag("WP_PREL_KARA_MOVE_TO", o);

                    oSpecial = GetNearestObjectByTag("CT_COMM_IM_PRKA", o, 1);

                    SetLocalInt(oSpecial, "N_DONT_SPEAK", 1);

                    AssignCommand(oSpecial, ActionMoveToObject(oSpecial2));

                    DestroyObject(oSpecial, 1.5);

                    oSpecial = GetNearestObjectByTag("CT_COMM_IM_PRKA", o, 2);

                    SetLocalInt(oSpecial, "N_DONT_SPEAK", 1);

                    AssignCommand(oSpecial, ActionMoveToObject(oSpecial2));

                    DestroyObject(oSpecial, 1.5);

                    oSpecial = GetNearestObjectByTag("CT_COMM_NT_MRGM", o, 1);

                    SetLocalInt(oSpecial, "N_DONT_SPEAK", 1);

                    AssignCommand(oSpecial, ActionMoveToObject(oSpecial2));

                    DestroyObject(oSpecial, 1.5);

                }

                oSpecial = GetNearestObjectByTag("CT_UNIQ_UN_MALG", o);

                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_GATE), GetLocation(oSpecial));

                DestroyObject(oSpecial, 3.0);

                break;

            default:
                break;
        }
    }

    // ELSE IF DISCIPLES OF AKHANA QUEST
    else if (sQuest == "JT_PREL_KARA_2")
    {

        switch (nState)
        {
            // CASE 14: LIED ABOUT KARA'S WHEREABOUTS
            case 14:
                GiveGoldToCreature(o, 250);

                oSpecial2 = GetNearestObjectByTag("WP_S0_AK_MOVE_TO", o);

                oSpecial = GetNearestObjectByTag("CT_UNIQ_AK_GHAS", o);
                SetLocalInt(oSpecial, "N_DONT_SPEAK", 1);
                AssignCommand(oSpecial, ActionMoveToObject(oSpecial2));
                AssignCommand(GetModule(), AssignCommand(oSpecial, SetIsDestroyable(TRUE, FALSE)));
                AssignCommand(GetModule(), DestroyObject(oSpecial, 3.0));

                oSpecial = GetNearestObjectByTag("CT_COMM_AK_DISC", o, 1);
                SetLocalInt(oSpecial, "N_DONT_SPEAK", 1);
                AssignCommand(oSpecial, ActionMoveToObject(oSpecial2));
                AssignCommand(GetModule(), AssignCommand(oSpecial, SetIsDestroyable(TRUE, FALSE)));
                AssignCommand(GetModule(), DestroyObject(oSpecial, 2.0));

                oSpecial = GetNearestObjectByTag("CT_COMM_AK_DISC", o, 2);
                SetLocalInt(oSpecial, "N_DONT_SPEAK", 1);
                AssignCommand(oSpecial, ActionMoveToObject(oSpecial2));
                AssignCommand(GetModule(), AssignCommand(oSpecial, SetIsDestroyable(TRUE, FALSE)));
                AssignCommand(GetModule(), DestroyObject(oSpecial, 2.0));

                break;

            // CASE 15: REFUSED TO TELL KARA'S WHEREABOUTS
            case 15:

                oSpecial2 = GetNearestObjectByTag("WP_S0_AK_MOVE_TO", o);

                oSpecial = GetNearestObjectByTag("CT_UNIQ_AK_GHAS", o);
                SetLocalInt(oSpecial, "N_DONT_SPEAK", 1);
                AssignCommand(oSpecial, ActionMoveToObject(oSpecial2));
                AssignCommand(GetModule(), AssignCommand(oSpecial, SetIsDestroyable(TRUE, FALSE)));
                AssignCommand(GetModule(), DestroyObject(oSpecial, 3.0));

                oSpecial = GetNearestObjectByTag("CT_COMM_AK_DISC", o, 1);
                SetLocalInt(oSpecial, "N_DONT_SPEAK", 1);
                AssignCommand(oSpecial, ActionMoveToObject(oSpecial2));
                AssignCommand(GetModule(), AssignCommand(oSpecial, SetIsDestroyable(TRUE, FALSE)));
                AssignCommand(GetModule(), DestroyObject(oSpecial, 2.0));

                oSpecial = GetNearestObjectByTag("CT_COMM_AK_DISC", o, 2);
                SetLocalInt(oSpecial, "N_DONT_SPEAK", 1);
                AssignCommand(oSpecial, ActionMoveToObject(oSpecial2));
                AssignCommand(GetModule(), AssignCommand(oSpecial, SetIsDestroyable(TRUE, FALSE)));
                AssignCommand(GetModule(), DestroyObject(oSpecial, 2.0));

                break;

            // CASE 16: RATTED OUT KARA'S WHEREABOUTS
            case 16:
                GiveGoldToCreature(o, 250);

                oSpecial2 = GetNearestObjectByTag("WP_S0_AK_MOVE_TO", o);

                oSpecial = GetNearestObjectByTag("CT_UNIQ_AK_GHAS", o);
                SetLocalInt(oSpecial, "N_DONT_SPEAK", 1);
                AssignCommand(oSpecial, ActionMoveToObject(oSpecial2));
                AssignCommand(GetModule(), AssignCommand(oSpecial, SetIsDestroyable(TRUE, FALSE)));
                AssignCommand(GetModule(), DestroyObject(oSpecial, 3.0));

                oSpecial = GetNearestObjectByTag("CT_COMM_AK_DISC", o, 1);
                SetLocalInt(oSpecial, "N_DONT_SPEAK", 1);
                AssignCommand(oSpecial, ActionMoveToObject(oSpecial2));
                AssignCommand(GetModule(), AssignCommand(oSpecial, SetIsDestroyable(TRUE, FALSE)));
                AssignCommand(GetModule(), DestroyObject(oSpecial, 2.0));

                oSpecial = GetNearestObjectByTag("CT_COMM_AK_DISC", o, 2);
                SetLocalInt(oSpecial, "N_DONT_SPEAK", 1);
                AssignCommand(oSpecial, ActionMoveToObject(oSpecial2));
                AssignCommand(GetModule(), AssignCommand(oSpecial, SetIsDestroyable(TRUE, FALSE)));
                AssignCommand(GetModule(), DestroyObject(oSpecial, 2.0));

                break;

            // CASE 17: CREATE DISCIPLES IF NEEDED
            case 17:
                oSpecial = GetNearestObjectByTag("PLAC_S0_KARAS_DOOR", o);
                SetLocked(oSpecial, TRUE);
                AssignCommand(oSpecial, ActionCloseDoor(oSpecial));

                oSpecial = GetWaypointByTag("WP_PC_SPECIALCMBT");
                AssignCommand(o, JumpToLocation(GetLocation(oSpecial)));

                SignalEvent(GetModule(), EventUserDefined(1001));
                break;

            // CASE 18: DISCIPLES ATTACK
            case 18:
                SignalEvent(GetModule(), EventUserDefined(1002));
                break;

            case 19:
                SetLocked(GetObjectByTag("PLAC_S0_KARAS_DOOR"), FALSE);
                break;

            // CASE 20: KARA DEPARTS
            case 20:
                oSpecial = GetNearestObjectByTag("HENCH_KARA", o);
                AssignCommand(oSpecial, ActionMoveToObject(GetNearestObjectByTag("WP_EXIT", oSpecial)));
                SetLocalInt(oSpecial, "N_DONT_SPEAK", 1);
                DestroyObject(oSpecial, 4.0);
                break;

            default:
                break;
        }
    }
}

// ---------------------------------------------- //
// ----- CUTSCENE FUNCTION IMPLEMENTATIONS ------ //
// ---------------------------------------------- //

void BeginCutscene(object oPC, string sConv, int nFadeToBlack, float fTransitionSpeed)
{
    if (GetLocalInt(oPC, "CUTSCENE_" + sConv) == 0)
    {
        if (GetLocalInt(GetModule(), "N_TEST") == 1)
            SendMessageToPC(oPC, "[Cutscene started : " + sConv + "]");

        SetLocalString(oPC, "S_CURR_CUTSCENE", sConv);

        SetCutsceneMode(oPC, TRUE);

        object oWP = GetNearestObjectByTag("WP_CUTSCENE", oPC);
        float fWP = GetFacing(oWP);

        //Make double sure to stop the PC in his tracks.
        AssignCommand(oPC, ClearAllActions(TRUE));
//        AssignCommand(oPC, JumpToObject(oPC));

        if (nFadeToBlack)
            FadeToBlack(oPC, fTransitionSpeed);

        AssignCommand(oPC, JumpToObject(oWP, FALSE));

        StoreCameraFacing();

        DelayCommand(0.4, AssignCommand(oPC, ActionStartConversation(oPC, sConv, TRUE, FALSE)));
        DelayCommand(0.6, AssignCommand(oPC, SetFacing(fWP)));
        DelayCommand(0.8, AssignCommand(oPC, SetCameraFacing(fWP, 10.0, 60.0f)));
    }
}

void InitializeCutscene(object oPC, int nDominated, int nParalyzed, int nInvisible, float fDirection, float fDistance, float fPitch, int nTransitionType)
{
    float fSetDirection;

    if (fDirection == -1.0)
        fSetDirection = GetFacing(oPC);

    SetCameraMode(oPC, CAMERA_MODE_TOP_DOWN);

    SetCameraFacing(fSetDirection, fDistance, fPitch, nTransitionType);

    if (nDominated)
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectCutsceneDominated(), oPC);

    if (nParalyzed)
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectCutsceneParalyze(), oPC);

    if (nInvisible)
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY), oPC);

    StoreCameraFacing();
}

void EndCutscene(object oPC)
{
    effect e = GetFirstEffect(oPC);

    while (GetIsEffectValid(e) == TRUE)
    {
        if ((GetEffectType(e) != EFFECT_TYPE_ABILITY_INCREASE)
        && (GetEffectType(e) != EFFECT_TYPE_AC_INCREASE))
        {
            RemoveEffect(oPC, e);
        }

        e = GetNextEffect(oPC);
    }

    string sConv = GetLocalString(oPC, "S_CURR_CUTSCENE");

    SetLocalInt(oPC, "CUTSCENE_" + sConv, 1);

    SetCutsceneMode(oPC, FALSE);

    // NOW, FIGURE OUT WHAT TO DO DEPENDING ON WHAT THE CURRENT CUTSCENE IS

    // IF OPENING CUTSCENE 1
    if (sConv == "sc_st_0_open_1")
    {
/***********This cutscene end is handled in the conversation file.
        //Set the stage variable
        SetLocalInt(oPC, "N_" + GetLocalString(oPC, "S_CURR_CUTSCENE"), 7);

        // JUMP TO THE SHADOWGUARD TRAINING SEPULCHER
        object oWP = GetWaypointByTag("WP_ST_0_LAB_JUMP");
        location lWP = GetLocation(oWP);
        float fWP = GetFacingFromLocation(lWP);

        AssignCommand(oPC, JumpToLocation(lWP));
        AssignCommand(oPC, SetFacing(fWP));
        AssignCommand(oPC, SetCameraFacing(fWP, 10.0));
*/
}

    // ELSE IF SG TRAINING AREA AT BEGINNING
    else if (sConv == "sc_st_0_sg_train")
    {
/***********This cutscene end is handled in the conversation file.
        AddJournalSingle("JT_GRAD_TEST", 1, oPC);

        // CAUSE THE SG'S TO MOVE TO APPROPRIATE SPOTS
        string s;
        object oHench;
        object oWP;

        s = "HENCH_MARK";
        oHench = GetNearestObjectByTag(s);
        AssignCommand(oHench, SetFacing(90.0));

        s = "HENCH_KARA";
        oHench = GetNearestObjectByTag(s);
        oWP = GetNearestObjectByTag("WP_SG_TR_" + s);
        AssignCommand(oHench, ActionForceMoveToObject(oWP, TRUE, 1.0, 3.0));

        s = "HENCH_LYEN";
        oHench = GetNearestObjectByTag(s);
        oWP = GetNearestObjectByTag("WP_SG_TR_" + s);
        AssignCommand(oHench, ActionForceMoveToObject(oWP, TRUE, 1.0, 3.0));
*/
    }

    // ELSE IF MEMORY CUTSCENE AT END OF SEPULCHER
    else if (sConv == "sc_st_0_memory")
    {
        //AddJournalSingle("xxxxxx", 1, oPC);

        object oWP = GetWaypointByTag("WP_ST_0_TRUE_BEGIN");
        location lWP = GetLocation(oWP);
        float fWP = GetFacingFromLocation(lWP);

        AssignCommand(oPC, JumpToLocation(lWP));
        AssignCommand(oPC, SetFacing(fWP));
        AssignCommand(oPC, SetCameraFacing(fWP, 10.0));
    }

    // ELSE IF MEMORY CUTSCENE AT BEGINNING OF STAGE 0 IMPERIAL ACADEMY
    else if (sConv == "sc_st_0_academy")
    {
        AddJournalSingle("JT_ST_0_MAIN", 1, oPC);
        //Added this one to accomodate the Labyrinth / Sepulcher cut.
        //AddJournalSingle("xxxxxx", 1, oPC);

//        FloatingTextStringOnCreature("Six months earlier...", oPC, FALSE);

        //Ensure that the Fade is removed.
        StopFade(oPC);

        object o;

        object oWP = GetNearestObjectByTag("WP_EXIT", oPC);

        o = GetNearestObjectByTag("CT_UNIQ_NT_MESS", oPC);

        DelayCommand(1.0, AssignCommand(o, ActionStartConversation(oPC)));
    }

    // ELSE IF BLOODHAWK ENCOUNTER DURING LYEN STAGE 0 QUEST
    else if (sConv == "sc_bh_lair")
    {
//Moved to an actual script on the conversation.
/*
        // MAKE JHORDAK AND BLOODHAWKS ATTACK
        object oPC = GetPCSpeaker();

        object oJhordak = GetNearestObjectByTag("CT_UNIQ_BH_JHOR", oPC);

        AdjustReputation(oPC, oJhordak, -100);

        int i = 1;

        // GET ALL BLOODHAWKS, MAKE HOSTILE, AND MAKE ATTACK
        object o = GetNearestObject(OBJECT_TYPE_CREATURE, oPC);

        while (o != OBJECT_INVALID)
        {
            if (GetFactionEqual(o, oJhordak))
            {
                if (GetArea(o) == GetArea(oJhordak))
                {
                    if (GetDistanceBetween(o, oJhordak) < 10.0)
                    {
                        if (GetPlotFlag(o) == FALSE)
                        {
                            AssignCommand(o, DetermineCombatRound());
                        }
                    }
                }
            }

            i++;

            o = GetNearestObject(OBJECT_TYPE_CREATURE, oPC, i);
        }

        // MAKE JHORDAK ATTACK
        DelayCommand(1.0, SetPlotFlag(oJhordak, FALSE));

        AssignCommand(oJhordak, DetermineCombatRound());
*/
    }

    // ELSE IF OKARIS ASSASSINATION CUTSCENE
    else if (sConv == "sc_st_0_okar_ass")
    {

        object oWP = GetWaypointByTag("WP_STAGE_1_JUMP");
        location lWP = GetLocation(oWP);

        AddJournalSingle("JT_ST_0_MAIN", 12, oPC);

        //Update the Module Stage
        SetLocalInt(GetModule(), "N_MODULE_STAGE", 1);
        AssignCommand(oPC, BlackScreen(oPC));

        DelayCommand(0.7f, SetCommandable(TRUE, oPC));
        DelayCommand(1.1f, AssignCommand(oPC, JumpToLocation(lWP)));
    }

    // ELSE IF STAGE 0 GRAND HALL MEETING
    else if (sConv == "sc_st_0_grn_hall")
    {
        AddJournalSingle("JT_ST_0_MAIN", 10, oPC);

        object oVhorkas = GetNearestObjectByTag("CT_UNIQ_SH_VHOR", oPC);

        object oWP = GetNearestObjectByTag("WP_EXIT", oVhorkas);

        SetLocalInt(oVhorkas, "N_DONT_SPEAK", 1);

        AssignCommand(oVhorkas, ActionMoveToObject(oWP));

        DestroyObject(oVhorkas, 4.0);

        object oOkaris = GetNearestObjectByTag("CT_UNIQ_NT_OKAR", oPC);

        string sGender;

        if (GetGender(oPC) == GENDER_MALE)
            sGender = "son";

        else
            sGender = "daughter";

        AssignCommand(oOkaris, SpeakString("[" + GetName(oOkaris) + "] My " + sGender + "! I have been so worried about you! Come here and let your old father have a good look at you!"));
    }

    // END OF INTERLUDE CONVERSATION WITH VHORKAS
    else if (sConv == "sc_interlude")
    {
        //AddJournalSingle("xxxxxxxx", 2, oPC);

        object oOverlord = GetNearestObjectByTag("CT_UNIQ_SH_VHOR", oPC);

        object oWP = GetNearestObjectByTag("WP_EXIT", oOverlord);

        AssignCommand(oOverlord, ActionMoveToObject(oWP));

        SetLocalInt(oOverlord, "N_DONT_SPEAK", 1);

        DestroyObject(oOverlord, 5.0);
    }

    // ELSE IF STAGE 1 OPENING CUTSCENE
    else if (sConv == "sc_st_1_open")
    {
        object oMarkius = GetNearestObjectByTag("HENCH_MARK", oPC);
        object oBruk = GetObjectByTag("HENCH_BRUK");
        object o = GetFirstObjectInArea();

        while (o != OBJECT_INVALID)
        {
            if (GetTag(o) == "CT_COMM_CF_FOLL")
            {
                ChangeToStandardFaction(o, STANDARD_FACTION_HOSTILE);
                AssignCommand(o, DelayCommand(1.0, ActionAttack(oMarkius)));
            }

            o = GetNextObjectInArea();
        }

        AssignCommand(oPC, ClearAllActions(TRUE));
        //AssignCommand(oBruk, ActionEquipMostDamagingMelee());
    }

    // ELSE IF STAGE 1 DOCKS PROPHET CONFRONTATION
    else if (sConv == "sc_st_1_cp_confr")
    {
        AddJournalSingle("JT_ST_1_MAIN", 15, oPC);
    }

    // ELSE IF STAGE 2 COR MEMORY CUTSCENE
    else if (sConv == "sc_cor_memory")
    {
        object oWP = GetWaypointByTag("WP_COR_MEM_RETURN");

        location lWP = GetLocation(oWP);

        AssignCommand(oPC, JumpToLocation(lWP));

        AddJournalSingle("JT_ST_2_MAIN", 9, oPC);
    }

    DeleteLocalString(oPC, "S_CURR_CUTSCENE");

    if (sConv != "sc_st_0_okar_ass")
        StopFade(oPC);
}

void ChangeCameraFacing(object oPC, int nCameraMode, float fDegrees)
{
    AssignCommand(oPC, ActionPauseConversation());

    DelayCommand(3.0, SetCameraMode(oPC, nCameraMode));

    DelayCommand(3.2, SetCameraFacing(GetFacing(oPC), fDegrees));

    DelayCommand(3.5, AssignCommand(oPC, ActionResumeConversation()));
}

void CutsceneJumpToWaypoint(object oPC, int i)
{
    object oWP = GetNearestObjectByTag("WP_CUTSCENE_JUMP_" + IntToString(i), oPC);
    location lWP = GetLocation(oWP);
    float fWP = GetFacingFromLocation(lWP);

    //Do a fade to hide the jump
    FadeToBlack(oPC, FADE_SPEED_FASTEST);
    DelayCommand(0.5, AssignCommand(oPC, JumpToLocation(lWP)));
//    DelayCommand(1.0, FadeFromBlack(oPC, FADE_SPEED_FASTEST));

    DelayCommand(0.8, AssignCommand(oPC, SetFacing(fWP)));
    DelayCommand(1.0, AssignCommand(oPC, SetCameraFacing(fWP, 10.0)));

    int i = GetLocalInt(oPC, "N_" + GetLocalString(oPC, "S_CURR_CUTSCENE"));

    i++;

    SetLocalInt(oPC, "N_" + GetLocalString(oPC, "S_CURR_CUTSCENE"), i);
}

int GetCutsceneStage(object oPC)
{
    return GetLocalInt(oPC, "N_" + GetLocalString(oPC, "S_CURR_CUTSCENE"));
}

void DestroyAllEnemyCreaturesInArea(object o)
{
    object oCreature = GetFirstObjectInArea(GetArea(o));

    while (oCreature != OBJECT_INVALID)
    {
        if (GetObjectType(oCreature) == OBJECT_TYPE_CREATURE && GetIsEnemy(o, oCreature))
        {
            SetPlotFlag(oCreature, FALSE);

            SetImmortal(oCreature, FALSE);

            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oCreature);
        }

        oCreature = GetNextObjectInArea(GetArea(o));
    }
}

int GetHenchmanReaction(object oPC, object oHench)
{
    string sTag = GetTag(oHench);

    string sJournal = "JT_PREL_" + GetStringRight(sTag, 4);

    // HENCHMAN MARKIUS
    if (sTag == "HENCH_MARK")
    {

    }

    // HENCHMAN LYEN
    else if (sTag == "HENCH_LYEN")
    {
        if (GetLocalInt(oPC, "N_ST_0_BETRAYED_LYEN") == 1)
            return UNFRIENDLY;

        else if (GetJournalQuestState(sJournal, oPC) > 0)
            return FRIENDLY;
    }

    // HENCHMAN KARA
    else if (sTag == "HENCH_KARA")
    {
        if (GetLocalInt(oPC, "N_TOOK_BLOODSTONE") == 1)
            return UNFRIENDLY;

        else if (GetJournalQuestState(sJournal, oPC) > 0)
            return FRIENDLY;
    }

    // HENCHMAN TARIN
    else if (sTag == "HENCH_TARI")
    {
        if (GetJournalQuestState(sJournal, oPC) == 18)
            return FRIENDLY;

        else if (GetJournalQuestState(sJournal, oPC) == 15)
            return UNFRIENDLY;
    }

    // HENCHMAN BRUKUS
    else if (sTag == "HENCH_BRUK")
    {
        sJournal = "JT_PREL_TARI";

        if (GetJournalQuestState(sJournal, oPC) == 18)
            return FRIENDLY;

        else if (GetJournalQuestState(sJournal, oPC) == 15)
            return UNFRIENDLY;
    }

    // DEFAULT TO NEUTRAL IF NO OTHER VALUE HAS BEEN RETURNED
    return NEUTRAL;
}

void StripWeapons(object oCreature, object oContainer)
{
    //Copy and destroy anything equipped in the creature's hands.
    object oRight = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oCreature);
    SetPlotFlag(oRight, FALSE);
    CopyItem(oRight, oContainer, TRUE);
    DestroyObject(oRight, 1.0);

    object oLeft = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oCreature);
    SetPlotFlag(oLeft, FALSE);
    CopyItem(oLeft, oContainer, TRUE);
    DestroyObject(oLeft, 1.0);

    //Remove any unequiped weapons.
    object oWeapon = GetFirstItemInInventory(oCreature);
    int iBaseType;
    while (oWeapon != OBJECT_INVALID)
    {
        iBaseType = GetBaseItemType(oWeapon);
        if (iBaseType == BASE_ITEM_BASTARDSWORD ||
            iBaseType == BASE_ITEM_BATTLEAXE ||
            iBaseType == BASE_ITEM_CLUB ||
            iBaseType == BASE_ITEM_DAGGER ||
            iBaseType == BASE_ITEM_DART ||
            iBaseType == BASE_ITEM_DIREMACE ||
            iBaseType == BASE_ITEM_DOUBLEAXE  ||
            iBaseType == BASE_ITEM_DWARVENWARAXE ||
            iBaseType == BASE_ITEM_GREATAXE ||
            iBaseType == BASE_ITEM_GREATSWORD ||
            iBaseType == BASE_ITEM_GRENADE ||
            iBaseType == BASE_ITEM_HALBERD ||
            iBaseType == BASE_ITEM_HANDAXE ||
            iBaseType == BASE_ITEM_HEAVYCROSSBOW ||
            iBaseType == BASE_ITEM_HEAVYFLAIL  ||
            iBaseType == BASE_ITEM_KAMA ||
            iBaseType == BASE_ITEM_KATANA ||
            iBaseType == BASE_ITEM_KUKRI ||
            iBaseType == BASE_ITEM_LIGHTCROSSBOW ||
            iBaseType == BASE_ITEM_LIGHTFLAIL ||
            iBaseType == BASE_ITEM_LIGHTHAMMER ||
            iBaseType == BASE_ITEM_LIGHTMACE ||
            iBaseType == BASE_ITEM_LONGBOW ||
            iBaseType == BASE_ITEM_LONGSWORD ||
            iBaseType == BASE_ITEM_MAGICSTAFF ||
            iBaseType == BASE_ITEM_MORNINGSTAR ||
            iBaseType == BASE_ITEM_QUARTERSTAFF ||
            iBaseType == BASE_ITEM_RAPIER ||
            iBaseType == BASE_ITEM_SCIMITAR ||
            iBaseType == BASE_ITEM_SCYTHE ||
            iBaseType == BASE_ITEM_SHORTBOW ||
            iBaseType == BASE_ITEM_SHORTSPEAR ||
            iBaseType == BASE_ITEM_SHORTSWORD ||
            iBaseType == BASE_ITEM_SHURIKEN ||
            iBaseType == BASE_ITEM_SICKLE ||
            iBaseType == BASE_ITEM_SLING ||
            iBaseType == BASE_ITEM_THROWINGAXE ||
            iBaseType == BASE_ITEM_TWOBLADEDSWORD ||
            iBaseType == BASE_ITEM_WARHAMMER ||
            iBaseType == BASE_ITEM_WHIP)
        {
            //Remove plot flag
            SetPlotFlag(oWeapon, FALSE);

            //Copy to chest and destroy
            CopyItem(oWeapon, oContainer, TRUE);
            DestroyObject(oWeapon, 1.0);

        }

        //Update loop variable
        oWeapon = GetNextItemInInventory(oCreature);
    }
}
