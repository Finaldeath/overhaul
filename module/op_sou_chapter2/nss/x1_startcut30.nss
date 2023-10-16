//::///////////////////////////////////////////////
//:: Name x1_startcut30
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Final Cut Scene - Death of Heurodis
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: April 11/03
//:://////////////////////////////////////////////
#include "x1_inc_cutscene"
#include "X0_I0_SPELLS"

void StartCutscene(object oPC);
void RemoveCutInvis(object oCreature);
void ReturnPlayers();
void FreezeAssociate(object oPlayers);
void RemoveAssociateEffects(object oCreature);
void UnFreezeAssociate(object oPlayers);
float FindCamaraDirection(object oWaypoint);
void CreateShadowDoor(location lTarget);
void UseShadowDoor();
void Tremor(object oPC);
void SetPCSDoneXP1();
void FadeAllPCs();
void ClearAOE(object oHeurodis);

void main()
{
    //Need to find out which PC triggered the cutscene
    //GetLocalInt(oPC, "X1_Cut30KilledHeurodis") == 1) is the PC that killed Heurodis.
    //This will be the Main PC unless someone else possesses the portable door (PortableDoor)
    object oPC;
    object oPosFamiliar;
    object oKiller = GetFirstPC();
    while (oKiller != OBJECT_INVALID)
    {
        if (GetLocalInt(oKiller, "X1_Cut30KilledHeurodis") == 1)
            oPC = oKiller;
        oPosFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oKiller);
        if (GetIsObjectValid(oPosFamiliar) == TRUE)
        {
            //Make sure all PCs are back in their own bodies
            if (GetIsPossessedFamiliar(oPosFamiliar) == TRUE)
                UnpossessFamiliar(oPosFamiliar);
        }
        oKiller = GetNextPC();
    }

    object oDoorPC = GetItemPossessor(GetObjectByTag("PortableDoor"));
    if (GetIsObjectValid(oDoorPC) == TRUE)
    {
        //if this PC is in the same area - then they can be the cutscene PC
        if (GetIsPC(oPC) == TRUE && GetTag(GetArea(oDoorPC)) == "Winds_04")
            oPC = oDoorPC;
    }

    SetLocalInt(GetModule(), "X1_CUT30RUNNING", 1);
    int CUTSCENE_NUMBER = 30;
    //Jump MultiPlayerPCs to their station..

    location lPCXStation = GetLocation(GetWaypointByTag("wp_cut30_pcx_1"));
    object oPCXCameraInit = GetObjectByTag("Heurodis");
    location lPCXEnd = GetLocation(GetWaypointByTag("wp_cut30_shadowdoor_2"));
    object oPlayers = GetFirstPC();
    while (oPlayers != OBJECT_INVALID)
    {
        FreezeAssociate(oPlayers);

        //if this isn't the PC who started the cutscene.
        if (GetName(oPlayers) != GetName(oPC))
        {

            //If they are in Same area
            if (GetTag(GetArea(oPlayers)) == "Winds_04")
            {
                SetLocalInt(oPlayers, "nCutsceneNumber", CUTSCENE_NUMBER);
                CutSetCutsceneMode(CUTSCENE_NUMBER, 0.0, oPlayers, TRUE, FALSE, TRUE);
                //CutSetLocation(CUTSCENE_NUMBER, 0.0, oPlayers);
                CutFadeOutAndIn(CUTSCENE_NUMBER, 0.0, oPlayers);
                // Set them as immortal for the cutscene..
                SetImmortal(oPlayers, TRUE);
                DelayCommand(4.0, AssignCommand(oPlayers, ActionMoveToLocation(lPCXStation)));
                DelayCommand(4.0, AssignCommand(oPlayers, SetCameraFacing(FindCamaraDirection(oPCXCameraInit), 10.0, 50.0, CAMERA_TRANSITION_TYPE_VERY_SLOW)));
                DelayCommand(45.0, AssignCommand(oPlayers, ActionMoveToLocation(lPCXEnd)));
            }
            else
            {
                SetLocalInt(oPlayers, "nCutsceneNumber", CUTSCENE_NUMBER);
                AssignCommand(oPlayers, JumpToLocation(lPCXStation));
                CutSetCutsceneMode(CUTSCENE_NUMBER, 0.0, oPlayers, TRUE, FALSE, TRUE);
                CutFadeOutAndIn(CUTSCENE_NUMBER, 0.0, oPlayers);
                //CutSetLocation(CUTSCENE_NUMBER, 0.0, oPlayers);
                //CutFadeOutAndIn(CUTSCENE_NUMBER, 0.0, oPlayers);
                // Set them as immortal for the cutscene..
                SetImmortal(oPlayers, TRUE);
                DelayCommand(4.0, AssignCommand(oPlayers, ActionMoveToLocation(lPCXStation)));
                DelayCommand(4.0, AssignCommand(oPlayers, SetCameraFacing(FindCamaraDirection(oPCXCameraInit), 10.0, 50.0, CAMERA_TRANSITION_TYPE_VERY_SLOW)));
                DelayCommand(45.0, AssignCommand(oPlayers, ActionMoveToLocation(lPCXEnd)));

            }

        }

        oPlayers = GetNextPC();
    }
    FadeToBlack(oPC);
    DelayCommand(3.0, StartCutscene(oPC));
}

