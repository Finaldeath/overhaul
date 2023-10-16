// ------------- BEGIN SPECIFICATIONS ------------ //

// TestMessage - Sends message to player if TESTING is on, otherwise, does nothing
void TestMessage(string sMessage);

// SpawnBeginningItems - Spawns on the player the beginning items that they will use
void SpawnBeginningItems(object oPC);

// GetMainClass - returns the highest level class possessed by
//   object o
int GetMainClass(object o);

// GetTotalLevel - get the total level of all combined classes
//   of object o
int GetTotalLevel(object o);

// GetNumberOfPlayers - return the total number of PC's in game
int GetNumberOfPlayers();

// GetIsSPGame - returns TRUE if only a single player in game,
//   FALSE otherwise
int GetIsSPGame();

// DestroyUniqueNPC - destroys all copy of this object in the game
void DestroyUniqueNPC(object o);

// GetIsUniqueNPCDead - returns TRUE if object with sTag for tag
//   has been killed, FALSE otherwise
int GetIsUniqueNPCDead(string sTag);

// GetObjectInt - returns the module int value for o ; this is
//   different from local variables as it tracks ALL copies with
//   same tag as o
int GetObjectInt(object o, string s);

// SetObjectInt - sets the module int value for o ; this is
//   different from local variables as it tracks ALL copies with
//   same tag as o
void SetObjectInt(object o, string s, int n);

// SceneSpeak - same as SpeakString, except speaking object's name shown
//   in floaty text as well
void SceneSpeak(object o, string s);

// CreateCreatureOnWP - creates creature object with sTag as blueprint on
//   nearest waypoint to object oPC matching style of "WP_(sTag)", IF no creature is in the
//   area matching that tag.  Otherwise, takes object in area, and
//   "jumps" it to waypoint
object CreateCreatureOnWP(string sTag, object oPC);

// RemoveEffectByType - Remove a specific type of effect from object o
void RemoveEffectByType(object o, int nEffectType);

// RemoveAllEffects - remove all effects from object o
void RemoveAllEffects(object o);

// GetFirstTimeIn - checks to see if this function has been called
//   before, if not, returns TRUE and marks that it has been called
//   if so, returns FALSE
int GetFirstTimeIn(object o = OBJECT_SELF);

// PermanentSitCross - cause object o to permanently sit cross-legged style
void PermanentSitCross(object o);

// RandomWalk - used to make object o randomly walk and randomize
//   Talk Level variable for making various nodes appear
void RandomWalk(object o);

// DoCutsceneConversation - cause oPC to "jump" to appropriate
//   cutscene position and initiate cutscene conversation with
//   him/herself
void DoCutSceneConversation(object oPC, string sConversation);

// GetObjectArmorString - returns first 8 letters of armor's name
//   which is currently being worn by object o.  Used mainly in
//   disguise scripts
string GetObjectArmorString(object o);

// PlayDead - cause object o to play "death" animations, lying on the
//   ground and not moving
void PlayDead(object o);

// ModifyFactionReputation - Allows for manually modifying a custom faction
void ModifyFactionReputation(object oTarget, string sFaction, int nAdjustment);

// ChangeToFaction - allows object to change to a faction
void ChangeToFaction(object o, string sFaction);

// SpawnCreatureByRace - Spawns a creature on nearest WP by PC's race
object SpawnCreatureByRace(string sTag, object oPC);

// Kneel - cause object o to "kneel" until some other action is performed
void Kneel(object o);

// SitInNearestChair - cause object o to find nearest chair and sit in it
void SitInNearestChair(object o);

// MakeStatue - Make a creature object behave as a "statue"
void MakeStatue(object o);

// DoAnimationPermanent - Do parameter animation until local int "N_STOP_ANIMATION" is set
void DoAnimationPermanent(object o, int nAnimation, int nStoppable = TRUE);

// RemoveAnimatinoPermanent - Removes a permanent animation placed on object o
void RemoveAnimationPermanent(object o);

// MyApplyEffectToObject - Customized ApplyEffectToObject (makes Module apply effect, rather than caller)
void MyApplyEffectToObject(int nDurationType, effect eEffect, object oTarget, float fDuration=0.0f);

