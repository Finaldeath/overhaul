// global cutscene functions for this trigger

#include "x1_inc_cutscene"
#include "x1_inc_plot"

// NOTE: the first cutscene part is non-abortable as the ActionMoveToLocation can not be aborted
int FIRST_CUTSCENE_NUMBER = 3;
float FIRST_TIME_START = 0.0;
float FIRST_TIME_CAST = FIRST_TIME_START + 7.0;
float FIRST_TIME_SHAKE = FIRST_TIME_CAST + 3.0;
float FIRST_TIME_TALK = FIRST_TIME_SHAKE + 5.0;


int SECOND_CUTSCENE_NUMBER = 31;
float TIME_START = 0.0;
float TIME_MOVE = TIME_START + 4.0;
float TIME_SHAKE = TIME_MOVE + 3.0;
float TIME_DIE = TIME_SHAKE + 3.0;
float TIME_FADE = TIME_DIE + 3.0;
float TIME_JUMP = TIME_FADE + 2.0;


void StartFirstCutscene(object oPC);
void StartSecondCutscene(object oPC);
void PillarEffects(int nCutscene, object oPC, object oDrogan);
void KillDrogan(object oDrogan);
void JumpAllPlayers(object oWP);
void DroganHoldPortal(object oDrogan);
void CallActionCastSpellAtObject(int nCutscene, int iSpell, object oObject, object oTatget, int nCheat = FALSE);
void CutActionCastSpellAtObject(int nCutscene, float fDelay, int iSpell, object oObject, object oTarget, int bCheat = FALSE, int iShift = TRUE);
int GetIsSafeLocation(float x, float y);

void main()
{
    int nEvent = GetUserDefinedEventNumber();
    object oPC = GetLocalObject(OBJECT_SELF, "CUTSCENE_PC");
    if(nEvent == 101)
        StartFirstCutscene(oPC);
    else if(nEvent == 102)
        StartSecondCutscene(oPC);
}

void StartFirstCutscene(object oPC)
{
    // drogan speaks one line about the player activating the portal
    // player moves towards drogan
    // drogan casts one spell at the portal
    // room shakes+effects
    // cutscene ends and drogan inits final dialog

    SetLocalInt(oPC, "nCutsceneNumber", FIRST_CUTSCENE_NUMBER);
    SetLocalInt(oPC, "nCUT3MAINPC", 1);
    SetLocalInt(GetModule(), "X1_CUT3RUNNING", 1);

    object oDrogan = GetNearestObjectByTag("Q3B_DROGAN");
    SetLocalInt(oDrogan, "nCutsceneNumber", FIRST_CUTSCENE_NUMBER);
    SetCommandable(TRUE, oDrogan);
    SetLocalInt(oDrogan, "Q2B_CASTING", 0);
    object oPortal = GetWaypointByTag("Q3B_WP_SAND_PORTAL");
    object oWP = GetWaypointByTag("Q3B_WP_MOVE_TO_PORTAL");
    object oWP2 = GetWaypointByTag("Q3B_WP_MOVE_TO_PORTAL2");
    object oSandWP = GetWaypointByTag("Q4_START");
    object oHenchman = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC);
    SetLocalInt(oHenchman, "nCutsceneNumber", FIRST_CUTSCENE_NUMBER);
    CutRemoveEffects(FIRST_CUTSCENE_NUMBER, FIRST_TIME_START, oPC);
    CutSetCutsceneMode(FIRST_CUTSCENE_NUMBER, FIRST_TIME_START, oPC, TRUE, TRUE, TRUE);
    AssignCommand(oPC, ClearAllActions());

    CutSetCamera(FIRST_CUTSCENE_NUMBER, FIRST_TIME_START, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 30.0, 50.0,
                 CAMERA_TRANSITION_TYPE_VERY_SLOW);

    SetLocalInt(oDrogan, "DIALOG_STATUS", 3);
    AssignCommand(oDrogan, ClearAllActions());
    AssignCommand(oDrogan, SpeakOneLinerConversation("", oPC));
    AssignCommand(oDrogan, ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY1));

    CutActionMoveToLocation(FIRST_CUTSCENE_NUMBER, FIRST_TIME_START + 0.5, oPC, GetLocation(oWP2), FALSE);
    CutActionMoveToLocation(FIRST_CUTSCENE_NUMBER, FIRST_TIME_START + 0.5, oHenchman, GetLocation(oWP2), FALSE);
    CutActionMoveToObject(FIRST_CUTSCENE_NUMBER, FIRST_TIME_START + 2.0, oDrogan, oWP, FALSE);
    CutActionCastSpellAtObject(FIRST_CUTSCENE_NUMBER, FIRST_TIME_CAST, SPELL_GREATER_DISPELLING, oDrogan, oPortal, TRUE);
    CutApplyEffectAtLocation(FIRST_CUTSCENE_NUMBER, FIRST_TIME_SHAKE, oPC, DURATION_TYPE_INSTANT, VFX_FNF_SCREEN_SHAKE, GetLocation(oPortal), 0.0);
    DelayCommand(FIRST_TIME_SHAKE, PillarEffects(FIRST_CUTSCENE_NUMBER, oPC, oDrogan));
    CutSetFacingPoint(FIRST_CUTSCENE_NUMBER, FIRST_TIME_SHAKE, oDrogan, GetTag(oPortal));
    CutSetFacingPoint(FIRST_CUTSCENE_NUMBER, FIRST_TIME_SHAKE, oPC, GetTag(oPortal));

    CutRemoveEffects(FIRST_CUTSCENE_NUMBER, FIRST_TIME_TALK, oPC);
    CutRemoveEffects(FIRST_CUTSCENE_NUMBER, FIRST_TIME_TALK, oHenchman);
    CutSetCamera(FIRST_CUTSCENE_NUMBER, FIRST_TIME_TALK, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 30.0, 50.0,
                 CAMERA_TRANSITION_TYPE_SNAP);

    DelayCommand(FIRST_TIME_TALK, SetLocalInt(oDrogan, "DIALOG_STATUS", 5));
    CutActionStartConversation(FIRST_CUTSCENE_NUMBER, FIRST_TIME_TALK, oDrogan, oPC, "xp1_drogan_conv");
    CutSetCutsceneMode(FIRST_CUTSCENE_NUMBER, FIRST_TIME_TALK, oPC, FALSE);

}