void StartCutscene(object oPC)
{
    int CUTSCENE_NUMBER = 30;
    float fTimer = 0.0;


    //Flag the player as being in Cutscene 11
    SetLocalInt(oPC, "nCutsceneNumber", CUTSCENE_NUMBER);

    // Set them as immortal for the cutscene..
    SetImmortal(oPC, TRUE);

    CutSetCutsceneMode(CUTSCENE_NUMBER, 0.0, oPC, TRUE, FALSE, TRUE);

    //Create a clone of the player.
    location lPCSpawn = GetLocation(oPC);
    object oClone = CopyObject(oPC, lPCSpawn, OBJECT_INVALID, "Cut30_Clone");
    // Set them as immortal for the cutscene..
    SetImmortal(oClone, TRUE);
    //Cutscene Creatures/Objects
    object oHeurodis = GetObjectByTag("Heurodis");
    ClearAOE(oHeurodis);
    //Have Heurodis scream
    //PlayVoiceChat(VOICE_CHAT_DEATH, oHeurodis);
    object oArea = GetArea(oPC);

    //VFX locations
    float fFacing = 90.0;
    vector vPoint;
    vector vPC = GetPosition(oHeurodis);
    vPoint = Vector((cos(fFacing) * 2.0) + vPC.x, (sin(fFacing) * 2.0) + vPC.y, vPC.z);
    location lPoint1 = Location(GetArea(oPC), vPoint, 0.0);
    fFacing = 180.0;
    vPoint = Vector((cos(fFacing) * 2.0) + vPC.x, (sin(fFacing) * 2.0) + vPC.y, vPC.z);
    location lPoint2 = Location(GetArea(oPC), vPoint, 0.0);
    fFacing = 270.0;
    vPoint = Vector((cos(fFacing) * 2.0) + vPC.x, (sin(fFacing) * 2.0) + vPC.y, vPC.z);
    location lPoint3 = Location(GetArea(oPC), vPoint, 0.0);
    fFacing = 1.0;
    vPoint = Vector((cos(fFacing) * 2.0) + vPC.x, (sin(fFacing) * 2.0) + vPC.y, vPC.z);
    location lPoint4 = Location(GetArea(oPC), vPoint, 0.0);

    //Camera waypoints
    object oCameraInit = GetNearestObjectByTag("wp_cut30_camera_init", oPC);
    object oCameraDoor = GetObjectByTag("wp_cut30_camera_door");
    object oCameraStairs = GetWaypointByTag("wp_cut30_camera_stairs");
    object oCloneStairs = GetWaypointByTag("wp_cut30_clone_stairs");

    location lHeurodis = GetLocation(oHeurodis);
    float fCameraInit = GetFacingFromLocation(lHeurodis) + 180.0;

    //Creature Movement Waypoints
    object oShadowDoorWP = GetWaypointByTag("wp_cut30_shadowdoor_1");
    object oShadowDoorSpn = GetWaypointByTag("wp_cut30_shadowdoor_2");
    object oShadowDoorCloneWP = GetWaypointByTag("wp_cut30_shadowdoor_3");
    //Start the cutscene - fade in and out, apply effects to pc
    CutSetLocation(CUTSCENE_NUMBER, fTimer + 3.0, oPC);
    CutFadeFromBlack(CUTSCENE_NUMBER, fTimer + 2.0, oPC);

    CutApplyEffectToObject(CUTSCENE_NUMBER, fTimer, DURATION_TYPE_PERMANENT, VFX_DUR_CUTSCENE_INVISIBILITY,
                           oPC, 9999.0);
    CutJumpToLocation(CUTSCENE_NUMBER, fTimer + 1.0, oPC, GetLocation(oCameraInit));
    CutSetCamera(CUTSCENE_NUMBER, fTimer + 2.0, oPC, CAMERA_MODE_TOP_DOWN, fCameraInit, 20.0, 50.0,
                 CAMERA_TRANSITION_TYPE_SNAP);

    //Initial Camera Movement
    CutActionMoveToLocation(CUTSCENE_NUMBER, fTimer + 2.0, oPC, lHeurodis, FALSE);
    CutSetCamera(CUTSCENE_NUMBER, fTimer + 2.0, oPC, CAMERA_MODE_TOP_DOWN, FindCamaraDirection(oCameraInit), 10.0, 50.0,
                 CAMERA_TRANSITION_TYPE_VERY_SLOW);

    CutApplyEffectToObject(CUTSCENE_NUMBER, fTimer + 5.0, DURATION_TYPE_INSTANT, VFX_IMP_RAISE_DEAD, oHeurodis, 0.0, FALSE);

    CutApplyEffectAtLocation(CUTSCENE_NUMBER, fTimer + 8.0, oPC, DURATION_TYPE_INSTANT, VFX_FNF_SMOKE_PUFF, lPoint1, 2.0);
    CutApplyEffectAtLocation(CUTSCENE_NUMBER, fTimer + 8.0, oPC, DURATION_TYPE_INSTANT, VFX_FNF_SMOKE_PUFF, lPoint2, 2.0);
    CutApplyEffectAtLocation(CUTSCENE_NUMBER, fTimer + 8.0, oPC, DURATION_TYPE_INSTANT, VFX_FNF_SMOKE_PUFF, lPoint3, 2.0);
    CutApplyEffectAtLocation(CUTSCENE_NUMBER, fTimer + 8.0, oPC, DURATION_TYPE_INSTANT, VFX_FNF_SMOKE_PUFF, lPoint4, 2.0);

    CutApplyEffectAtLocation(CUTSCENE_NUMBER, fTimer + 11.0, oPC, DURATION_TYPE_INSTANT, VFX_FNF_PWKILL, lPoint1, 3.0);
    CutApplyEffectAtLocation(CUTSCENE_NUMBER, fTimer + 11.0, oPC, DURATION_TYPE_INSTANT, VFX_FNF_PWKILL, lPoint2, 3.0);
    CutApplyEffectAtLocation(CUTSCENE_NUMBER, fTimer + 11.0, oPC, DURATION_TYPE_INSTANT, VFX_FNF_PWKILL, lPoint3, 3.0);
    CutApplyEffectAtLocation(CUTSCENE_NUMBER, fTimer + 11.0, oPC, DURATION_TYPE_INSTANT, VFX_FNF_PWKILL, lPoint4, 3.0);

    CutApplyEffectAtLocation(CUTSCENE_NUMBER, fTimer + 11.0, oPC, DURATION_TYPE_INSTANT, VFX_IMP_DEATH, lHeurodis, 0.0, FALSE);
    DelayCommand(fTimer + 9.0, AssignCommand(oHeurodis, SetIsDestroyable(TRUE)));
    DelayCommand(fTimer + 13.5, DestroyObject(oHeurodis));


    CutApplyEffectAtLocation(CUTSCENE_NUMBER, fTimer + 14.0, oPC, DURATION_TYPE_INSTANT, VFX_IMP_SUNSTRIKE, lPoint1, 2.0);
    CutApplyEffectAtLocation(CUTSCENE_NUMBER, fTimer + 14.0, oPC, DURATION_TYPE_INSTANT, VFX_IMP_SUNSTRIKE, lPoint2, 2.0);
    CutApplyEffectAtLocation(CUTSCENE_NUMBER, fTimer + 14.0, oPC, DURATION_TYPE_INSTANT, VFX_IMP_SUNSTRIKE, lPoint3, 2.0);
    CutApplyEffectAtLocation(CUTSCENE_NUMBER, fTimer + 14.0, oPC, DURATION_TYPE_INSTANT, VFX_IMP_SUNSTRIKE, lPoint4, 2.0);

    fTimer = fTimer + 5.0;
    CutPlayAnimation(CUTSCENE_NUMBER, fTimer, oClone, ANIMATION_FIREFORGET_VICTORY1, 2.0);
    CutPlayAnimation(CUTSCENE_NUMBER, fTimer + 3.0, oClone, ANIMATION_FIREFORGET_VICTORY2, 2.0);

    //2nd Camera movement
    //CutActionMoveToLocation(CUTSCENE_NUMBER, TIME_MOVE1 + 9.5, oPC, GetLocation(oCamera2), FALSE);

    CutSetCamera(CUTSCENE_NUMBER, fTimer + 3.5, oPC, CAMERA_MODE_TOP_DOWN, FindCamaraDirection(oCameraInit) + 100.0, 15.0, 50.0,
                 CAMERA_TRANSITION_TYPE_VERY_SLOW);

    CutPlayAnimation(CUTSCENE_NUMBER, fTimer + 6.0, oClone, ANIMATION_FIREFORGET_VICTORY3, 2.0);

    //3rd Camera movement
    CutSetCamera(CUTSCENE_NUMBER, fTimer + 8.5, oPC, CAMERA_MODE_TOP_DOWN, FindCamaraDirection(oCameraInit) + 200.0, 15.0, 50.0,
                 CAMERA_TRANSITION_TYPE_VERY_SLOW);

    fTimer = fTimer + 9.0;
    CutPlayAnimation(CUTSCENE_NUMBER, fTimer, oClone, ANIMATION_FIREFORGET_VICTORY3, 2.0);
    CutPlayAnimation(CUTSCENE_NUMBER, fTimer + 2.0, oClone, ANIMATION_FIREFORGET_HEAD_TURN_LEFT, 2.0);
    CutPlayAnimation(CUTSCENE_NUMBER, fTimer + 4.0, oClone, ANIMATION_FIREFORGET_HEAD_TURN_RIGHT, 2.0);
    fTimer = fTimer + 6.0;
    /*
    //4th Camera movement (run for the exit but get stopped by a tremor
    CutActionMoveToLocation(CUTSCENE_NUMBER, fTimer, oPC, GetLocation(oCameraStairs), FALSE);
    CutSetCamera(CUTSCENE_NUMBER, fTimer, oPC, CAMERA_MODE_TOP_DOWN, 270.0, 15.0, 50.0,
                 CAMERA_TRANSITION_TYPE_SLOW);
    CutActionMoveToLocation(CUTSCENE_NUMBER, fTimer, oClone, GetLocation(oCloneStairs), TRUE, FALSE);
    fTimer = fTimer + 6.0;
    //Play the first tremor.
    DelayCommand(fTimer, Tremor(oClone));
    //PC looks around
    CutPlayAnimation(CUTSCENE_NUMBER, fTimer, oClone, ANIMATION_LOOPING_SPASM, 2.0);
    CutPlayAnimation(CUTSCENE_NUMBER, fTimer + 3.0, oClone, ANIMATION_LOOPING_LOOK_FAR, 2.0);;

    fTimer = fTimer + 5.5;
    //5th Camera movement
    */
    CutActionMoveToLocation(CUTSCENE_NUMBER, fTimer, oPC, GetLocation(oCameraDoor), FALSE);
    CutSetCamera(CUTSCENE_NUMBER, fTimer, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 15.0, 50.0,
                 CAMERA_TRANSITION_TYPE_SLOW);

    CutActionMoveToLocation(CUTSCENE_NUMBER, fTimer, oClone, GetLocation(oShadowDoorWP), TRUE, FALSE);
    CutSetFacingPoint(CUTSCENE_NUMBER, fTimer + 3.8, oClone, "wp_cut30_shadowdoor_2", FALSE);
    CutPlayAnimation(CUTSCENE_NUMBER, fTimer + 4.0, oClone, ANIMATION_LOOPING_CONJURE1, 5.0);
    fTimer = fTimer + 5.0;
    DelayCommand(fTimer, CreateShadowDoor(GetLocation(oShadowDoorSpn)));
    fTimer = fTimer + 6.0;
    CutActionMoveToLocation(CUTSCENE_NUMBER, fTimer, oClone, GetLocation(oShadowDoorCloneWP), TRUE, FALSE);
    DelayCommand(fTimer+3.0, UseShadowDoor());
    fTimer = fTimer + 6.0;


    //End Cutscene Here
    //End module on a brief delay.
    SetPCSDoneXP1();

    DelayCommand(fTimer, FadeAllPCs());
    AssignCommand(oArea, DelayCommand(fTimer, ExportAllCharacters()));
    AssignCommand(oArea, DelayCommand(fTimer +6.0, EndGame("XP1_Closing")));

}