// MyApplyEffectAtLocation - Customized ApplyEffectAtLocation (makes Module apply effect, rather than caller)
void MyApplyEffectAtLocation(int nDurationType, effect eEffect, location lLocation, float fDuration=0.0f);

// ------------- END SPECIFICATIONS -------------- //

// ----------------------------------------------- //

// ------------- BEGIN IMPLEMENTATIONS ----------- //
void TestMessage(string sMessage)
{
    if (GetLocalInt(GetModule(), "N_TEST") == 1)
    {
        SendMessageToPC(GetFirstPC(), sMessage);
    }
}

void SpawnBeginningItems(object oPC)
{
    int i;
    string sArmor;
    string sWeapon;

    // BEGINNING MEALS (INITIAL VALUE OF 5 MEALS)
    for (i = 1; i <= 5; i++)
        CreateItemOnObject("IT_MISC_MEAL_001", oPC);

    // ---- BEGIN ARMOR ---- //

    // Special case of Ranger or Bard, give Light Armor
    if (GetLevelByClass(CLASS_TYPE_RANGER, oPC) >= 1 || GetLevelByClass(CLASS_TYPE_BARD, oPC) >= 1)
        sArmor = "IT_ARM_LIGHT_008";

    // Check to see if can use Heavy Armor first
    else if (GetHasFeat(FEAT_ARMOR_PROFICIENCY_HEAVY, oPC))
        sArmor = "IT_ARM_HEAVY_005";

    // else if can use Medium Armor
    else if (GetHasFeat(FEAT_ARMOR_PROFICIENCY_MEDIUM, oPC))
        sArmor = "IT_ARM_MED_006";

    // else if can use Light Armor
    else if (GetHasFeat(FEAT_ARMOR_PROFICIENCY_LIGHT, oPC))
        sArmor = "IT_ARM_LIGHT_008";

    // otherwise, give clothing
    else
        sArmor = "IT_ARM_CLOTH_008";

    // CREATE THE ARMOR ON PC
    CreateItemOnObject(sArmor, oPC);

    // MAKE PC EQUIP ARMOR
    AssignCommand(oPC, ActionEquipItem(GetItemPossessedBy(oPC, sArmor), INVENTORY_SLOT_CHEST));

    // CREATE A SHIELD ON PC IF HAS SHIELD PROFICIENCY
    if (GetHasFeat(FEAT_SHIELD_PROFICIENCY, oPC))
    {
        object oShield = CreateItemOnObject("IT_ARM_SSH_001", oPC);

        AssignCommand(oPC, ActionEquipItem(oShield, INVENTORY_SLOT_LEFTHAND));
    }
    // ---- END ARMOR ---- //

    // ---- BEGIN WEAPONS ---- //

    // IF SPECIAL CASE OF RANGER, CREATE LONGSWORD AND SHORT SWORD
    if (GetLevelByClass(CLASS_TYPE_RANGER, oPC) > 0)
    {
        object oWeapon;

        sWeapon = "IT_WEAP_LSWO_001";
        //Replace with Short Sword if they're a small race.
        int iRace = GetRacialType(oPC);
        if (iRace == IP_CONST_RACIALTYPE_GNOME ||
            iRace == IP_CONST_RACIALTYPE_HALFLING)
        {
            sWeapon = "IT_WEAP_SSWO_001";
        }

        oWeapon = CreateItemOnObject(sWeapon, oPC);

        AssignCommand(oPC, ActionEquipItem(oWeapon, INVENTORY_SLOT_RIGHTHAND));

        sWeapon = "IT_WEAP_SSWO_001";

        oWeapon = CreateItemOnObject(sWeapon, oPC);

        AssignCommand(oPC, ActionEquipItem(oWeapon, INVENTORY_SLOT_LEFTHAND));
    }

    // ELSE IF SORCERER OR WIZARD, GIVE APPRENTICE STAFF
    else if (GetLevelByClass(CLASS_TYPE_WIZARD, oPC) > 0 || GetLevelByClass(CLASS_TYPE_SORCERER, oPC) > 0)
    {
        object oStaff;

        sWeapon = "IT_WEAP_MSTA_001";

        oStaff = CreateItemOnObject(sWeapon, oPC);

        AssignCommand(oPC, ActionEquipItem(oStaff, INVENTORY_SLOT_RIGHTHAND));
    }

    // IF ANY OTHER CLASS THAN RANGER, WIZARD, OR SORCERER, JUST CREATE ONE WEAPON ON PC
    else
    {
        object oWeapon;

        if (GetHasFeat(FEAT_WEAPON_PROFICIENCY_MARTIAL, oPC))
        {
            sWeapon = "IT_WEAP_LSWO_001";
            //Replace with Short Sword if they're a small race.
            int iRace = GetRacialType(oPC);
            if (iRace == IP_CONST_RACIALTYPE_GNOME ||
                iRace == IP_CONST_RACIALTYPE_HALFLING)
            {
                sWeapon = "IT_WEAP_SSWO_001";
            }
        }
        else if (GetHasFeat(FEAT_WEAPON_PROFICIENCY_ELF, oPC))
            sWeapon = "IT_WEAP_LSWO_001";

        else if (GetHasFeat(FEAT_WEAPON_PROFICIENCY_ROGUE, oPC))
            sWeapon = "IT_WEAP_SSWO_001";

        else if (GetHasFeat(FEAT_WEAPON_PROFICIENCY_DRUID, oPC))
            sWeapon = "IT_WEAP_SCIM_001";

        else if (GetHasFeat(FEAT_WEAPON_PROFICIENCY_SIMPLE, oPC))
        {
            sWeapon = "IT_WEAP_QSTA_001";
            //Replace with Dagger if they're a small race.
            int iRace = GetRacialType(oPC);
            if (iRace == IP_CONST_RACIALTYPE_GNOME ||
                iRace == IP_CONST_RACIALTYPE_HALFLING)
            {
                sWeapon = "IT_WEAP_DAGG_001";
            }
        }

        else if (GetHasFeat(FEAT_WEAPON_PROFICIENCY_WIZARD, oPC))
        {
            sWeapon = "IT_WEAP_QSTA_001";
            //Replace with Dagger if they're a small race.
            int iRace = GetRacialType(oPC);
            if (iRace == IP_CONST_RACIALTYPE_GNOME ||
                iRace == IP_CONST_RACIALTYPE_HALFLING)
            {
                sWeapon = "IT_WEAP_DAGG_001";
            }
        }

        else
        {
            sWeapon = "IT_WEAP_DAGG_001";
        }

        oWeapon = CreateItemOnObject(sWeapon, oPC);

        AssignCommand(oPC, ActionEquipItem(oWeapon, INVENTORY_SLOT_RIGHTHAND));

    }

    // ------ END WEAPONS ------ //
}

