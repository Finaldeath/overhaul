//::///////////////////////////////////////////////
//:: Name hx_gwall_explode
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will start the cutscene where the devil
     comes flying through the wall.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Aug 28, 2003
//:://////////////////////////////////////////////
#include "x2_inc_cutscene"
void DoExplodeWall(object oPC);
void StartCutscene(object oPC, int iCut);
void DelayCreate(int iType, string sString, location lLoc);
void SwapFaction(object oPC, int iFaction);

void main()
{
    object oPC = GetFirstPC();
    int iCut = 100;

    if(GetIsPC(oPC))
    {
        //SetLocalInt(OBJECT_SELF, "nDoOnce", 1);
        // Stop combat for everyone.
        //SwapFaction(oPC, STANDARD_FACTION_COMMONER);

        /*
        // The player may have the ring on. Find which slot it is in.
        object oRing;
        object oTempRing1 = GetItemInSlot(INVENTORY_SLOT_LEFTRING, oPC);
        object oTempRing2 = GetItemInSlot(INVENTORY_SLOT_RIGHTRING, oPC);

        if(GetTag(oTempRing1) == "hx_puzzle_ring")
           oRing = oTempRing1;
        else if(GetTag(oTempRing2) == "hx_puzzle_ring")
           oRing = oTempRing2;

        if(GetTag(oRing) == "hx_puzzle_ring")
        {
           AssignCommand(oPC, ActionUnequipItem(oRing));
        }
        */
        // Start the cutscene.
        DelayCommand(0.5, StartCutscene(oPC, iCut));
    }
}

void StartCutscene(object oPC, int iCut)
{

      // Setup the scene
      CutSetActiveCutscene(iCut, CUT_DELAY_TYPE_CONSTANT);
      CutSetActiveCutsceneForObject(oPC, iCut, TRUE);
      CutDisableAbort(iCut);
      CutSetLocation(0.5, oPC);

      location lLoc = GetLocation(oPC);
      location lTemp = GetLocation(GetObjectByTag("hx_temp_devil_wp"));

      // Cutscene objects other than the PC.
      object oWPStart = GetObjectByTag("hx_cutx2_pc_start_wp");
      CutSetActiveCutsceneForObject(oWPStart, iCut);

      object oWPMove = GetObjectByTag("hx_cutx2_move_wp");
      CutSetActiveCutsceneForObject(oWPMove, iCut);

      object oWPDemon = GetObjectByTag("hx_cutx2_demon_wp");
      CutSetActiveCutsceneForObject(oWPDemon, iCut);

      object oRubble1 = GetObjectByTag("hx_cutx_giant_debris");
      CutSetActiveCutsceneForObject(oRubble1, iCut);
      object oRubble2 = GetObjectByTag("hx_cutx_giant_debris", 1);
      CutSetActiveCutsceneForObject(oRubble2, iCut);

      // PC Copy.
      //object oPCCopy = CutCreatePCCopy(oPC, lLoc, "HX_PC_COPY");
      //CutSetActiveCutsceneForObject(oPCCopy, iCut);
      //ChangeToStandardFaction(oPCCopy, STANDARD_FACTION_COMMONER);

      // Setup the cutscene.
      //CutBlackScreen(0.0, oPC);
      CutSetCutsceneMode(0.1, oPC, TRUE, CUT_CAMERA_HEIGHT_HIGH);
      CutJumpToLocation(0.6, oPC, GetLocation(oWPStart));
      CutSetCamera(0.8, oPC, CAMERA_MODE_TOP_DOWN, 340.0, 5.0, 82.0,
                   CAMERA_TRANSITION_TYPE_SNAP);
      CutCreateObject(0.5, oPC, OBJECT_TYPE_CREATURE, "hx_temp_devil", lTemp, EFFECT_TYPE_INVALIDEFFECT);
      DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY), GetObjectByTag("hx_temp_devil")));

      CutFadeFromBlack(2.5, oPC, FADE_SPEED_FAST);


      // Start the scene.
      DelayCommand(4.0, DoExplodeWall(oPC));
      DelayCommand(4.0, MusicBattlePlay(GetArea(OBJECT_SELF)));
      CutJumpToLocation(7.2, oPC, GetLocation(oWPMove));
      DelayCommand(7.5, DelayCreate(OBJECT_TYPE_CREATURE, "hx_cutx_demon", GetLocation(oWPDemon)));
      DelayCommand(6.3, DelayCreate(OBJECT_TYPE_PLACEABLE, "hx_giant_rubble", GetLocation(oRubble1)));
      DelayCommand(6.4, DelayCreate(OBJECT_TYPE_PLACEABLE, "hx_giant_rubble", GetLocation(oRubble2)));
      DelayCommand(15.5, AssignCommand(GetObjectByTag("hx_cutx_demon"), ActionMoveToLocation(lLoc, TRUE)));

      DelayCommand(16.0, DestroyObject(GetObjectByTag("hx_temp_devil")));

      // End scene.
      CutFadeOutAndIn(17.0, oPC, 1.5);
      CutDisableCutscene(iCut, 17.5, 17.5, RESTORE_TYPE_NORMAL);
      DelayCommand(18.5, SwapFaction(oPC, STANDARD_FACTION_HOSTILE));
      DelayCommand(17.5, SetLocalInt(GetModule(), "HX_COURTYARD_READY", TRUE));
}

