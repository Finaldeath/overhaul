//::///////////////////////////////////////////////
//:: Name q2a_ud_fieldcom
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Default On User Defined Event script
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 11/03
//:://////////////////////////////////////////////
#include "nw_i0_generic"
#include "x2_inc_cutscene"
#include "nw_i0_plot"

int nCutsceneNumber = 105;

void CreateOutsider(location lSpawn);
void SpawnOutsider(string szOutsider, location lSpawn);
void StartCutscene(object oPC, location lSpawn);
void AcquireTarget(object oOutsider);

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 500 ) //Create Outsider in Compound
    {

        //Don't do anything if the PC has attacked the gates

        if (GetLocalInt(GetModule(), "X2_PCPhase1Betray") == 1)
            return;

        DelayCommand(12.0, SignalEvent(OBJECT_SELF, EventUserDefined(500)));

        //increase the delay before the first summoning
        if (GetLocalInt(OBJECT_SELF, "nDelay") != 1)
        {
            DelayCommand(12.0, SetLocalInt(OBJECT_SELF, "nDelay", 1));
            return;
        }


        if (GetIsInCombat() == TRUE)
            return;

        //Only show this cutscene once
        if (GetLocalInt(GetModule(), "X2_BATTLE1Outsider") == 1)
            return;
        //Don't show it after Battle 1 is over - won or lost
        if (GetLocalInt(GetModule(), "X2_Q2ABattle1Won") == 1)
        {
            return;
        }
        if (GetLocalInt(GetModule(), "X2_Q2ABattle1Lost") == 1)
        {
            return;
        }

        //Commander casts 'summoning'
        ActionCastFakeSpellAtLocation(SPELL_WORD_OF_FAITH, GetLocation(OBJECT_SELF));
        SetLocalInt(GetModule(), "X2_BATTLE1Outsider", 1);

        int nRandom = Random(2) + 1;
        location lSpawn = GetLocation(GetWaypointByTag("bat1wp_outsiderspawn" + IntToString(nRandom)));

        DelayCommand(6.0, CreateOutsider(lSpawn));
        if (GetLocalInt(OBJECT_SELF, "nTellPC") == 1)
            return;
        SetLocalInt(OBJECT_SELF, "nTellPC", 1);
        object oHerald = GetObjectByTag("q2aherald");
        AssignCommand(oHerald, PlaySpeakSoundByStrRef(85756));//"Someone is summoning creatures into the courtyard!"

        object oPC = GetLocalObject(oHerald, "oLeader");
        DelayCommand(2.0, StartCutscene(oPC, lSpawn));
    }
}

void CreateOutsider(location lSpawn)
{
    //Don't do anything if the PC has attacked the gates

    if (GetLocalInt(GetModule(), "X2_PCPhase1Betray") == 1)
        return;
    int nOutsider = Random(2);
    string szOutsider;
    switch (nOutsider)
    {
        case 0: szOutsider = "q2abat1_out2";
                break;
        case 1: szOutsider = "q2abat1_out3";
                break;
    }
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_GATE), lSpawn);
    DelayCommand(2.0, SpawnOutsider(szOutsider, lSpawn));
}

void SpawnOutsider(string szOutsider, location lSpawn)
{
    //Don't do anything if the PC has attacked the gates

    if (GetLocalInt(GetModule(), "X2_PCPhase1Betray") == 1)
        return;
    object oOutsider = CreateObject(OBJECT_TYPE_CREATURE, szOutsider, lSpawn);

    DelayCommand(6.0, ChangeToStandardFaction(oOutsider, STANDARD_FACTION_HOSTILE));
    DelayCommand(6.5, AcquireTarget(oOutsider));


}