int GetMainClass(object o)
{
    int i;

    int nLevel = GetLevelByPosition(1, o);
    int nPosition = 1;

    for (i = 1; i <= 3; i++)
        if (nLevel < GetLevelByPosition(i, o))
            nPosition = i;

    return GetClassByPosition(nPosition, o);
}

int GetTotalLevel(object o)
{
    int i;
    int nTotalLevel = 0;

    for (i = 1; i <= 3; i++)
        nTotalLevel += GetLevelByPosition(i, o);

    return nTotalLevel;
}

int GetNumberOfPlayers()
{
    int nNumbOfPlayers;

    object oPC = GetFirstPC();

    while (oPC != OBJECT_INVALID)
    {
        nNumbOfPlayers++;

        oPC = GetNextPC();
    }

    return nNumbOfPlayers;
}

int GetIsSPGame()
{
    int n = GetNumberOfPlayers();

    if (n == 1)
        return TRUE;

    return FALSE;
}

void DestroyUniqueNPC(object o)
{
    string sTag = GetTag(o);

    object o = GetObjectByTag(sTag);
    int n = 0;

    // find all other versions of this object in the game, and kill them
    while (o != OBJECT_INVALID)
    {
        DestroyObject(o);

        n++;
        o = GetObjectByTag(sTag, n);
    }
}

int GetIsUniqueNPCDead(string sTag)
{
    if (GetLocalInt(GetModule(), "N_" + sTag + "_DEAD") == 1)
        return TRUE;

    return FALSE;
}

int GetObjectInt(object o, string s)
{
    return GetLocalInt(GetModule(), "OBJ_INT_ " + GetTag(o) + s);
}

