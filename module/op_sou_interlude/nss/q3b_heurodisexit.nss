/* Heurodis cutscene trigger: (NOTICE - can be triggered during combat
   - Activate portal effects
   - set plot flag for player.
   - Snap camera to heurodis
   - Show heurodis running to the portal
   - Teleport Heurodis.
   - Deactivate portal effects
*/

#include "nw_i0_plot"
#include "x1_inc_cutscene"

int CUTSCENE_NUMBER = 5;
float TIME_START = 1.0;
float TIME_SETUP = TIME_START + 1.0;
float TIME_CAMERA1 = TIME_SETUP + 2.0;
float TIME_CAMERA2 = TIME_CAMERA1 + 2.0;
float TIME_PORTAL_CAMERA = TIME_CAMERA2 + 2.0;
float TIME_RUN = TIME_PORTAL_CAMERA + 4.0;
float TIME_TELEPORT = TIME_RUN + 3.5;
float TIME_DEACTIVATE = TIME_TELEPORT + 2.0;
float TIME_END = TIME_DEACTIVATE + 4.0;

object oNewPC;

void StartCutscene(object oPC);
//void CreatePCCopy(object oPC, location lLoc);
void DestroyPCCopy();
void DeactivatePortal();
void RemoveEffects2(object oObject);
void FreezeAll(object oPC);

void main()
{
    object oPC = GetLocalObject(OBJECT_SELF, "Q3B_CUTSCENE5_PC");
    StartCutscene(oPC);
}

void StartCutscene(object oPC)
{
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);
    MusicBackgroundStop(GetArea(OBJECT_SELF));
    MusicBackgroundChangeNight(GetArea(OBJECT_SELF), 28);
    MusicBackgroundChangeDay(GetArea(OBJECT_SELF), 28);
    MusicBackgroundPlay(GetArea(OBJECT_SELF));
    DelayCommand(TIME_END + 10.0, MusicBackgroundChangeNight(GetArea(OBJECT_SELF), 8));
    DelayCommand(TIME_END + 10.0, MusicBackgroundChangeDay(GetArea(OBJECT_SELF), 8));
    // need to know from which gate the player entered so the cameras would be set up correctly
    string sGateTag = GetLocalString(GetArea(OBJECT_SELF), "Q3B_GATE_OPENED");
    int bRight;
    if(GetStringRight(sGateTag, 1) == "1")
        bRight = TRUE;
    else
        bRight = FALSE;


    object oHeurodis = GetNearestObjectByTag("Q3B_HOODED_FIGURE");
    //object oPortal = GetWaypointByTag("Q3B_WP_SAND_PORTAL");
    object oPortal = GetNearestObjectByTag("Q3B_SAND_PORTAL", oPC);
    object oWP;
    float fFace;
    float fFaceMiddle;
    if(bRight == TRUE)
    {
        oWP = GetWaypointByTag("Q3B_WP_HOODED_SP2");
        fFace = 140.0;
        fFaceMiddle = 120.0;
    }
    else
    {
        oWP = GetWaypointByTag("Q3B_WP_HOODED_SP1");
        fFace = 40.0;
        fFaceMiddle = 60.0;
    }
    object oCameraWP = GetWaypointByTag("Q3B_WP_CAMERA_LAST");
    SetLocalInt(oHeurodis, "nCutsceneNumber", CUTSCENE_NUMBER);
    object oSlaad = GetNearestObjectByTag("NW_SLAADGRAY");
    object oCamera1 = GetNearestObjectByTag("Q3B_WP_CAMERA1");
    object oCamera2 = GetNearestObjectByTag("Q3B_WP_CAMERA2");


    AssignCommand(oPC, ClearAllActions());
    FreezeAll(oPC);

    SetLocalInt(oPC, "nCutsceneNumber", CUTSCENE_NUMBER);
    SetLocalInt(oPC, "nCUT5MAINPC", 1);
    SetLocalInt(GetModule(), "X1_CUT5RUNNING", 1);
    object oPlayer = GetFirstPC();
    while(oPlayer != OBJECT_INVALID)
    {
        CutSetCutsceneMode(CUTSCENE_NUMBER, TIME_START, oPlayer, TRUE, TRUE, TRUE);
        //FreezeAssociate(oPlayer);
        CutFadeOutAndIn(CUTSCENE_NUMBER, TIME_START, oPlayer);
        oPlayer = GetNextPC();
    }

    CutSetLocation(CUTSCENE_NUMBER, TIME_START, oPC);
    CutJumpToObject(CUTSCENE_NUMBER, TIME_SETUP, oHeurodis, oWP);
    // make the player a camera exactly where he is standing (camera 1)
    //CutFadeOutAndIn(CUTSCENE_NUMBER, TIME_START, oPC);
    //DelayCommand(TIME_SETUP, CreatePCCopy(oPC, GetLocation(oCamera1)));

    CutApplyEffectToObject(CUTSCENE_NUMBER, TIME_SETUP, DURATION_TYPE_PERMANENT, VFX_DUR_CUTSCENE_INVISIBILITY,
                           oPC, 9999.0);
    CutActionMoveToLocation(CUTSCENE_NUMBER, TIME_SETUP, oPC, GetLocation(oCamera1), TRUE);
    CutSetCamera(CUTSCENE_NUMBER, TIME_SETUP, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 13.0, 50.0,
                 CAMERA_TRANSITION_TYPE_SNAP);

    // Start moving the player towards camera2 while slowly zooming out
    CutActionMoveToLocation(CUTSCENE_NUMBER, TIME_CAMERA1, oPC, GetLocation(oCamera2), FALSE);
    CutSetCamera(CUTSCENE_NUMBER, TIME_CAMERA1, oPC, CAMERA_MODE_TOP_DOWN, fFaceMiddle, 30.0, 50.0,
                 CAMERA_TRANSITION_TYPE_VERY_SLOW);


    // Start moving the player towards the portal while slowly zooming out, and changing facing of camera
    // to face Heurodis
    CutActionMoveToLocation(CUTSCENE_NUMBER, TIME_CAMERA2, oPC, GetLocation(oPortal), FALSE);
    CutSetCamera(CUTSCENE_NUMBER, TIME_CAMERA2 - 1.0, oPC, CAMERA_MODE_TOP_DOWN, fFace, 50.0, 50.0,
                 CAMERA_TRANSITION_TYPE_VERY_SLOW);


    // Show Heurodis run and escape
    CutActionMoveToObject(CUTSCENE_NUMBER, TIME_RUN, oHeurodis, oPortal, TRUE);
    CutSetCamera(CUTSCENE_NUMBER, TIME_RUN + 1.0, oPC, CAMERA_MODE_TOP_DOWN, fFace, 50.0, 30.0,
                 CAMERA_TRANSITION_TYPE_SLOW);
    CutApplyEffectAtLocation(CUTSCENE_NUMBER, TIME_TELEPORT, oPC, DURATION_TYPE_INSTANT, VFX_FNF_DISPEL_DISJUNCTION, GetLocation(oPortal), 0.0);
    DelayCommand(TIME_TELEPORT - 1.0, SetPlotFlag(oHeurodis, FALSE));
    DelayCommand(TIME_TELEPORT, DestroyObject(oHeurodis));
    DelayCommand(TIME_DEACTIVATE, DeactivatePortal());
    DestroyObject(oPortal, TIME_DEACTIVATE);
    CutRestoreLocation(CUTSCENE_NUMBER, TIME_END, oPC);
    CutRemoveEffects(CUTSCENE_NUMBER, TIME_END, oPC);
    //CutDestroyObject(CUTSCENE_NUMBER, TIME_END, oNewPC);
    //DelayCommand(TIME_END - 2.0, DestroyPCCopy());
    CutSetCutsceneMode(CUTSCENE_NUMBER, TIME_END, oPC, FALSE);
    DelayCommand(TIME_END + 6.0, SetLocalInt(GetModule(), "Q3B_HUERODIS_LEFT_THE_BUILDING", 1));
    //DelayCommand(TIME_END - 5.0, AssignCommand(oSlaad, PlayVoiceChat(VOICE_CHAT_BATTLECRY1)));
    DelayCommand(TIME_END + 1.0, SignalEvent(GetArea(OBJECT_SELF), EventUserDefined(101)));
}