void ReturnPlayers()
{
    //Return ALL PCs to starting positions if they joined the cutscene

    location lMainPC = GetLocation(GetWaypointByTag("wp_cut30mainpcreturn"));
    location lPCX = GetLocation(GetWaypointByTag("wp_cut30pcxreturn"));
    //PC movement locations
    object oPlayers = GetFirstPC();
    int nCutsceneNumber = 20;
    while (oPlayers != OBJECT_INVALID)
    {
        if (GetLocalInt(oPlayers, "nCutsceneNumber") == nCutsceneNumber)
        {

            //AssignCommand(oPlayers, ClearAllActions());
            CutFadeOutAndIn(nCutsceneNumber, 0.0, oPlayers, FALSE);

            if (GetLocalInt(oPlayers, "bMainPC_Cut30") == 1)
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
    SetLocalInt(GetModule(), "X1_CUT30RUNNING", 0);
}
void RemoveCutInvis(object oCreature)
{
    object oPC = OBJECT_SELF;
    effect eEff1 = GetFirstEffect(oCreature);
    while(GetIsEffectValid(eEff1))
    {
        if (GetName(GetEffectCreator(eEff1)) == GetName(oPC))
        {
            RemoveEffect(oCreature, eEff1);
        }
        eEff1 = GetNextEffect(oCreature);
    }
    UnFreezeAssociate(oCreature);
}

void FreezeAssociate(object oPlayers)
{
    effect eAssociate = EffectCutsceneParalyze();
 //Cutscene Paralize any associates.
        object oHench = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPlayers);
        if (oHench != OBJECT_INVALID)
        {
            SetImmortal(oHench, TRUE);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eAssociate, oHench);
        }
        object oCompanion = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPlayers);
        if (oCompanion != OBJECT_INVALID)
        {
            SetImmortal(oCompanion, TRUE);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eAssociate, oCompanion);
        }
        object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPlayers);
        if (oFamiliar != OBJECT_INVALID)
        {
            SetImmortal(oFamiliar, TRUE);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eAssociate, oFamiliar);
        }
        object oSummon = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPlayers);
        if (oSummon != OBJECT_INVALID)
        {
            SetImmortal(oSummon, TRUE);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eAssociate, oSummon);
        }
        object oDominated = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oPlayers);
        if (oDominated != OBJECT_INVALID)
        {
            SetImmortal(oDominated, TRUE);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eAssociate, oDominated);
        }
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
        object oDominated = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oPlayers);
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