void SetObjectInt(object o, string s, int n)
{
    SetLocalInt(GetModule(), "OBJ_INT_" + GetTag(o) + s, n);
}

void SceneSpeak(object o, string s)
{
    if (!(GetIsDead(o)))
        AssignCommand(o, SpeakString("[" + GetName(o) + "]  " + s));
}

object CreateCreatureOnWP(string sTag, object oPC)
{
    object o;

    if (GetIsPC(oPC))
    {
        o = GetNearestObjectByTag(sTag, oPC);

        if (GetArea(o) != GetArea(oPC))
        {
            object oWP = GetNearestObjectByTag("WP_" + sTag, oPC);

            o = CreateObject(OBJECT_TYPE_CREATURE, GetStringLowerCase(sTag), GetLocation(oWP));
        }
    }

    return o;
}

void RemoveEffectByType(object o, int nEffectType)
{
    effect e = GetFirstEffect(o);

    while (GetIsEffectValid(e) == TRUE)
    {
        if (GetEffectType(e) == nEffectType)
        {
            RemoveEffect(o, e);
        }

        e = GetNextEffect(o);
    }
}

void RemoveAllEffects(object o)
{
    int nPrevPlotFlag = GetPlotFlag(o);
    SetPlotFlag(o, FALSE);
    effect e = GetFirstEffect(o);

    while (GetIsEffectValid(e) == TRUE)
    {
        RemoveEffect(o, e);
        e = GetNextEffect(o);
    }

    SetPlotFlag(o, nPrevPlotFlag);
}

// Used for testing to see if first time in on OnEnter
int GetFirstTimeIn(object o = OBJECT_SELF)
{
    if (GetLocalInt(o, "N_FIRST_TIME_IN") == 0)
    {
        SetLocalInt(o, "N_FIRST_TIME_IN", 1);

        return TRUE;
    }

    else
        return FALSE;
}

void PermanentSitCross(object o)
{
    int nCurrPlotFlagState = GetPlotFlag(o);

    SetPlotFlag(o, FALSE);

    AssignCommand(o, PlayAnimation(ANIMATION_LOOPING_SIT_CROSS, 1.0, 6.0));

    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_FREEZE_ANIMATION), o);

    DelayCommand(2.5, SetPlotFlag(o, nCurrPlotFlagState));
}

void RandomWalk(object o)
{
    AssignCommand(o, ClearAllActions());

    if (GetLocalInt(o, "N_DONT_RAND") == 0)
    {
        AssignCommand(o, ActionRandomWalk());

        int n = Random(GetLocalInt(GetModule(), "N_COMM_MAX_RAND"));

        SetLocalInt(GetModule(), "N_TALK_LVL_" + GetTag(o), n);
    }

    DelayCommand(6.0, RandomWalk(o));
}

void DoCutsceneConversation(object oPC, string sConversation)
{
    object oWP = GetNearestObjectByTag("WP_CUTSCENE", oPC);

    location lWP = GetLocation(oWP);

    AssignCommand(oPC, ClearAllActions());

    if (GetDistanceBetween(oPC, oWP) > 15.0)
        AssignCommand(oPC, JumpToLocation(lWP));

    AssignCommand(oPC, ActionStartConversation(oPC, sConversation, TRUE, FALSE));
}

string GetObjectArmorString(object o)
{
    object oArmor = GetItemInSlot(INVENTORY_SLOT_CHEST, o);

    string sReturn = GetStringLeft(GetName(oArmor), 8);

    if (GetLocalInt(GetModule(), "N_TEST") == 1)
        SendMessageToPC(o, "[The first 8 letters of your armor are : " + sReturn + "]");

    return sReturn;
}

void PlayDead(object o)
{
    float fFacing = GetFacing(o);

    AssignCommand(o, SetFacing(fFacing));

    AssignCommand(o, PlayAnimation(ANIMATION_LOOPING_DEAD_FRONT, 0.2, 12.0));

    DelayCommand(8.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_FREEZE_ANIMATION), o));
}

void ModifyFactionReputation(object oTarget, string sFaction, int nAdjustment)
{
    object oFactionObject = GetObjectByTag("FACTION_" + sFaction);

    AdjustReputation(oTarget, oFactionObject, nAdjustment);
}

