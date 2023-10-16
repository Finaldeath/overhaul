//::///////////////////////////////////////////////
//:: Name hx_puz_onenter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will start a cutscene that shows a few
     aasimar flying to the PC.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Aug 28, 2003
//:://////////////////////////////////////////////
#include "hx_inc_ring"
#include "x2_inc_cutscene"
void StartCutscene(object oPC, int iCut);
void FlyToLocation(object oActor, location lLoc, object oPC, int iAttack = 0);
void TurnHostile(object oCleric, object oFighter, object oRogue, object oPC);
void main()
{
    object oPC = GetEnteringObject();
    int iCut = 90;

    if (GetLocalInt(OBJECT_SELF, "nDoOnce") != 1 && GetIsPC(oPC))
    {
        SetLocalInt(OBJECT_SELF, "nDoOnce", 1);
        // The player may have the ring on. Find which slot it is in.
        BlackScreen(oPC);

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

        // Start the cutscene.
        DelayCommand(1.0, StartCutscene(oPC, iCut));
    }

    //"Ring effect" check
    DelayCommand(0.5, HXAreaEnter(oPC));
}

void StartCutscene(object oPC, int iCut)
{

      // Setup the scene
      CutSetActiveCutscene(iCut, CUT_DELAY_TYPE_CONSTANT);
      CutSetActiveCutsceneForObject(oPC, iCut, TRUE);
      CutDisableAbort(iCut);

      location lLoc = GetLocation(oPC);

      // Cutscene objects other than the PC.
      object oWPStart = GetObjectByTag("hx_cutx_pc_start_wp");
      CutSetActiveCutsceneForObject(oWPStart, iCut);
      object oWPEnd = GetObjectByTag("hx_cutx_pc_end_wp");
      CutSetActiveCutsceneForObject(oWPEnd, iCut);
      object oWPMove = GetObjectByTag("hx_cutx_pc_move_wp");
      CutSetActiveCutsceneForObject(oWPMove, iCut);
      object oWPMove2 = GetObjectByTag("hx_cutx_pc_move_wp2");
      CutSetActiveCutsceneForObject(oWPMove2, iCut);
      object oCleric = GetObjectByTag("hx_assimar_c_cut");
      CutSetActiveCutsceneForObject(oCleric, iCut);
      object oFighter = GetObjectByTag("hx_assimar_f_cut");
      CutSetActiveCutsceneForObject(oFighter, iCut);
      object oRogue = GetObjectByTag("hx_assimar_r_cut");
      CutSetActiveCutsceneForObject(oRogue, iCut);
      // PC Copy.
      object oPCCopy = CutCreatePCCopy(oPC, lLoc, "HX_PC_COPY");
      CutSetActiveCutsceneForObject(oPCCopy, iCut);
      ChangeToStandardFaction(oPCCopy, STANDARD_FACTION_COMMONER);

      // Waypoints for flyers.
      object oWPCleric = GetObjectByTag("hx_cutx_cleric_wp");
      CutSetActiveCutsceneForObject(oWPCleric, iCut);
      object oWPFighter = GetObjectByTag("hx_cutx_fighter_wp");
      CutSetActiveCutsceneForObject(oWPFighter, iCut);
      object oWPRogue = GetObjectByTag("hx_cutx_rogue_wp");
      CutSetActiveCutsceneForObject(oWPRogue, iCut);

      // Setup the cutscene.
     //CutBlackScreen(0.0, oPC);
      CutSetCutsceneMode(0.1, oPC, TRUE, TRUE);
      CutJumpToLocation(0.2, oPC, GetLocation(oWPStart));
      CutSetCamera(0.4, oPC, CAMERA_MODE_STIFF_CHASE_CAMERA, 250.0, 6.0, 62.0,
                   CAMERA_TRANSITION_TYPE_SNAP);
      CutJumpToLocation(0.5, oPCCopy, lLoc);
      CutFadeFromBlack(2.5, oPC, FADE_SPEED_FAST);


      // Start the scene.

      CutPlaySound(4.75, oRogue, "vs_favhen5m_enmy");
      //CutSpeakString(4.85, oRogue, "[NOT IN STRING EDITOR] I see our next victims!");
      CutSpeakStringByStrRef(4.85, oRogue, 85506);
      CutPlayAnimation(5.0, oRogue, ANIMATION_LOOPING_LOOK_FAR, 1.5);
      CutSetFacingPoint(5.8, oCleric, "HX_PC_COPY");
      CutPlaySound(7.5, oCleric, "vs_nhalflf1_attk");
      //CutSpeakString(7.6, oCleric, "[NOT IN STRING EDITOR] Attack!");
      CutSpeakStringByStrRef(7.6, oCleric, 85507);
      CutSetFacingPoint(6.2, oFighter, "HX_PC_COPY");
      CutActionMoveToLocation(8.2, oPC, GetLocation(oWPMove), FALSE);
      CutSetCamera(8.2, oPC, CAMERA_MODE_STIFF_CHASE_CAMERA, 287.0, 6.0, 62.0,
                   CAMERA_TRANSITION_TYPE_VERY_SLOW);
      DelayCommand(7.1, FlyToLocation(oRogue, GetLocation(oWPRogue), oPC, 2));
      DelayCommand(7.2, MusicBattlePlay(OBJECT_SELF));
      DelayCommand(7.7, FlyToLocation(oCleric, GetLocation(oWPCleric), oPC, 1));
      DelayCommand(8.4, FlyToLocation(oFighter, GetLocation(oWPFighter), oPC));
      //CutPlayAnimation(7.5, oPCCopy, ANIMATION_FIREFORGET_DODGE_SIDE, 4.0);
      //CutSetFacingPoint(14.0, oPC, "HX_PC_COPY");
      CutJumpToLocation(15.0, oPC, GetLocation(oWPEnd));
      //CutActionMoveToLocation(14.2, oPC, GetLocation(oWPMove2), FALSE);
      //CutSetCamera(14.9, oPC, CAMERA_MODE_STIFF_CHASE_CAMERA, 230.0, 6.0, 62.0,
      //             CAMERA_TRANSITION_TYPE_SLOW);
      // End scene.
      CutFadeOutAndIn(17.0, oPC, 1.5);
      CutDisableCutscene(iCut, 17.5, 17.5, RESTORE_TYPE_COPY);
      DelayCommand(18.3, TurnHostile(oCleric, oFighter, oRogue, oPC));
}