void StartSecondCutscene(object oPC)
{
    // drogan holds the portal
    // player + henchman run and vanish in the portal
    // room shakes+effects
    // drogan gets killed
    // fade to black
    // jump into sand dungeon.

    AssignCommand(oPC, ClearAllActions());

    SetLocalInt(oPC, "nCutsceneNumber", SECOND_CUTSCENE_NUMBER);
    SetLocalInt(oPC, "nCUT31MAINPC", 1);
    SetLocalInt(GetModule(), "X1_CUT31RUNNING", 1);

    object oDrogan = GetNearestObjectByTag("Q3B_DROGAN");
    SetCommandable(TRUE, oDrogan);
    SetLocalInt(oDrogan, "Q2B_CASTING", 0);
    object oPortal = GetWaypointByTag("Q3B_WP_SAND_PORTAL");
    object oWP = GetWaypointByTag("Q3B_WP_MOVE_TO_PORTAL");
    object oWP2 = GetWaypointByTag("Q3B_WP_MOVE_TO_PORTAL2");
    object oSandWP = GetWaypointByTag("Q4_START");
    object oHenchman = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC);
    SetLocalInt(oHenchman, "nCutsceneNumber", SECOND_CUTSCENE_NUMBER);

    CutRemoveEffects(SECOND_CUTSCENE_NUMBER, TIME_START, oPC);
    CutSetCutsceneMode(SECOND_CUTSCENE_NUMBER, TIME_START, oPC, TRUE);

    //CutSetCamera(SECOND_CUTSCENE_NUMBER, TIME_START, oPC, CAMERA_MODE_TOP_DOWN, 25.0, 30.0, 50.0,
    //             CAMERA_TRANSITION_TYPE_VERY_SLOW);
    //CutSetCamera(SECOND_CUTSCENE_NUMBER, TIME_START, oPC, CAMERA_MODE_TOP_DOWN, 25.0, 16.0, 50.0,
    //             CAMERA_TRANSITION_TYPE_SNAP);
    DroganHoldPortal(oDrogan);
    CutSetCamera(SECOND_CUTSCENE_NUMBER, TIME_START, oPC, CAMERA_MODE_TOP_DOWN, 55.0, 13.0, 50.0,
                 CAMERA_TRANSITION_TYPE_SLOW);
    //CutSetFacingPoint(SECOND_CUTSCENE_NUMBER, TIME_TALK + 6.0, oDrogan, GetTag(oPortal));

    CutActionMoveToObject(SECOND_CUTSCENE_NUMBER, TIME_MOVE, oPC, oPortal, TRUE);
    CutActionMoveToObject(SECOND_CUTSCENE_NUMBER, TIME_MOVE, oHenchman, oPortal, TRUE);
    CutApplyEffectAtLocation(SECOND_CUTSCENE_NUMBER, TIME_MOVE + 1.0, oPC, DURATION_TYPE_INSTANT, VFX_FNF_DISPEL_DISJUNCTION, GetLocation(oPortal), 0.0);
    CutApplyEffectToObject(SECOND_CUTSCENE_NUMBER, TIME_MOVE + 1.0, DURATION_TYPE_PERMANENT, VFX_DUR_CUTSCENE_INVISIBILITY,
                           oPC, 9999.0);
    CutApplyEffectToObject(SECOND_CUTSCENE_NUMBER, TIME_MOVE + 1.5, DURATION_TYPE_PERMANENT, VFX_DUR_CUTSCENE_INVISIBILITY,
                           oHenchman, 9999.0);
    CutApplyEffectAtLocation(SECOND_CUTSCENE_NUMBER, TIME_SHAKE, oPC, DURATION_TYPE_INSTANT, VFX_FNF_SCREEN_SHAKE, GetLocation(oPortal), 0.0);
    DelayCommand(TIME_SHAKE, PillarEffects(FIRST_CUTSCENE_NUMBER, oPC, oDrogan));
    DelayCommand(TIME_DIE, KillDrogan(oDrogan));
    CutFadeOutAndIn(SECOND_CUTSCENE_NUMBER, TIME_FADE, oPC);
    DelayCommand(TIME_JUMP, JumpAllPlayers(oSandWP));

    //CutRestoreLocation(SECOND_CUTSCENE_NUMBER, TIME_END, oPC);
    CutRemoveEffects(SECOND_CUTSCENE_NUMBER, TIME_JUMP, oPC);
    CutRemoveEffects(SECOND_CUTSCENE_NUMBER, TIME_JUMP, oHenchman);
    //CutDestroyObject(SECOND_CUTSCENE_NUMBER, TIME_END, oNewPC);
    //DelayCommand(TIME_END - 2.0, DestroyPCCopy());
    CutSetCutsceneMode(SECOND_CUTSCENE_NUMBER, TIME_JUMP, oPC, FALSE);
    DelayCommand(TIME_JUMP, SetPlot("idcrystal", 30, oPC));
}

