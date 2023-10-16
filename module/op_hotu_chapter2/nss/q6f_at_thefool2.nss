// Start the final fight:

// - enter cutscene mode.
// - fade screen to black.
// - jump each side to starting location across the throne room.
// - remove sabal's plot and immortal flags.
// - make sure sabal does not teleport away.
// - spawn sabal's allies.
// - fade screen out of black.
// - replace existing pillars with magical ones.
// - give all the shards the special properties.
// - move camera fast to sabal.
// - show sabal moving to pillar and activate it.
// - end cutscene.


#include "x2_inc_cutscene"
#include "nw_i0_generic"

int CUTSCENE_NUMBER = 61;

// Bring in red sister allies - the more shards the player has - the more red sisters appear.
void SpawnSabalAllies(object oSabal);

// Places new magical pillar instead of the ones in the throne room and activates them
void ReplacePillars();

// Gives the shards the ability to use the pillars
void EnchantShards(object oObject);

// Sabal and her allies attack
void CutAttack(float fDelay, object oPC);
void CallAttack(int nCutscene, object oPC);

void CallExecuteScript(int nCutscene, object oTarget, string sScript);
void CutExecuteScript(float fDelay, object oTarget, string sScript, int iShift = TRUE);

void main()
{
    object oPC = GetPCSpeaker();
    if(oPC == OBJECT_INVALID)
        oPC = GetFirstPC();

    SetLocalInt(OBJECT_SELF, "STATUS", 3);
    object oSabal = GetNearestObjectByTag("q6_sabal");
    object oSabalWP = GetWaypointByTag("q6f2_wp_sabal_start");
    object oPCWP = GetWaypointByTag("q6f2_wp_pc_start");
    object oCopyWP = GetWaypointByTag("q6f_wp_copy_sp");
    object oCamera1 = GetWaypointByTag("q6f_wp_camera1");
    object oCamera2 = GetWaypointByTag("q6f_wp_camera2");
    object oSabalMove = GetWaypointByTag("q6f_wp_sabal_move");

    int nShards = GetLocalInt(GetModule(), "Q6_SABAL_SHARDS_NUM");
    SetLocalInt(oSabal, "SHARDS_USES", nShards * 3);

    SetPlotFlag(oSabal, FALSE);
    SetImmortal(oSabal, FALSE);
    DelayCommand(2.0, SpawnSabalAllies(oSabal));
    ReplacePillars();
    EnchantShards(oPC);
    EnchantShards(oSabal);
    SetLocalString(oSabal,"X2_SPECIAL_COMBAT_AI_SCRIPT", "q6f_ai_sabal");

    CutSetActiveCutscene(CUTSCENE_NUMBER, CUT_DELAY_TYPE_CUMULATIVE);
    CutSetActiveCutsceneForObject(oPC, CUTSCENE_NUMBER, TRUE);
    CutSetActiveCutsceneForObject(oSabal, CUTSCENE_NUMBER);

    CutSetCutsceneMode(0.0, oPC, TRUE, CUT_CAMERA_HEIGHT_MEDIUM, TRUE, TRUE);
    CutFadeOutAndIn(0.0, oPC, 3.0);
    CutSetCamera(1.0, oPC, CAMERA_MODE_TOP_DOWN, 270.0, 12.0, 70.0, CAMERA_TRANSITION_TYPE_SNAP);
    object oCopy = CutCreatePCCopy(oPC, GetLocation(oCopyWP), "q6f_pc_copy");
    CutJumpToObject(0.5, oSabal, oSabalWP);
    CutJumpToObject(0.0, oPC, oCamera1);
    CutJumpToObject(0.0, oCopy, oPCWP);
    CutSetLocation(0.3, oPC);
    CutSetCameraSpeed(0.0, oPC, 1.5);
    CutActionMoveToObject(1.0, oPC, oCamera2, FALSE);
    CutActionMoveToObject(4.0, oSabal, oSabalMove, TRUE);
    CutSetCamera(0.5, oPC, CAMERA_MODE_TOP_DOWN, 0.0, 4.0, 80.0, CAMERA_TRANSITION_TYPE_MEDIUM);
    CutSpeakStringByStrRef(0.5, oSabal, 84828);
    CutPlayAnimation(1.5, oSabal, ANIMATION_LOOPING_CONJURE2, 2.5);
    CutExecuteScript(1.0, oSabal, "q6_shard");
    CutFadeOutAndIn(3.0, oPC, 3.0);
    CutAdjustReputation(1.0, oSabal, oPC, -100);
    CutAdjustReputation(0.0, oPC, oSabal, -100);
    CutAttack(0.5, oPC);
    CutDisableCutscene(CUTSCENE_NUMBER, 0.0, 0.0);

    //DelayCommand(2.0, AdjustReputation(oSabal, oPC, -100));
    //DelayCommand(2.0, AdjustReputation(oPC, oSabal, -100));
    //DelayCommand(3.5, Attack(oPC));
}

