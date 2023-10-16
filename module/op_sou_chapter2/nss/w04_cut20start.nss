/* w04_cut20start:
 * 1. Shadow Lich confronts and defeats the Dark Wind
 * 2.
 * 3.
 * 4.
 * 5.
 * 6.
 * 7.
 */

//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: April 8/ 03
//:://////////////////////////////////////////////

int CUTSCENE_NUMBER = 20;

float TIME_START = 0.0;
float TIME_AFTER_FADE = 3.0;
float TIME_MOVE1 = 5.0;
float TIME_END = 45.0;

#include "x1_inc_cutscene"

void StartCutscene(object oPC);
void RemoveCutInvis(object oCreature);
void ReturnPlayers();
object FreezeAssociate(object oPlayers);
void RemoveAssociateEffects(object oCreature);
void UnFreezeAssociate(object oPlayers);
void ParalizeAllEnemies();
void CreatePortal(location lTarget);
void SignalPortal();
void PortalEffect();

void main()
{
    //Need to find out which PC triggered the cutscene

    object oPC;
    object oCharacter = GetFirstPC();
    while (oCharacter != OBJECT_INVALID && oPC == OBJECT_INVALID)
    {
        if (GetLocalInt(oCharacter, "bMainPC_Cut20") == 1)
            oPC = oCharacter;
        oCharacter = GetNextPC();

    }

    SetLocalInt(GetModule(), "X1_CUT20RUNNING", 1);

    //Jump MultiPlayerPCs to their station..


    object oPlayers = GetFirstPC();
    while (oPlayers != OBJECT_INVALID)
    {
        object oDominated = FreezeAssociate(oPlayers);
        if (GetIsObjectValid(oDominated) == TRUE)
        {
            SetLocalObject(oPlayers, "oDominated", oDominated);
        }
        //if this isn't the PC who openned the door.
        if (GetName(oPlayers) != GetName(oPC))
        {
            //If they are in Same area
            if (GetTag(GetArea(oPlayers)) == "Wizard_04")
            {
                SetPlotFlag(oPlayers, TRUE);
                SetLocalInt(oPlayers, "nCutsceneNumber", CUTSCENE_NUMBER);
                CutSetCutsceneMode(CUTSCENE_NUMBER, 0.0, oPlayers, TRUE, FALSE, TRUE);
                CutSetLocation(CUTSCENE_NUMBER, 0.0, oPlayers);
                CutFadeOutAndIn(CUTSCENE_NUMBER, 1.0, oPlayers);
                CutApplyEffectToObject(CUTSCENE_NUMBER, 3.0, DURATION_TYPE_PERMANENT, VFX_DUR_CUTSCENE_INVISIBILITY,
                           oPlayers, 9999.0);
                CutJumpToObject(CUTSCENE_NUMBER, 3.75, oPlayers, GetObjectByTag("wp_q3cut20pcx"));
            }
        }
        oPlayers = GetNextPC();
    }
    ParalizeAllEnemies();
    StartCutscene(oPC);
}