float FindCamaraDirection(object oWaypoint)
{
    object oHeurodis = GetObjectByTag("Heurodis");

    float fFacing = 0.0;

    //originating vector
    vector vOriginate = GetPosition(oWaypoint);
    vector vTarget = GetPosition(oHeurodis);
    fFacing = atan((vTarget.y - vOriginate.y)/(vTarget.x - vOriginate.x));

    return fFacing;

}


void CreateShadowDoor(location lTarget)
{
    //Create door placeable.
    object oDoor = CreateObject(OBJECT_TYPE_PLACEABLE, "pl_portabledoor", lTarget, FALSE, "cut30door");

    //Apply shadow VFX
    effect eVFX = EffectVisualEffect(VFX_DUR_PROT_SHADOW_ARMOR);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, oDoor);
}

void UseShadowDoor()
{
    object oDoor = GetObjectByTag("cut30door");
    AssignCommand(oDoor, PlayAnimation(ANIMATION_PLACEABLE_OPEN));

}
void Tremor(object oPC)
{

    int iDelay;
    float fDelay;
    int iMaxIterations;
    int iCurrentIteration;
    int iMaxRubble;
    int iCurrentRubble;
    location lPC = GetLocation(oPC);
    vector vPC = GetPositionFromLocation(lPC);
    int iOffset_X;
    int iOffset_Y;
    float fOffset_X;
    float fOffset_Y;
    vector vOffset;
    location lOffset;
    effect eDebris = EffectVisualEffect(353);
    effect eShake = EffectVisualEffect(356);
    int iSoundDelay;
    float fSoundDelay;
    int iSoundType;
    string sSoundResRef = "Null ResRef";
    object oNearestPC;
    int iNearestPC;

    fDelay = 0.1;
    //Determine the length of the tremor (# of iterations)
    iMaxIterations = Random(6);
    iCurrentIteration = 0;
    while (iCurrentIteration < iMaxIterations)
    {
        //Determine the number of rubble points on this iteration.
        iMaxRubble = Random(6);
        iCurrentRubble = 0;
        while (iCurrentRubble < iMaxRubble)
        {
            //Determine the offset values for this rubble point.
            iOffset_X = Random(30)-15;
            iOffset_Y = Random(30)-15;
            fOffset_X = IntToFloat(iOffset_X);
            fOffset_Y = IntToFloat(iOffset_Y);
            vOffset = Vector(vPC.x + fOffset_X, vPC.y + fOffset_Y, vPC.z + 15.0);
            lOffset = Location(GetArea(oPC), vOffset, 0.0);

            //Apply the Debris effect to the rubble point.
            DelayCommand(fDelay, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eDebris, lOffset));

            //Update loop variables
            iCurrentRubble++;
        }

        //Determine which sound to play on this iteration.
        iSoundType = Random(35)+1;
        switch (iSoundType)
        {
            case 1: //Beam Creak 1
                sSoundResRef = "as_cv_beamcreak1";
                break;
            case 2: //Beam Creak 2
                sSoundResRef = "as_cv_beamcreak2";
                break;
            case 3: //Beam Creak 3
                sSoundResRef = "as_cv_beamcreak3";
                break;
            case 4: //Beam Creak 4
                sSoundResRef = "as_cv_beamcreak4";
                break;
            case 5: //Building Crumble 1
                sSoundResRef = "as_cv_bldgcrumb1";
                break;
            case 6: //Building Crumble 2
                sSoundResRef = "as_cv_bldgcrumb2";
                break;
            case 7: //Building Crumble 3
                sSoundResRef = "as_cv_bldgcrumb3";
                break;
            case 8: //Boiler Groan 1
                sSoundResRef = "as_cv_boilergrn1";
                break;
            case 9: //Boiler Groan 2
                sSoundResRef = "as_cv_boilergrn2";
                break;
            case 10: //Distant Boom 1
                sSoundResRef = "as_cv_boomdist1";
                break;
            case 11: //Distant Boom 2
                sSoundResRef = "as_cv_boomdist2";
                break;
            case 12: //Crank
                sSoundResRef = "as_cv_crank1";
                break;
            case 13: //Pipe Groan 1
                sSoundResRef = "as_cv_pipegroan1";
                break;
            case 14: //Pipe Groan 2
                sSoundResRef = "as_cv_pipegroan2";
                break;
            case 15: //Pipe Groan 3
                sSoundResRef = "as_cv_pipegroan3";
                break;
            case 16: //Pipe Groan 4
                sSoundResRef = "as_cv_pipegroan4";
                break;
            case 17: //Ship Hull 1
                sSoundResRef = "as_cv_shiphull1";
                break;
            case 18: //Ship Hull 2
                sSoundResRef = "as_cv_shiphull2";
                break;
            case 19: //Large Cave Rockfall
                sSoundResRef = "as_cv_rockcavlg1";
                break;
            case 20: //Small Cave Rockfall 1
                sSoundResRef = "as_cv_rockcavsm1";
                break;
            case 21: //Small Cave Rockfall 2
                sSoundResRef = "as_cv_rockcavsm2";
                break;
            case 22: //Large Rockfall 1a
                sSoundResRef = "as_cv_rockfalgl1";
                break;
            case 23: //Large Rockfall 2a
                sSoundResRef = "as_cv_rockfalgl2";
                break;
            case 24: //Large Rockfall 1b
                sSoundResRef = "as_cv_rockfallg1";
                break;
            case 25: //Large Rockfall 2b
                sSoundResRef = "as_cv_rockfallg2";
                break;
            case 26: //Small Rockfall 1
                sSoundResRef = "as_cv_rockfalsm1";
                break;
            case 27: //Small Rockfall 2
                sSoundResRef = "as_cv_rockfalsm2";
                break;
            case 28: //Small Rockfall 3
                sSoundResRef = "as_cv_rockfalsm3";
                break;
            case 29: //Small Rockfall 4
                sSoundResRef = "as_cv_rockfalsm4";
                break;
            //Any additional cases = no SFX.
        }


        //Play the sound.
        AssignCommand(oPC, DelayCommand(fDelay, PlaySound(sSoundResRef)));
        //Play the screen shake for all players in the area
        iNearestPC = 1;
        oNearestPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, iNearestPC);
        while (oNearestPC != OBJECT_INVALID)
        {
            DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eShake, oNearestPC));

            //Update loop variables
            iNearestPC++;
            oNearestPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, iNearestPC);
        }

        //Increment the delay for the next iteration.
        fDelay = fDelay + 2.0;

        //Update loop variables.
        iCurrentIteration++;
    }


}
void SetPCSDoneXP1()
{
    string szPlayerName;
    string szCharacterName;
    object oPC = GetFirstPC();
    while (oPC != OBJECT_INVALID)
    {
        szPlayerName = GetPCPlayerName(oPC);
        szCharacterName = GetName(oPC);
        SetCampaignInt(szPlayerName + szCharacterName, "Completed", 1);

        oPC = GetNextPC();
    }
}

void FadeAllPCs()
{
    object oPC = GetFirstPC();
    while (oPC != OBJECT_INVALID)
    {
        FadeToBlack(oPC, FADE_SPEED_SLOW);
        oPC = GetNextPC();
    }
}

void ClearAOE(object oHeurodis)
{
    //Get the spell target location as opposed to the spell target.
    location lTarget = GetLocation(oHeurodis);

    //Declare the spell shape, size and the location.  Capture the first target object in the shape.
    object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_COLOSSAL, lTarget, FALSE, OBJECT_TYPE_AREA_OF_EFFECT);


    //Cycle through the targets within the spell shape until an invalid object is captured.
    while (GetIsObjectValid(oTarget))
    {
        if (GetObjectType(oTarget) == OBJECT_TYPE_AREA_OF_EFFECT)
        {
            DestroyObject(oTarget);
        }

       //Select the next target within the spell shape.
       oTarget = GetNextObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_HUGE, lTarget, TRUE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE |OBJECT_TYPE_AREA_OF_EFFECT);
    }
}