void PillarEffects(int nCutscene, object oPC, object oDrogan)
{
    //if(nCutscene != GetLocalInt(oPC, "nCutsceneNumber"))
    //    return;

    int i;
    object oPillar;
    vector vPos;
    int j;
    int nRand;
    int nRandX;
    int nRandY;
    float fDelay;
    effect eBeam;
    location lTarget;
    object oTarget;
    effect eDam = EffectDamage(1000);
    effect eChunk = EffectVisualEffect(VFX_COM_HIT_ELECTRICAL);
    //effect eDebris = EffectVisualEffect(353);
    for(i = 1; i <= 6; i++)
    {
        // finding one pillar
        oPillar = GetNearestObjectByTag("Q3B_PORTAL_PILLAR" + IntToString(i));
        oPillar = GetNearestObjectByTag("Q3B_INV_PORTAL", oPillar);
        AssignCommand(oPillar, PlaySound("sff_rainmeteor"));
        eBeam = EffectBeam(VFX_BEAM_LIGHTNING, oPillar, BODY_NODE_HAND);
        nRand = Random(5) + 5;
        // for each pillar having a random (nRand) number of effects
        for(j = 1; j <= nRand; j++)
        {
            // for each effect there is a random delay and a random target within the room
            vPos = GetPosition(oPillar);
            vPos.z  = 0.0;
            vPos.x = vPos.x + (Random(10) - 5);
            vPos.y = vPos.y + (Random(10) - 5);
            fDelay = IntToFloat(Random(4)) * 1.0;
            lTarget = Location(GetArea(OBJECT_SELF), vPos, 0.0);
            if(GetIsSafeLocation(vPos.x, vPos.y)) // do not create debris near the portal where the player and drogan are
                       // (to avoid moving them)
            {
                //oTarget = CreateObject(OBJECT_TYPE_PLACEABLE, "q3b_inv_target", lTarget);
                oTarget = CreateObject(OBJECT_TYPE_PLACEABLE, "plc_stones", lTarget);
                DelayCommand(fDelay - 0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget));

            }
            DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBeam, oTarget, 1.0));
            DelayCommand(fDelay, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eChunk, lTarget));
            DelayCommand(fDelay, AssignCommand(oPillar, PlaySound("as_wt_thundercl1")));

            //DelayCommand(fDelay + 0.3, ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eDebris, lTarget, 0.5));

        }

    }

}