void StartCutscene(object oPC)
{
    SetPlotFlag(oPC, TRUE);
    CutSetCutsceneMode(CUTSCENE_NUMBER, 0.0, oPC, TRUE, FALSE, TRUE);

    //Cutscene Creatures
    object oLich = GetObjectByTag("cut20_shadowlich");
    object oWind = GetObjectByTag("cut20darkwind");
    object oWar1 = GetObjectByTag("cut20ShadWarrior1");
    object oWar2 = GetObjectByTag("cut20ShadWarrior2");
    object oWar3 = GetObjectByTag("cut20ShadWarrior3");
    object oWar4 = GetObjectByTag("cut20ShadWarrior4");
    object oWar5 = GetObjectByTag("cut20ShadWarrior5");
    object oWar6 = GetObjectByTag("cut20ShadWarrior6");
    object oWar7 = GetObjectByTag("cut20ShadWarrior6");
    object oWiz1 = GetObjectByTag("cut20ShadWizard");
    object oArch1 = GetObjectByTag("cut20ShadArcher");

    //Set some bodies to stick around on death
    AssignCommand(oWar1, SetIsDestroyable(FALSE));
    AssignCommand(oWar2, SetIsDestroyable(FALSE));
    AssignCommand(oWar3, SetIsDestroyable(FALSE));
    //Camera waypoints
    object oCameraInit = GetWaypointByTag("wp_cut20_camera_init");
    object oCamera1 = GetWaypointByTag("wp_cut20_camera_1");
    object oCamera2 = GetWaypointByTag("wp_cut20_camera_2");
    object oCamera3 = GetWaypointByTag("wp_cut20_camera_3");
    object oCamera4 = GetWaypointByTag("wp_cut20_camera_4");
    object oCamera5 = GetWaypointByTag("wp_cut20_camera_5");
    //Creature Movement Waypoints
    object oLichWp1 = GetWaypointByTag("wp_cut20_lich_1");
    object oLichFacer = GetWaypointByTag("wp_cut20_lich_facer");
    object oPortal = GetWaypointByTag("wp_cut20_portal");
    object oMobLeft = GetWaypointByTag("wp_cut20_mob_left");
    object oMobRight = GetWaypointByTag("wp_cut20_mob_right");

    //Start the cutscene - fade in and out, apply effects to pc
    CutSetLocation(CUTSCENE_NUMBER, 3.0, oPC);
    CutFadeOutAndIn(CUTSCENE_NUMBER, 1.0, oPC);

    CutApplyEffectToObject(CUTSCENE_NUMBER, TIME_AFTER_FADE, DURATION_TYPE_PERMANENT, VFX_DUR_CUTSCENE_INVISIBILITY,
                           oPC, 9999.0);
    CutJumpToLocation(CUTSCENE_NUMBER, TIME_AFTER_FADE, oPC, GetLocation(oCameraInit));
    CutSetCamera(CUTSCENE_NUMBER, TIME_AFTER_FADE + 1.0, oPC, CAMERA_MODE_TOP_DOWN, 10.0, 20.0, 50.0,
                 CAMERA_TRANSITION_TYPE_SNAP);

    //Initial Camera Movement
    CutActionMoveToLocation(CUTSCENE_NUMBER, TIME_MOVE1, oPC, GetLocation(oCamera1), FALSE);
    //CutSetCamera(CUTSCENE_NUMBER, TIME_MOVE1, oPC, CAMERA_MODE_TOP_DOWN, 10.0, 10.0, 50.0,
    //             CAMERA_TRANSITION_TYPE_VERY_SLOW);

    CutSpeakStringByStrRef(CUTSCENE_NUMBER, TIME_MOVE1 + 1.5, oLich, 40528, FALSE);//Now my minions! Seize it!

    //MOBs attack the Dark Wind
    DelayCommand(TIME_MOVE1 + 5.0, AssignCommand(oWar1, ActionAttack(oWind)));
    CutSpeakStringByStrRef(CUTSCENE_NUMBER, TIME_MOVE1 + 2.5, oWar1, 40529, FALSE);//Yes, my master!

    CutSpeakStringByStrRef(CUTSCENE_NUMBER, TIME_MOVE1 + 4.5, oWar2, 40530, FALSE); //You shall be ours!
    DelayCommand(TIME_MOVE1 + 5.0, AssignCommand(oWar2, ActionAttack(oWind)));
    DelayCommand(TIME_MOVE1 + 5.0, AssignCommand(oWar3, ActionAttack(oWind)));

    //Dark Wind fights back
    CutActionCastFakeSpellAtObject(CUTSCENE_NUMBER, TIME_MOVE1 + 7.5, SPELL_CONE_OF_COLD, oWind, oWar2,
        PROJECTILE_PATH_TYPE_DEFAULT);
    //Kill off MOBs
    CutApplyEffectToObject(CUTSCENE_NUMBER, TIME_MOVE1 + 9.0, DURATION_TYPE_INSTANT, VFX_IMP_DESTRUCTION,
             oWar1, 0.0);
    CutApplyEffectToObject(CUTSCENE_NUMBER, TIME_MOVE1 + 9.0, DURATION_TYPE_INSTANT, VFX_IMP_DESTRUCTION,
             oWar2, 0.0);
    CutApplyEffectToObject(CUTSCENE_NUMBER, TIME_MOVE1 + 9.0, DURATION_TYPE_INSTANT, VFX_IMP_DESTRUCTION,
             oWar3, 0.0);
    CutDeath(CUTSCENE_NUMBER, TIME_MOVE1 + 10.0, oWar1, TRUE);
    CutDeath(CUTSCENE_NUMBER, TIME_MOVE1 + 10.0, oWar2, TRUE);
    CutDeath(CUTSCENE_NUMBER, TIME_MOVE1 + 10.0, oWar3, TRUE);

    //Lich moves in
    CutActionMoveToLocation(CUTSCENE_NUMBER, TIME_MOVE1 + 10.0, oLich, GetLocation(oLichWp1), FALSE);
    CutSpeakStringByStrRef(CUTSCENE_NUMBER, TIME_MOVE1 + 11.5, oLich, 40531, FALSE);//Fools!  Must I do everything myself?

    //2nd Camera movement
    CutActionMoveToLocation(CUTSCENE_NUMBER, TIME_MOVE1 + 9.5, oPC, GetLocation(oCamera2), FALSE);

    //Lich casts at wind..capturing it
    CutActionCastFakeSpellAtObject(CUTSCENE_NUMBER, TIME_MOVE1 + 18.0, SPELL_DAZE, oLich, oWind,
        PROJECTILE_PATH_TYPE_DEFAULT);
    CutApplyEffectToObject2(CUTSCENE_NUMBER, TIME_MOVE1 + 21.0, DURATION_TYPE_TEMPORARY, EffectBeam(VFX_BEAM_MIND, oLich, BODY_NODE_CHEST),
             oWind, 3.0);
    CutPlayAnimation(CUTSCENE_NUMBER, TIME_MOVE1 + 21.0, oLich, ANIMATION_LOOPING_CONJURE1, 5.0, FALSE);

    //Wind is pulled to the Lich
    CutActionMoveToLocation(CUTSCENE_NUMBER, TIME_MOVE1 + 21.5, oWind, GetLocation(oLich), FALSE);

    CutApplyEffectAtLocation(CUTSCENE_NUMBER, TIME_MOVE1 + 22.5, oPC, DURATION_TYPE_INSTANT, VFX_IMP_REDUCE_ABILITY_SCORE,
             GetLocation(oWind), 0.0);
    CutSpeakStringByStrRef(CUTSCENE_NUMBER, TIME_MOVE1 + 25.0, oLich, 40532, FALSE);//Your powers are mine!

    DestroyObject(oWind, TIME_MOVE1 + 25.9);

    CutApplyEffectToObject(CUTSCENE_NUMBER, TIME_MOVE1 + 24.9, DURATION_TYPE_INSTANT, VFX_IMP_DEATH,
             oLich, 0.0);
    CutApplyEffectToObject(CUTSCENE_NUMBER, TIME_MOVE1 + 24.9, DURATION_TYPE_INSTANT, VFX_DUR_MAGIC_RESISTANCE,
             oLich, 0.0);
    DelayCommand(TIME_MOVE1 + 23.5, SetLocalInt(oLich, "nCut20CaptureWind", 1));

    //3rd Camera movement
    CutActionMoveToLocation(CUTSCENE_NUMBER, TIME_MOVE1 + 10.0, oPC, GetLocation(oCamera3), FALSE);

    CutSetCamera(CUTSCENE_NUMBER, TIME_MOVE1, oPC, CAMERA_MODE_TOP_DOWN, 130.0, 15.0, 50.0,
                 CAMERA_TRANSITION_TYPE_VERY_SLOW);

    //4th Camera Movement
    CutActionMoveToLocation(CUTSCENE_NUMBER, TIME_MOVE1 + 21.9, oPC, GetLocation(oCamera4), FALSE);

    CutSetCamera(CUTSCENE_NUMBER, TIME_MOVE1 + 21.9, oPC, CAMERA_MODE_TOP_DOWN, 130.0, 10.0, 30.0,
                 CAMERA_TRANSITION_TYPE_VERY_SLOW);

   //5th Camera Movement
    CutActionMoveToLocation(CUTSCENE_NUMBER, TIME_MOVE1 + 25.9, oPC, GetLocation(oCamera5), FALSE);

    CutSetCamera(CUTSCENE_NUMBER, TIME_MOVE1 + 25.9, oPC, CAMERA_MODE_TOP_DOWN, 230.0, 10.0, 30.0,
                 CAMERA_TRANSITION_TYPE_VERY_SLOW);
    //Followers Move to Lich...
    CutActionMoveToLocation(CUTSCENE_NUMBER, TIME_MOVE1 + 24.0, oWar4, GetLocation(oMobLeft), FALSE, FALSE);
    CutActionMoveToLocation(CUTSCENE_NUMBER, TIME_MOVE1 + 25.0, oWar5, GetLocation(oLichFacer), TRUE, FALSE);
    CutActionMoveToLocation(CUTSCENE_NUMBER, TIME_MOVE1 + 26.0, oWar6, GetLocation(oLichFacer), FALSE, FALSE);
    CutActionMoveToLocation(CUTSCENE_NUMBER, TIME_MOVE1 + 25.5, oWar7, GetLocation(oMobRight), TRUE, FALSE);
    CutActionMoveToLocation(CUTSCENE_NUMBER, TIME_MOVE1 + 26.0, oWiz1, GetLocation(oMobRight), TRUE, FALSE);
    CutActionMoveToLocation(CUTSCENE_NUMBER, TIME_MOVE1 + 25.2, oArch1, GetLocation(oMobRight), FALSE, FALSE);

    CutSetFacingPoint(CUTSCENE_NUMBER, TIME_MOVE1 + 28.0, oWar4, "cut20_shadowlich");
    CutSetFacingPoint(CUTSCENE_NUMBER, TIME_MOVE1 + 28.0, oWar5, "cut20_shadowlich");
    CutSetFacingPoint(CUTSCENE_NUMBER, TIME_MOVE1 + 28.0, oWar6, "cut20_shadowlich");
    CutSetFacingPoint(CUTSCENE_NUMBER, TIME_MOVE1 + 28.0, oWar7, "cut20_shadowlich");
    CutSetFacingPoint(CUTSCENE_NUMBER, TIME_MOVE1 + 28.0, oWiz1, "cut20_shadowlich");
    CutSetFacingPoint(CUTSCENE_NUMBER, TIME_MOVE1 + 28.0, oArch1, "cut20_shadowlich");

    //Lich turns to his followers
    DelayCommand(TIME_MOVE1 + 25.0, AssignCommand(oLich, SetFacingPoint(GetPosition(oLichFacer))));
    CutPlayAnimation(CUTSCENE_NUMBER, TIME_MOVE1 + 25.5, oLich, ANIMATION_FIREFORGET_VICTORY1, 2.0, FALSE);
    CutSpeakStringByStrRef(CUTSCENE_NUMBER, TIME_MOVE1 + 27.5, oLich, 40533, FALSE); //The Dark Wind is mine!

    //Followers celebrate
    CutPlayAnimation(CUTSCENE_NUMBER, TIME_MOVE1 + 28.5, oWar4, ANIMATION_FIREFORGET_VICTORY1, 2.0, FALSE);
    CutPlayAnimation(CUTSCENE_NUMBER, TIME_MOVE1 + 28.9, oWar5, ANIMATION_FIREFORGET_VICTORY2, 2.0, FALSE);
    CutSpeakStringByStrRef(CUTSCENE_NUMBER, TIME_MOVE1 + 30.9, oWar5, 40534 , FALSE); //All power to the master!

    CutPlayAnimation(CUTSCENE_NUMBER, TIME_MOVE1 + 29.5, oWar6, ANIMATION_FIREFORGET_VICTORY2, 2.0, FALSE);
    CutPlayAnimation(CUTSCENE_NUMBER, TIME_MOVE1 + 28.5, oWar7, ANIMATION_FIREFORGET_VICTORY1, 2.0, FALSE);
    CutSpeakStringByStrRef(CUTSCENE_NUMBER, TIME_MOVE1 + 29.5, oWar7, 40535, FALSE); //Your powers shall be unequalled, your foulness!

    CutPlayAnimation(CUTSCENE_NUMBER, TIME_MOVE1 + 29.5, oWiz1, ANIMATION_FIREFORGET_VICTORY3, 2.0, FALSE);
    CutSpeakStringByStrRef(CUTSCENE_NUMBER, TIME_MOVE1 + 30.5, oWiz1, 40536, FALSE); //Your blackness, let us return to the shadow.

    CutPlayAnimation(CUTSCENE_NUMBER, TIME_MOVE1 + 28.8, oArch1, ANIMATION_FIREFORGET_VICTORY1, 2.0, FALSE);


    //Create Portal
    CutActionCastFakeSpellAtObject(CUTSCENE_NUMBER, TIME_MOVE1 + 30.0, SPELL_LESSER_SPELL_BREACH, oLich, oPortal,
        PROJECTILE_PATH_TYPE_DEFAULT);
    DelayCommand(TIME_MOVE1 + 32.0, CreatePortal(GetLocation(oPortal)));
    DelayCommand(TIME_MOVE1 + 33.0, SignalPortal());


    //Move Minions into the portal
    CutActionMoveToLocation(CUTSCENE_NUMBER, TIME_MOVE1 + 34.5, oWar4, GetLocation(oPortal), TRUE, FALSE);
    CutActionMoveToLocation(CUTSCENE_NUMBER, TIME_MOVE1 + 34.0, oWar5, GetLocation(oPortal), TRUE, FALSE);
    CutActionMoveToLocation(CUTSCENE_NUMBER, TIME_MOVE1 + 34.0, oWar6, GetLocation(oPortal), TRUE, FALSE);
    CutActionMoveToLocation(CUTSCENE_NUMBER, TIME_MOVE1 + 35.5, oWar7, GetLocation(oPortal), TRUE, FALSE);
    CutActionMoveToLocation(CUTSCENE_NUMBER, TIME_MOVE1 + 34.0, oWiz1, GetLocation(oPortal), TRUE, FALSE);
    CutActionMoveToLocation(CUTSCENE_NUMBER, TIME_MOVE1 + 35.2, oArch1, GetLocation(oPortal), TRUE, FALSE);

    DelayCommand(TIME_MOVE1 + 34.5, PortalEffect());
    DelayCommand(TIME_MOVE1 + 36.5, PortalEffect());
    DelayCommand(TIME_MOVE1 + 38.5, PortalEffect());
    DelayCommand(TIME_MOVE1 + 40.5, PortalEffect());

    DestroyObject(oWar4, TIME_MOVE1 + 36.5);
    DestroyObject(oWar5, TIME_MOVE1 + 36.0);
    DestroyObject(oWar6, TIME_MOVE1 + 36.0);
    DestroyObject(oWar7, TIME_MOVE1 + 37.5);
    DestroyObject(oWiz1, TIME_MOVE1 + 36.0);
    DestroyObject(oArch1, TIME_MOVE1 + 37.2);

    CutActionMoveToLocation(CUTSCENE_NUMBER, TIME_MOVE1 + 39.2, oLich, GetLocation(oPortal), FALSE, FALSE);
    CutSpeakStringByStrRef(CUTSCENE_NUMBER, TIME_MOVE1 + 37.5, oLich, 40537, FALSE);  //Some of you remain here... I sense another has come in search of our prize.

    //End Cutscene Here
    DelayCommand(TIME_END, ReturnPlayers());

}