void FlyToLocation(object oActor, location lLoc, object oPC, int iAttack = 0)
{
    AssignCommand(oActor, ClearAllActions(TRUE));
    AssignCommand(oActor, PlaySound("fs_flapfeather"));
    DelayCommand(0.1, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectDisappearAppear(lLoc), oActor, 5.5));
    DelayCommand(5.7, AssignCommand(oActor, PlaySound("fs_flapfeather")));

    if(iAttack == 0)
    {
        if(iAttack == 2)
        {
            //DelayCommand(11.3, ChangeToStandardFaction(oActor, STANDARD_FACTION_HOSTILE));
            //DelayCommand(11.8, AssignCommand(oActor, ActionAttack(oPC)));
        }
        else
        {
            //DelayCommand(10.0, ChangeToStandardFaction(oActor, STANDARD_FACTION_HOSTILE));
            //DelayCommand(10.5, AssignCommand(oActor, ActionAttack(oPC)));
        }
    }
    else
    {
        //DelayCommand(10.0, ChangeToStandardFaction(oActor, STANDARD_FACTION_HOSTILE));
        //DelayCommand(10.5, AssignCommand(oActor, ActionCastSpellAtObject(SPELL_BLESS, OBJECT_SELF, METAMAGIC_ANY, TRUE)));
    }
}

void TurnHostile(object oCleric, object oFighter, object oRogue, object oPC)
{
    ChangeToStandardFaction(oCleric, STANDARD_FACTION_HOSTILE);
    AssignCommand(oCleric, ActionAttack(oPC));

    ChangeToStandardFaction(oFighter, STANDARD_FACTION_HOSTILE);
    AssignCommand(oFighter, ActionAttack(oPC));

    ChangeToStandardFaction(oRogue, STANDARD_FACTION_HOSTILE);
    AssignCommand(oRogue, ActionAttack(oPC));
}