void SpawnSabalAllies(object oSabal)
{
    int nShards = GetLocalInt(GetModule(), "Q6_PC_SHARDS_COUNT");
    object oSP1 = GetNearestObjectByTag("q6f2_wp_sabal_ally", oSabal, 1);
    object oSP2 = GetNearestObjectByTag("q6f2_wp_sabal_ally", oSabal, 2);
    object oSP3 = GetNearestObjectByTag("q6f2_wp_sabal_ally", oSabal, 3);
    object oSP4 = GetNearestObjectByTag("q6f2_wp_sabal_ally", oSabal, 4);
    object oSP5 = GetNearestObjectByTag("q6f2_wp_sabal_ally", oSabal, 5);
    object oSP6 = GetNearestObjectByTag("q6f2_wp_sabal_ally", oSabal, 6);
    object oSP7 = GetNearestObjectByTag("q6f2_wp_sabal_ally", oSabal, 7);
    object oSP8 = GetNearestObjectByTag("q6f2_wp_sabal_ally", oSabal, 8);

    // player can have 1 to 4 shards
    if(nShards >= 1)
    {
        CreateObject(OBJECT_TYPE_CREATURE, "q6_RSWarrior", GetLocation(oSP1));
        CreateObject(OBJECT_TYPE_CREATURE, "q6_RSWarrior", GetLocation(oSP2));
    }
    if(nShards >= 2)
    {
        CreateObject(OBJECT_TYPE_CREATURE, "q6_RSCleric", GetLocation(oSP3));
        CreateObject(OBJECT_TYPE_CREATURE, "q6_RSRogue", GetLocation(oSP4));
    }
    if(nShards >= 3)
    {
        CreateObject(OBJECT_TYPE_CREATURE, "q6_RSCleric", GetLocation(oSP5));
        CreateObject(OBJECT_TYPE_CREATURE, "q6_RSWarrior", GetLocation(oSP6));
    }
    if(nShards >= 4)
    {
        CreateObject(OBJECT_TYPE_CREATURE, "q6_RSRogue", GetLocation(oSP7));
        CreateObject(OBJECT_TYPE_CREATURE, "q6_RSWarrior", GetLocation(oSP8));
    }
}

void ReplacePillars()
{
    int i = 1;
    // using a focus object to locate all pillars so they would be created
    // the same way each time (placement of pillars)
    object oFocus = GetObjectByTag("q6_pillars_focus");
    object oPillar = GetNearestObjectByTag("q6f2_StaticPillar", oFocus, i);
    location lLoc;
    string sBP;
    effect eVis = EffectVisualEffect(VFX_DUR_BLUR);
    object oNewPillar;
    while(oPillar != OBJECT_INVALID)
    {
        lLoc = GetLocation(oPillar);
        SetPlotFlag(oPillar, FALSE);
        DestroyObject(oPillar);
        sBP = "q6f2_Pillar" + IntToString(i);
        oNewPillar = CreateObject(OBJECT_TYPE_PLACEABLE, sBP, lLoc);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, oNewPillar);
        i++;
        oPillar = GetNearestObjectByTag("q6f2_StaticPillar", oFocus, i);
    }


}

void EnchantShards(object oObject)
{
    itemproperty ipShard = ItemPropertyCastSpell(IP_CONST_CASTSPELL_UNIQUE_POWER,
        IP_CONST_CASTSPELL_NUMUSES_3_USES_PER_DAY);
    object oItem = GetFirstItemInInventory(oObject);
    while(oItem != OBJECT_INVALID)
    {
        if(GetTag(oItem) == "q6_shard")
        {
            AddItemProperty(DURATION_TYPE_PERMANENT, ipShard, oItem);
        }
        oItem = GetNextItemInInventory(oObject);
    }

}

void CallAttack(int nCutscene, object oPC)
{
    if(nCutscene == GetLocalInt(oPC, "nCutsceneNumber"))
    {
        object oObject = GetFirstObjectInArea(GetArea(OBJECT_SELF));
        while(oObject != OBJECT_INVALID)
        {
            if(GetStringLeft(GetTag(oObject), 3) == "q6_" &&
                GetTag(oObject) != "q6_TheFool")
            {
                if(GetTag(oObject) != "q6_sabal")
                    AssignCommand(oObject, ActionMoveToObject(oPC, TRUE, 15.0));
                AssignCommand(oObject, ActionDoCommand(DetermineCombatRound(oPC)));
            }
            oObject = GetNextObjectInArea(GetArea(OBJECT_SELF));
        }
    }
}

void CutAttack(float fDelay, object oPC)
{
    int nCutscene = GetActiveCutsceneNum();
    fDelay = CutCalculateCurrentDelay(fDelay, nCutscene);
    DelayCommand(fDelay, CallAttack(nCutscene, oPC));
}

void CallExecuteScript(int nCutscene, object oTarget, string sScript)
{
    if(nCutscene == GetLocalInt(oTarget, "nCutsceneNumber"))
    {
        object oPillar = GetObjectByTag("q6f2_Pillar5");
        SetLocalObject(GetArea(OBJECT_SELF), "CURRENT_SHARD_USER", oTarget);
        SetLocalObject(GetArea(OBJECT_SELF), "CURRENT_SHARD_TARGET", oPillar);
        ExecuteScript(sScript, oTarget);
    }
}

void CutExecuteScript(float fDelay, object oTarget, string sScript, int iShift = TRUE)
{
    int nCutscene = GetActiveCutsceneNum();
    fDelay = CutCalculateCurrentDelay(fDelay, nCutscene);
    DelayCommand(fDelay, DelayCommand(GetShift(oTarget, iShift), CallExecuteScript(nCutscene, oTarget, sScript)));
}