void ReturnPlayers()
{
    //activate the 2 Shadovar encounters
    object oEnc1 = GetObjectByTag("w04Shadovar1");
    object oEnc2 = GetObjectByTag("w04Shadovar2");
    object oArea = GetArea(oEnc1);
    SetEncounterActive(TRUE, oEnc1);
    SetEncounterActive(TRUE, oEnc2);

    object oWar1 = GetObjectByTag("cut20ShadWarrior1");
    object oWar2 = GetObjectByTag("cut20ShadWarrior2");
    object oWar3 = GetObjectByTag("cut20ShadWarrior3");
    //Set these bodies to be destroyable
    AssignCommand(oWar1, SetIsDestroyable(TRUE));
    AssignCommand(oWar2, SetIsDestroyable(TRUE));
    AssignCommand(oWar3, SetIsDestroyable(TRUE));

    //Destroy all remaining cutscene NPCs
    object oToDestroy = GetFirstObjectInArea(oArea);
    while (oToDestroy != OBJECT_INVALID)
    {
        if (GetTag(oToDestroy) == "cut20_shadowlich")
            DestroyObject(oToDestroy, 6.0);
        else if (GetStringLeft(GetTag(oToDestroy), 3) == "cut")
            DestroyObject(oToDestroy, 2.0);
        oToDestroy = GetNextObjectInArea(oArea);
    }
    //Return ALL PCs to starting positions if they joined the cutscene

    location lMainPC = GetLocation(GetWaypointByTag("wp_cut20mainpcreturn"));
    location lPCX = GetLocation(GetWaypointByTag("wp_cut20pcxreturn"));
    //PC movement locations
    object oPlayers = GetFirstPC();
    int nCutsceneNumber = 20;
    while (oPlayers != OBJECT_INVALID)
    {
        if (GetLocalInt(oPlayers, "nCutsceneNumber") == nCutsceneNumber)
        {

            SetPlotFlag(oPlayers, FALSE);
            CutFadeOutAndIn(nCutsceneNumber, 0.0, oPlayers, FALSE);

            if (GetLocalInt(oPlayers, "bMainPC_Cut20") == 1)
            {

                CutJumpToLocation(nCutsceneNumber, 2.5, oPlayers, lMainPC, FALSE);
            }
            else
            {
                CutJumpToLocation(nCutsceneNumber, 2.5, oPlayers, lPCX, FALSE);

            }
            DelayCommand(3.0, RemoveCutInvis(oPlayers));
            CutSetCutsceneMode(nCutsceneNumber, 3.0, oPlayers, FALSE);
            DelayCommand(5.0, SetLocalInt(oPlayers, "nCutsceneNumber", 0));
        }

        oPlayers = GetNextPC();
    }
    SetLocalInt(GetModule(), "X1_CUT20RUNNING", 0);
}
void RemoveCutInvis(object oCreature)
{
    object oLich = GetObjectByTag("cut20_shadowlich");
    effect eEff1 = GetFirstEffect(oCreature);
    while(GetIsEffectValid(eEff1))
    {
        if (GetName(GetEffectCreator(eEff1)) == GetName(oLich))
        {
            RemoveEffect(oCreature, eEff1);
        }
        eEff1 = GetNextEffect(oCreature);
    }
    UnFreezeAssociate(oCreature);
}