void ChangeToFaction(object o, string sFaction)
{
    object oFactionObject = GetObjectByTag("FACTION_" + sFaction);

    // if neutral, be sure to clear all actions, and set plot flag to avoid troubles
    if (sFaction == "NEUTRAL")
    {
        SetPlotFlag(o, TRUE);
        AssignCommand(o, ClearAllActions());
    }

    // else if Hostile, make sure to set plot flag to FALSE so PC has chance of killing them
    else if (sFaction == "HOSTILE")
    {
        SetPlotFlag(o, FALSE);
    }

    ChangeFaction(o, oFactionObject);
}

object SpawnCreatureByRace(string sTag, object oPC)
{
    // Get the nearest WP to spawn at
    object oWP = GetNearestObjectByTag("WP_" + sTag, oPC);

    if (oWP != OBJECT_INVALID && GetArea(oWP) == GetArea(oPC))
        PrintString("[WP found, should be spawning...]");

    else
        PrintString("[Problem with WP, not finding it properly...]");

    location lWP = GetLocation(oWP);
    string s;

    s = sTag + "_0" + IntToString(GetLocalInt(GetModule(), "N_OKARIS_RACE"));

    PrintString("creating object - "+ s);
    object oNew = CreateObject(OBJECT_TYPE_CREATURE, s, lWP);
    object oChair = GetNearestObjectByTag("PT_" + GetTag(oNew));

    if (GetDistanceBetween(oNew, oChair) <= 10.0)
        AssignCommand(oNew, ActionSit(oChair));

    return oNew;
}

void Kneel(object o)
{
    if (GetCurrentAction(o) == ACTION_INVALID)
    {
        AssignCommand(o, PlayAnimation(ANIMATION_LOOPING_MEDITATE, 1.0, 3.0));

        DelayCommand(3.0, Kneel(o));
    }
}

void SitInNearestChair(object o)
{
    object oChair;

    if (GetIsPC(o))
    {
        oChair = GetNearestObjectByTag("PT_PC_SITTING_CHAIR", o);
    }

    else
    {
        if (GetLocalInt(GetModule(), "N_TEST") == 1)
            SendMessageToPC(GetFirstPC(), "[Object : " + GetTag(o) + " ; should be sitting in nearest chair...]");

        oChair = GetNearestObjectByTag("PT_" + GetTag(o), o);
    }

    if (GetDistanceBetween(o, oChair) <= 10.0)
        AssignCommand(o, ActionSit(oChair));
}

void MakeStatue(object o)
{
    int nOldPlotFlag = GetPlotFlag(o);

    SetPlotFlag(o, FALSE);

    float fFacing = GetFacing(o);

    AssignCommand(o, SetFacing(fFacing));

    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_PROT_STONESKIN), o);

    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_FREEZE_ANIMATION), o);

    DelayCommand(0.5, SetPlotFlag(o, nOldPlotFlag));
}

void DoAnimationPermanent(object o, int nAnimation, int nStoppable)
{
    if (GetLocalInt(o, "N_STOP_ANIMATION") == 0)
    {
        AssignCommand(o, ActionPlayAnimation(nAnimation, 1.0, 6.0));

        if (nStoppable)
            DelayCommand(5.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_FREEZE_ANIMATION), o));

        else
            DelayCommand(6.0, DoAnimationPermanent(o, nAnimation, FALSE));
    }
}

void RemoveAnimationPermanent(object o)
{
    effect e = GetFirstEffect(o);

    while (GetIsEffectValid(e) == TRUE)
    {
        if (GetEffectType(e) == EFFECT_TYPE_VISUALEFFECT)
            RemoveEffect(o, e);

        e = GetNextEffect(o);
    }
}

void MyApplyEffectToObject(int nDurationType, effect eEffect, object oTarget, float fDuration=0.0f)
{
    AssignCommand(GetModule(), ApplyEffectToObject(nDurationType, eEffect, oTarget, fDuration));
}

void MyApplyEffectAtLocation(int nDurationType, effect eEffect, location lLocation, float fDuration=0.0f)
{
    AssignCommand(GetModule(), ApplyEffectAtLocation(nDurationType, eEffect, lLocation, fDuration));
}