void DoExplodeWall(object oPC)
{
    int x = 0;
    object oWP = GetObjectByTag("hx_giant_hole_wp", x);
    object oWall = GetObjectByTag("hx_walltile");
    float fDelay = 0.0;
    object oSound1 = GetObjectByTag("hx_rock_blast1");
    object oSound2 = GetObjectByTag("hx_rock_blast2");
    object oSound3 = GetObjectByTag("hx_rock_blast3");
    object oSound4 = GetObjectByTag("hx_devil_cut_dead");
    object oSound5 = GetObjectByTag("hx_devil_cut_dead2");

    object oDead = GetObjectByTag("hx_cut_dead_dev");

    //ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SCREEN_SHAKE), GetLocation(oWall));
    DestroyObject(oWall);

    SoundObjectPlay(oSound1);
    SoundObjectPlay(oSound2);
    SoundObjectPlay(oSound3);

    DelayCommand(0.3, SoundObjectPlay(oSound4));
    DelayCommand(0.8, SoundObjectPlay(oSound5));
    DelayCommand(0.9, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SCREEN_SHAKE), GetLocation(oPC)));

    DelayCommand(6.0, SoundObjectStop(oSound1));
    DelayCommand(6.0, SoundObjectStop(oSound2));
    DelayCommand(6.0, SoundObjectStop(oSound3));
    DelayCommand(6.0, SoundObjectStop(oSound4));
    DelayCommand(6.0, SoundObjectStop(oSound5));

    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(354), GetLocation(oDead));
    DelayCommand(0.2, DelayCreate(OBJECT_TYPE_CREATURE, "hx_hell_pit_cut", GetLocation(oDead)));

    while(GetIsObjectValid(oWP))
    {
        DelayCommand(fDelay, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(354), GetLocation(oWP)));
        x = x + 1;
        fDelay = fDelay + 0.05;
        oWP = GetObjectByTag("hx_giant_hole_wp", x);
    }
}

void DelayCreate(int iType, string sString, location lLoc)
{
    CreateObject(iType, sString, lLoc);
}

void SwapFaction(object oPC, int iFaction)
{
    object oCreature = GetFirstObjectInArea(GetArea(oPC));

    while(GetIsObjectValid(oCreature))
    {
        if(GetObjectType(oCreature) == OBJECT_TYPE_CREATURE)
        {
            if(!GetIsPC(oCreature) && GetMaster(oCreature) == OBJECT_INVALID)
            {
                AssignCommand(oCreature, ClearAllActions(TRUE));
                ChangeToStandardFaction(oCreature, iFaction);
            }
        }
        oCreature = GetNextObjectInArea(GetArea(oPC));
    }
}