//Camera zooms around summoned creature
void StartCutscene(object oPC, location lSpawn)
{
    //if the betrayal cutscene is about to show - don't do anything
    if (GetLocalInt(GetModule(), "NoShowCutscene105") == 1)
        return;

    //Don't do anything if the PC has attacked the gates
    if (GetLocalInt(oPC, "X2_EvilBetrayerType") == 1)
        return;
    if (GetLocalInt(GetModule(), "X2_PCPhase1Betray") == 1)
        return;


    //Need to Clear all daze/paralyzed effects from the PC so that if he happens to be paralyzed
    //he will still get the cutscene.
    effect ePCEffect = GetFirstEffect(oPC);
    int nEffectType;
    while (GetIsEffectValid(ePCEffect) == TRUE)
    {
        nEffectType = GetEffectType(ePCEffect);
        if (nEffectType == EFFECT_TYPE_CONFUSED || nEffectType == EFFECT_TYPE_DAZED || nEffectType == EFFECT_TYPE_ENTANGLE
            || nEffectType == EFFECT_TYPE_PARALYZE)
            RemoveEffect(oPC, ePCEffect);

        ePCEffect = GetNextEffect(oPC);
    }

    CutSetActiveCutscene(nCutsceneNumber, CUT_DELAY_TYPE_CONSTANT);
    CutDisableAbort(nCutsceneNumber);

    AssignCommand(oPC, ClearAllActions(TRUE));
            //Fade PCs to black
    BlackScreen(oPC);
    CutSetActiveCutsceneForObject(oPC, nCutsceneNumber, TRUE);

    //Freeze the Henchmen and Imloth
    object oImloth = GetObjectByTag("q2aherald");
    effect eFreeze = EffectCutsceneImmobilize();

    int i = 1;
    object oHench = GetHenchman(oPC, i);
    while(oHench != OBJECT_INVALID)
    {
        CutSetActiveCutsceneForObject(oHench, nCutsceneNumber, FALSE);
        CutApplyEffectToObject2(0.0, DURATION_TYPE_TEMPORARY, eFreeze, oHench, 11.0);
        i++;
        oHench  = GetHenchman(oPC, i);
    }
    CutSetActiveCutsceneForObject(oImloth, nCutsceneNumber, FALSE);
    CutApplyEffectToObject2(0.0, DURATION_TYPE_TEMPORARY, eFreeze, oImloth, 11.0);

    //CutDisableAbort(nCutsceneNumber);
    CutSetCutsceneMode(0.25, oPC, TRUE, TRUE, TRUE, TRUE); // pc invis - keep and freeze associates

    CutFadeFromBlack(1.0, oPC, FADE_SPEED_FAST, FALSE);
    CutSetLocation(0.30, oPC, FALSE);
    CutJumpToLocation(0.75, oPC, lSpawn);
    CutSetCamera(0.75, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 20.0, 60.0, CAMERA_TRANSITION_TYPE_SNAP, FALSE);
    CutSetCamera(1.0, oPC, CAMERA_MODE_TOP_DOWN, 180.0, 10.0, 70.0, CAMERA_TRANSITION_TYPE_SLOW, FALSE);
    CutApplyEffectToObject2(1.5, DURATION_TYPE_TEMPORARY, EffectCutsceneParalyze(), oPC, 10.0);
    // End Cutscene
    CutFadeOutAndIn(10.0, oPC);

    //Clean up actors...
    CutDisableCutscene(nCutsceneNumber, 10.5, 10.5, RESTORE_TYPE_NORMAL);


}

void AcquireTarget(object oOutsider)
{
    object oTarget = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, oOutsider);
    if (GetLocalInt(oTarget, "Q2A_OnLedge") == 0)
        DelayCommand(5.0, AssignCommand(oOutsider, ActionAttack(oTarget)));
    else
    {
        object oGate = GetObjectByTag("q2ainnergate");
        DelayCommand(5.0, AssignCommand(oOutsider, ActionAttack(oGate)));
    }

    //Nearest Couple rebels should attack the outsider
    object oReb1 = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, oOutsider, 1);
    if (GetIsObjectValid(oReb1) == TRUE && GetIsInCombat(oReb1) == FALSE)
        AssignCommand(oReb1, ActionAttack(oOutsider));

    object oReb2 = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, oOutsider, 1);
    if (GetIsObjectValid(oReb2) == TRUE && GetIsInCombat(oReb2) == FALSE)
        AssignCommand(oReb2, ActionAttack(oOutsider));
}