void CreatePCCopy(object oPC, location lLoc)
{
    oNewPC = CopyObject(oPC, lLoc);
    SetPlotFlag(oNewPC, TRUE);
    SetLocalInt(oNewPC, "nCutsceneNumber", CUTSCENE_NUMBER);
    SetLocalObject(GetModule(), "Q3B_PC_COPY5", oNewPC);
}

void DestroyPCCopy()
{
    object oCopy = GetLocalObject(GetModule(), "Q3B_PC_COPY5");
    SetPlotFlag(oCopy, FALSE);
    DestroyObject(oCopy);
}

void DeactivatePortal()
{
        int i;
        object oObelisk;
        object oTarget;
        float fDelay = 0.0;
        object oPortalSound = GetNearestObjectByTag("Q3B_SOUND_PORTAL");
        SoundObjectStop(oPortalSound);
        effect eVis = EffectVisualEffect(VFX_IMP_LIGHTNING_M);
        for(i = 1; i <=6; i++)
        {
            fDelay += 1.0;
            oObelisk = GetNearestObjectByTag("Q3B_PORTAL_PILLAR" + IntToString(i));
            oTarget = GetNearestObjectByTag("Q3B_INV_PORTAL", oObelisk);
            DelayCommand(fDelay, RemoveEffects2(oObelisk));
            DelayCommand(fDelay, RemoveEffects2(oTarget));
            DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oObelisk));
            PlaySound("sce_negative");
        }
}


void RemoveEffects2(object oObject)
{
    effect eEff = GetFirstEffect(oObject);
    while(GetIsEffectValid(eEff))
    {
        RemoveEffect(oObject, eEff);
        eEff = GetNextEffect(oObject);
    }
}

void FreezeAll(object oPC)
{
    int n = 1;
    float fDistance;
    effect eHold = EffectCutsceneParalyze();
    object oCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, oPC, n);
    while (oCreature != OBJECT_INVALID)
    {
        if(oCreature != oPC && GetTag(oCreature) != "Q3B_HOODED_FIGURE")
        {
            fDistance = GetDistanceBetween(oPC, oCreature);
            if(fDistance > 60.0)
                return;
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eHold, oCreature, TIME_END);

        }
        oCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, oPC, n);
        n++;
    }
}