object FreezeAssociate(object oPlayers)
{
    effect eAssociate = EffectCutsceneParalyze();
 //Cutscene Paralize any associates.
        object oHench = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPlayers);
        if (oHench != OBJECT_INVALID)
        {
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eAssociate, oHench);
        }
        object oCompanion = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPlayers);
        if (oCompanion != OBJECT_INVALID)
        {
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eAssociate, oCompanion);
        }
        object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPlayers);
        if (oFamiliar != OBJECT_INVALID)
        {
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eAssociate, oFamiliar);
        }
        object oSummon = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPlayers);
        if (oSummon != OBJECT_INVALID)
        {
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eAssociate, oSummon);
        }
        object oDominated = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oPlayers);
        if (oDominated != OBJECT_INVALID)
        {
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eAssociate, oDominated);
        }
        return oDominated;
}
void UnFreezeAssociate(object oPlayers)
{

 //Cutscene Paralize any associates.
        object oHench = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPlayers);
        if (oHench != OBJECT_INVALID)
        {
            RemoveAssociateEffects(oHench);
        }
        object oCompanion = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPlayers);
        if (oCompanion != OBJECT_INVALID)
        {
            RemoveAssociateEffects(oCompanion);
        }
        object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPlayers);
        if (oFamiliar != OBJECT_INVALID)
        {
            RemoveAssociateEffects(oFamiliar);
        }
        object oSummon = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPlayers);
        if (oSummon != OBJECT_INVALID)
        {
            RemoveAssociateEffects(oSummon);
        }
        object oDominated = GetLocalObject(oPlayers, "oDominated");
        if (oDominated != OBJECT_INVALID)
        {
            RemoveAssociateEffects(oDominated);
        }
}
void RemoveAssociateEffects(object oCreature)
{
    effect eEff1 = GetFirstEffect(oCreature);
    while(GetIsEffectValid(eEff1))
    {
        if (GetEffectType(eEff1) == EFFECT_TYPE_CUTSCENE_PARALYZE)
        {
            RemoveEffect(oCreature, eEff1);
        }
        eEff1 = GetNextEffect(oCreature);
    }
}
void ParalizeAllEnemies()
{
    object oLich = GetObjectByTag("cut20_shadowlich");
    effect eParalize = EffectCutsceneParalyze();
    int nCount = 1;
    object oCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, oLich, nCount);
    while (oCreature != OBJECT_INVALID)
    {
        //Check to see if creature is one of the hostile encounter creatures
        if (GetStringLeft(GetTag(oCreature), 9) == "TowerShad")
        {
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eParalize, oCreature);
        }
        nCount = nCount + 1;
        oCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, oLich, nCount);
    }

}
void CreatePortal(location lTarget)
{
    if (GetLocalInt(GetModule(), "X1_CUT20RUNNING") == 1)
    {
        SetLocalInt(GetArea(OBJECT_SELF), "bPortalsOn", 1);
        CreateObject(OBJECT_TYPE_PLACEABLE, "cutshadowportal", lTarget);

    }
}

void SignalPortal()
{
    SignalEvent(GetObjectByTag("cutshadowportal"), EventUserDefined(5006));

}

void PortalEffect()
{
    //effects
    effect ePortal = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_1);
    object oPortal = GetObjectByTag("cutshadowportal");
    if (GetIsObjectValid(oPortal) == TRUE)
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT, ePortal, oPortal);
    }
}