void KillDrogan(object oDrogan)
{
    SetPlotFlag(oDrogan, FALSE);
    object oPillar = GetNearestObjectByTag("Q3B_LIGHTNING_SOURCE3");
    effect eBeam = EffectBeam(VFX_BEAM_LIGHTNING, oPillar, BODY_NODE_HAND);
    effect eVis = EffectVisualEffect(VFX_IMP_LIGHTNING_S);
    //effect eDeath = EffectDeath(TRUE);
    effect eDeath = EffectDamage(1000);
    effect eLink = EffectLinkEffects(eVis, eDeath);

    int i;
    for(i = 1; i <= 6; i++)
    {
        oPillar = GetNearestObjectByTag("Q3B_PORTAL_PILLAR" + IntToString(i));
        oPillar = GetNearestObjectByTag("Q3B_INV_PORTAL", oPillar);
        effect eEff = GetFirstEffect(oPillar);
        while(GetIsEffectValid(eEff))
        {
            RemoveEffect(oPillar, eEff);
            eEff = GetNextEffect(oPillar);
        }

    }

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBeam, oDrogan, 2.0);
    DelayCommand(0.3, ApplyEffectToObject(DURATION_TYPE_INSTANT, eLink, oDrogan));
    MusicBackgroundStop(GetArea(OBJECT_SELF));
    MusicBackgroundChangeDay(GetArea(OBJECT_SELF), 32);
    MusicBackgroundChangeNight(GetArea(OBJECT_SELF), 32);
    MusicBackgroundPlay(GetArea(OBJECT_SELF));
}

void JumpAllPlayers(object oWP)
{
    object oPC = GetFirstPC();
    object oHenchman;
    object oPortal = GetWaypointByTag("Q3B_WP_SAND_PORTAL");
    CreateObject(OBJECT_TYPE_PLACEABLE, "jumpportal", GetLocation(oPortal)); // for multiplayer
    while(oPC != OBJECT_INVALID)
    {
        AssignCommand(oPC, JumpToObject(oWP));
        oHenchman = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC);
        if(oHenchman != OBJECT_INVALID)
            AssignCommand(oHenchman, JumpToObject(oWP));
        oPC = GetNextPC();
    }
    SetLocalObject(GetModule(), "X1_CURRENT_START", oWP);
}

void DroganHoldPortal(object oDrogan)
{
    AssignCommand(oDrogan, ActionCastFakeSpellAtObject(SPELL_GREATER_PLANAR_BINDING, OBJECT_SELF));
    AssignCommand(oDrogan, ActionPlayAnimation(ANIMATION_LOOPING_MEDITATE, 1.0, 20.0));

    int i;
    object oPillar;
    effect eBeam;
    for(i = 1; i <= 6; i++)
    {
        oPillar = GetNearestObjectByTag("Q3B_PORTAL_PILLAR" + IntToString(i));
        oPillar = GetNearestObjectByTag("Q3B_INV_PORTAL", oPillar);
        eBeam = EffectBeam(VFX_BEAM_ODD, oDrogan, BODY_NODE_CHEST);
        DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eBeam, oPillar, 1.0));

    }
}

void CallActionCastSpellAtObject(int nCutscene, int iSpell, object oObject, object oTarget, int bCheat = FALSE)
{
        if(nCutscene == GetLocalInt(oObject, "nCutsceneNumber"))
        {
             AssignCommand(oObject, ActionCastSpellAtObject(iSpell, oTarget, METAMAGIC_ANY, bCheat));
        }

}

void CutActionCastSpellAtObject(int nCutscene, float fDelay, int iSpell, object oObject, object oTarget, int bCheat = FALSE, int iShift = TRUE)
{
        DelayCommand(fDelay, DelayCommand(GetShift(oObject, iShift), CallActionCastSpellAtObject(nCutscene, iSpell, oObject, oTarget, bCheat)));
}

int GetIsSafeLocation(float x, float y)
{
    return !(x >= 75.0 && x <= 84.0 && y >= 110.0 && y <= 116.0);
}

