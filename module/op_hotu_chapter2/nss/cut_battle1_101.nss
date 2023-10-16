//::///////////////////////////////////////////////

//:: Name cut_battle1_101

//:: Copyright (c) 2001 Bioware Corp.

//:://////////////////////////////////////////////

/*

    First wave of the battle - PC will see waves of

    attackers

*/
//:://////////////////////////////////////////////
//:: Created By:    Keith Warner
//:: Created On:    August 5/03
//:://////////////////////////////////////////////
#include "x2_inc_cutscene"
#include "nw_i0_generic"
#include "x2_inc_globals"

void StartCutscene(object oPC);
void StartAttack(object oPC);

int nCutsceneNumber = 101;

void main()
{
    //Get the PC however we are going to do it for this cutscene
    object oPC = OBJECT_SELF;

    // From this point on, messing with the gate would trigger the betrayl path.
    SetLocalInt(GetModule(), "X2_Bat1EnemyArrived", 1);

    object oArea = GetArea(oPC);
    string szArea = GetTag(oArea);

    //Set a local int on the area to show that cutscene 101 is running
    SetLocalInt(oArea, "X2_CutScene101", 1);

    //Set Cutscene 101 as active for all future calls to Cut_ commands
    CutSetActiveCutscene(nCutsceneNumber, CUT_DELAY_TYPE_CONSTANT);
    CutDisableAbort(nCutsceneNumber);
    CutSetAbortDelay(nCutsceneNumber, 2.0);
    CutSetDestroyCopyDelay(nCutsceneNumber, 2.0);
    //All PCs in the area will Fade to Black
    //Set Cutscene mode on each player in the area and do the fade
    object oHench;
    int i;
    object oPlayer = GetFirstPC();
    while (oPlayer != OBJECT_INVALID)
    {
        if (GetTag(GetArea(oPlayer)) == szArea)
        {
            AssignCommand(oPlayer, ClearAllActions());
            //Fade PCs to black
            BlackScreen(oPlayer);
            if(oPlayer == oPC)
            {
                CutSetActiveCutsceneForObject(oPlayer, nCutsceneNumber, TRUE);
            }
            else
            {
                CutSetActiveCutsceneForObject(oPlayer, nCutsceneNumber, FALSE);
            }
            //CutDisableAbort(nCutsceneNumber);
            CutSetCutsceneMode(1.0, oPlayer, TRUE, TRUE, FALSE, TRUE); // pc invis - do not keep but freeze associates
            CutFadeFromBlack(2.5, oPlayer, FADE_SPEED_FAST, FALSE);
            //Make Each Henchmen Invis
            i = 1;
            oHench = GetHenchman(oPC, i);
            while(oHench != OBJECT_INVALID)
            {
                CutSetActiveCutsceneForObject(oHench, nCutsceneNumber, FALSE);
                CutApplyEffectToObject(0.0, DURATION_TYPE_PERMANENT, VFX_DUR_CUTSCENE_INVISIBILITY, oHench);
                i++;
                oHench = GetHenchman(oPC, i);
            }

        }
        oPlayer = GetNextPC();
    }

    DelayCommand(1.0, StartCutscene(oPC));

}

void StartCutscene(object oPC)
{
    int i = 1;
    object oHench = GetHenchman(oPC, i);
    while(oHench != OBJECT_INVALID)
    {
         CutSetActiveCutsceneForObject(oHench , nCutsceneNumber);
         i++;
         oHench = GetHenchman(oPC, i);
    }

    // Cutscene actors and objects.
    object oDuergar1_1 = GetObjectByTag("cut101_duergar1_1");
    object oDuergar1_2 = GetObjectByTag("cut101_duergar1_2");
    object oDuergar1_3 = GetObjectByTag("cut101_duergar1_3");
    object oDuergar1_4 = GetObjectByTag("cut101_duergar1_4");
    object oDuergar1_5 = GetObjectByTag("cut101_duergar1_5");

    object oDuergar2_1 = GetObjectByTag("cut101_duergar2_1");
    object oDuergar2_2 = GetObjectByTag("cut101_duergar2_2");
    object oDuergar2_3 = GetObjectByTag("cut101_duergar2_3");
    object oDuergar2_4 = GetObjectByTag("cut101_duergar2_4");
    object oDuergar2_5 = GetObjectByTag("cut101_duergar2_5");

    object oDuergar3_1 = GetObjectByTag("cut101_duergar3_1");
    object oDuergar3_2 = GetObjectByTag("cut101_duergar3_2");
    object oDuergar3_3 = GetObjectByTag("cut101_duergar3_3");
    object oDuergar3_4 = GetObjectByTag("cut101_duergar3_4");
    object oDuergar3_5 = GetObjectByTag("cut101_duergar3_5");

    object oDuergar4_1 = GetObjectByTag("cut101_duergar4_1");
    object oDuergar4_2 = GetObjectByTag("cut101_duergar4_2");
    object oDuergar4_3 = GetObjectByTag("cut101_duergar4_3");
    object oDuergar4_4 = GetObjectByTag("cut101_duergar4_4");
    object oDuergar4_5 = GetObjectByTag("cut101_duergar4_5");

    object oDrowWiz1 = GetObjectByTag("cut101_drowwiz_1");
    object oDrowPriest1 = GetObjectByTag("cut101_drowpriest_1");
    object oDrowScout1 = GetObjectByTag("cut101_drowscout1");
    object oDrowScout2 = GetObjectByTag("cut101_drowscout2");

    object oBat1 = GetObjectByTag("cut101bat1");
    object oBat2 = GetObjectByTag("cut101bat2");
    object oBat3 = GetObjectByTag("cut101bat3");
    object oBat4 = GetObjectByTag("cut101bat4");
    object oBat5 = GetObjectByTag("cut101bat5");
    object oBat6 = GetObjectByTag("cut101bat6");
    object oBat7 = GetObjectByTag("cut101bat7");
    object oBat8 = GetObjectByTag("cut101bat8");
    object oBat9 = GetObjectByTag("cut101bat9");
    object oBat10 = GetObjectByTag("cut101bat10");

    //effects

    //Set all objects as cutscene active
    CutSetActiveCutsceneForObject(oDuergar1_1 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDuergar1_2 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDuergar1_3 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDuergar1_4 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDuergar1_5 , nCutsceneNumber);

    CutSetActiveCutsceneForObject(oDuergar2_1 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDuergar2_2 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDuergar2_3 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDuergar2_4 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDuergar2_5 , nCutsceneNumber);

    CutSetActiveCutsceneForObject(oDuergar3_1 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDuergar3_2 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDuergar3_3 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDuergar3_4 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDuergar3_5 , nCutsceneNumber);

    CutSetActiveCutsceneForObject(oDuergar4_1 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDuergar4_2 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDuergar4_3 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDuergar4_4 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDuergar4_5 , nCutsceneNumber);

    CutSetActiveCutsceneForObject(oDrowWiz1 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDrowPriest1 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDrowScout1 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oDrowScout2 , nCutsceneNumber);

    CutSetActiveCutsceneForObject(oBat1 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oBat2 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oBat3 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oBat4 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oBat5 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oBat6 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oBat7 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oBat8 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oBat9 , nCutsceneNumber);
    CutSetActiveCutsceneForObject(oBat10 , nCutsceneNumber);

    // Change the music
    object oArea = GetArea(oPC);
    DelayCommand(15.0, MusicBattlePlay(oArea));

    // Cutscene waypoint locations
    location lForm1_1_1 = GetLocation(GetWaypointByTag("cut101wp_form1_1_1"));
    location lForm1_2_1 = GetLocation(GetWaypointByTag("cut101wp_form1_2_1"));
    location lForm1_3_1 = GetLocation(GetWaypointByTag("cut101wp_form1_3_1"));
    location lForm1_4_1 = GetLocation(GetWaypointByTag("cut101wp_form1_4_1"));
    location lForm1_5_1 = GetLocation(GetWaypointByTag("cut101wp_form1_5_1"));

    location lForm2_1_1 = GetLocation(GetWaypointByTag("cut101wp_form2_1_1"));
    location lForm2_2_1 = GetLocation(GetWaypointByTag("cut101wp_form2_2_1"));
    location lForm2_3_1 = GetLocation(GetWaypointByTag("cut101wp_form2_3_1"));
    location lForm2_4_1 = GetLocation(GetWaypointByTag("cut101wp_form2_4_1"));
    location lForm2_5_1 = GetLocation(GetWaypointByTag("cut101wp_form2_5_1"));

    location lScout1_1 = GetLocation(GetWaypointByTag("cut101wp_scout1_1"));
    location lScout1_2 = GetLocation(GetWaypointByTag("cut101wp_scout1_2"));
    location lScout2_1 = GetLocation(GetWaypointByTag("cut101wp_scout2_1"));
    location lScout2_2 = GetLocation(GetWaypointByTag("cut101wp_scout2_2"));

    location lPriest1_1 = GetLocation(GetWaypointByTag("cut101wp_priest1_1"));
    location lWizard1_1 = GetLocation(GetWaypointByTag("cut101wp_wizard1_1"));

    location lForm1Jump = GetLocation(GetWaypointByTag("cut101wp_form1start"));
    location lForm2Jump = GetLocation(GetWaypointByTag("cut101wp_form2start"));
    location lForm3Jump = GetLocation(GetWaypointByTag("cut101wp_form3start"));

    //Camera waypoints
    location lCamera1 = GetLocation(GetWaypointByTag("cut101wp_camera1"));
    object oCamera1 = GetWaypointByTag("cut101wp_camera1");
    location lCamera2 = GetLocation(GetWaypointByTag("cut101wp_camera2"));
    location lCamera3 = GetLocation(GetWaypointByTag("cut101wp_camera3"));
    location lCamera4 = GetLocation(GetWaypointByTag("cut101wp_camera4"));


    // Camera movements (includes moving the PC as the camera.
    //////////////////////////////////////////////////////////
    CutJumpToObject(0.0, oPC, oCamera1, FALSE);
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 100.0, 20.0, 75.0,
                 CAMERA_TRANSITION_TYPE_SNAP);
    CutSetCamera(3.5, oPC, CAMERA_MODE_TOP_DOWN, 200.0, 10.0, 75.0,
                 CAMERA_TRANSITION_TYPE_VERY_SLOW);
    CutSetCamera(15.0, oPC, CAMERA_MODE_TOP_DOWN, 75.0, 20.0, 75.0,
                 CAMERA_TRANSITION_TYPE_VERY_SLOW);
    CutSetCamera(20.0, oPC, CAMERA_MODE_TOP_DOWN, 25.0, 20.0, 75.0,
                 CAMERA_TRANSITION_TYPE_VERY_SLOW);

    CutActionMoveToLocation(3.5, oPC, lCamera2, TRUE, FALSE);
    CutActionMoveToLocation(15.0, oPC, lCamera3, FALSE, FALSE);
    CutActionMoveToLocation(20.0, oPC, lCamera4, FALSE, FALSE);
    // NPC movements (not animations, but moving from one loc to another)
    // This WILL include NPC facings.
    /////////////////////////////////////////////////////////////////////

    //Bat movement - one group moves towards the PC
    CutActionMoveToLocation(3.5, oBat1, lCamera2, TRUE, FALSE);
    CutActionMoveToLocation(3.5, oBat2, lCamera2, TRUE, FALSE);
    CutActionMoveToLocation(3.5, oBat3, lCamera2, TRUE, FALSE);

    //Drow scouts run into view
    CutActionMoveToLocation(4.5, oDrowScout1, lScout1_1, TRUE, FALSE);
    CutApplyEffectToObject(4.5, DURATION_TYPE_PERMANENT, EFFECT_TYPE_CUTSCENEGHOST, oDrowScout1);
    CutActionMoveToLocation(6.5, oDrowScout2, lScout2_1, TRUE, FALSE);
    CutApplyEffectToObject(6.5, DURATION_TYPE_PERMANENT, EFFECT_TYPE_CUTSCENEGHOST, oDrowScout2);
    //Drow Scout looks around


    //Army formations appear  - 1 and 2 move together
    CutApplyEffectToObject(12.0, DURATION_TYPE_PERMANENT, EFFECT_TYPE_CUTSCENEGHOST, oDuergar1_1);
    CutApplyEffectToObject(12.0, DURATION_TYPE_PERMANENT, EFFECT_TYPE_CUTSCENEGHOST, oDuergar1_2);
    CutApplyEffectToObject(12.0, DURATION_TYPE_PERMANENT, EFFECT_TYPE_CUTSCENEGHOST, oDuergar1_3);
    CutApplyEffectToObject(12.0, DURATION_TYPE_PERMANENT, EFFECT_TYPE_CUTSCENEGHOST, oDuergar1_4);
    CutApplyEffectToObject(12.0, DURATION_TYPE_PERMANENT, EFFECT_TYPE_CUTSCENEGHOST, oDuergar1_5);

    CutActionMoveToLocation(12.5, oDuergar1_1, lForm1_1_1, TRUE, FALSE);

    CutActionForceFollowObject(13.0, oDuergar1_2, oDuergar1_1, 1.5,FALSE);
    CutActionForceFollowObject(13.0, oDuergar1_3, oDuergar1_2, 1.5,FALSE);
    CutActionForceFollowObject(13.0, oDuergar1_4, oDuergar1_3, 1.5,FALSE);
    CutActionForceFollowObject(13.0, oDuergar1_5, oDuergar1_4, 1.5,FALSE);

    CutApplyEffectToObject(12.0, DURATION_TYPE_PERMANENT, EFFECT_TYPE_CUTSCENEGHOST, oDuergar2_1);
    CutApplyEffectToObject(12.0, DURATION_TYPE_PERMANENT, EFFECT_TYPE_CUTSCENEGHOST, oDuergar2_2);
    CutApplyEffectToObject(12.0, DURATION_TYPE_PERMANENT, EFFECT_TYPE_CUTSCENEGHOST, oDuergar2_3);
    CutApplyEffectToObject(12.0, DURATION_TYPE_PERMANENT, EFFECT_TYPE_CUTSCENEGHOST, oDuergar2_4);
    CutApplyEffectToObject(12.0, DURATION_TYPE_PERMANENT, EFFECT_TYPE_CUTSCENEGHOST, oDuergar2_5);

    CutActionMoveToLocation(12.5, oDuergar2_1, lForm2_1_1, TRUE, FALSE);
    CutActionForceFollowObject(13.0, oDuergar2_2, oDuergar2_1, 2.0,FALSE);
    CutActionForceFollowObject(13.0, oDuergar2_3, oDuergar2_2, 2.0,FALSE);
    CutActionForceFollowObject(13.0, oDuergar2_4, oDuergar2_3, 2.0,FALSE);
    CutActionForceFollowObject(13.0, oDuergar2_5, oDuergar2_4, 2.0,FALSE);

    CutApplyEffectToObject(12.0, DURATION_TYPE_PERMANENT, EFFECT_TYPE_CUTSCENEGHOST, oDuergar3_1);
    CutApplyEffectToObject(12.0, DURATION_TYPE_PERMANENT, EFFECT_TYPE_CUTSCENEGHOST, oDuergar3_2);
    CutApplyEffectToObject(12.0, DURATION_TYPE_PERMANENT, EFFECT_TYPE_CUTSCENEGHOST, oDuergar3_3);
    CutApplyEffectToObject(12.0, DURATION_TYPE_PERMANENT, EFFECT_TYPE_CUTSCENEGHOST, oDuergar3_4);
    CutApplyEffectToObject(12.0, DURATION_TYPE_PERMANENT, EFFECT_TYPE_CUTSCENEGHOST, oDuergar3_5);

    //3 and 4 move together
    CutActionMoveToLocation(19.5, oDuergar3_1, lForm1_1_1, TRUE, FALSE);
    CutActionForceFollowObject(20.0, oDuergar3_2, oDuergar3_1, 1.5,FALSE);
    CutActionForceFollowObject(20.0, oDuergar3_3, oDuergar3_2, 1.5,FALSE);
    CutActionForceFollowObject(20.0, oDuergar3_4, oDuergar3_3, 1.5,FALSE);
    CutActionForceFollowObject(20.0, oDuergar3_5, oDuergar3_4, 1.5,FALSE);

    CutApplyEffectToObject(12.0, DURATION_TYPE_PERMANENT, EFFECT_TYPE_CUTSCENEGHOST, oDuergar4_1);
    CutApplyEffectToObject(12.0, DURATION_TYPE_PERMANENT, EFFECT_TYPE_CUTSCENEGHOST, oDuergar4_2);
    CutApplyEffectToObject(12.0, DURATION_TYPE_PERMANENT, EFFECT_TYPE_CUTSCENEGHOST, oDuergar4_3);
    CutApplyEffectToObject(12.0, DURATION_TYPE_PERMANENT, EFFECT_TYPE_CUTSCENEGHOST, oDuergar4_4);
    CutApplyEffectToObject(12.0, DURATION_TYPE_PERMANENT, EFFECT_TYPE_CUTSCENEGHOST, oDuergar4_5);

    CutActionMoveToLocation(19.5, oDuergar4_1, lForm2_1_1, TRUE, FALSE);
    CutActionForceFollowObject(20.0, oDuergar4_2, oDuergar4_1, 1.5,FALSE);
    CutActionForceFollowObject(20.0, oDuergar4_3, oDuergar4_2, 1.5,FALSE);
    CutActionForceFollowObject(20.0, oDuergar4_4, oDuergar4_3, 1.5,FALSE);
    CutActionForceFollowObject(20.0, oDuergar4_5, oDuergar4_4, 1.5,FALSE);

    CutApplyEffectToObject(5.0, DURATION_TYPE_PERMANENT, EFFECT_TYPE_CUTSCENEGHOST, oDrowPriest1);
    CutApplyEffectToObject(5.0, DURATION_TYPE_PERMANENT, EFFECT_TYPE_CUTSCENEGHOST, oDrowWiz1);

    //Drow Scouts run off
    CutActionMoveToLocation(18.5, oDrowScout1, lScout1_2, TRUE, FALSE);
    CutActionMoveToLocation(25.5, oDrowScout2, lScout2_2, TRUE, FALSE);

    //Bats fly off.
    CutApplyEffectToObject2(10.0, DURATION_TYPE_INSTANT, EffectDisappear(), oBat1);
    CutApplyEffectToObject2(12.0, DURATION_TYPE_INSTANT, EffectDisappear(), oBat2);
    CutApplyEffectToObject2(12.5, DURATION_TYPE_INSTANT, EffectDisappear(), oBat3);
    CutApplyEffectToObject2(16.0, DURATION_TYPE_INSTANT, EffectDisappear(), oBat4);
    CutApplyEffectToObject2(16.5, DURATION_TYPE_INSTANT, EffectDisappear(), oBat5);
    CutApplyEffectToObject2(18.0, DURATION_TYPE_INSTANT, EffectDisappear(), oBat6);
    CutApplyEffectToObject2(18.2, DURATION_TYPE_INSTANT, EffectDisappear(), oBat7);
    CutApplyEffectToObject2(18.3, DURATION_TYPE_INSTANT, EffectDisappear(), oBat8);
    CutApplyEffectToObject2(19.0, DURATION_TYPE_INSTANT, EffectDisappear(), oBat9);
    CutApplyEffectToObject2(21.0, DURATION_TYPE_INSTANT, EffectDisappear(), oBat10);
    //Drow Commanders appear
    //CutActionMoveToLocation(7.5, oDrowWiz1, lPriest1_1, FALSE, FALSE);
    CutActionMoveToLocation(7.5, oDrowPriest1, lWizard1_1, TRUE, FALSE);
    CutActionForceFollowObject(8.0, oDrowWiz1, oDrowPriest1, 1.5, FALSE);

    //Drow Commander issues orders
    CutSpeakStringByStrRef(22.5, oDrowPriest1, 85750);//"The first of you that breaks, I will slay myself!"

    //Army continues to march as camera pans back

    //OPTIONAL BIT IF MATRON STILL HAS UNDEAD IN HER ARMY
    if (GetGlobalInt("x2_plot_undead_out") == 0)
    {
        object oUndead1_5 = GetObjectByTag("cut101_undead1_5");

        object oUndead2_5 = GetObjectByTag("cut101_undead2_5");

        CutSetActiveCutsceneForObject(oUndead1_5 , nCutsceneNumber);

        CutSetActiveCutsceneForObject(oUndead2_5 , nCutsceneNumber);

        CutApplyEffectToObject(12.0, DURATION_TYPE_PERMANENT, EFFECT_TYPE_CUTSCENEGHOST, oUndead1_5);

        CutApplyEffectToObject(12.0, DURATION_TYPE_PERMANENT, EFFECT_TYPE_CUTSCENEGHOST, oUndead2_5);

        CutActionMoveToLocation(26.5, oUndead2_5, lForm1_1_1, TRUE, FALSE);

        CutActionMoveToLocation(26.5, oUndead1_5, lForm2_1_1, TRUE, FALSE);

    }

    //Commanders look around and then continue to march...


    // End Cutscene

    CutFadeOutAndIn(40.0, oPC);


    //Clean up actors...

    i = 1;
    oHench = GetHenchman(oPC, i);
    while(oHench != OBJECT_INVALID)
    {
        CutRemoveEffects(41.5, oHench, FALSE);
        i++;
        oHench = GetHenchman(oPC, i);
    }

    CutDisableCutscene(nCutsceneNumber, 42.0, 42.0, RESTORE_TYPE_NONE);


    DelayCommand(42.0, StartAttack(oPC));

}

void StartAttack(object oPC)
{
    if (GetLocalInt(GetModule(), "X2_Cutscene101Aborted") != 1)
    {
        //Jump PC back to the battlefield.
        location lTarget = GetLocation(GetObjectByTag("mn_q2abat1_battlestart"));
        AssignCommand(oPC, ActionJumpToLocation(lTarget));
        //Start the spawning of attackers.
        //Set Up the BattleMaster
        object oBattleMaster = GetObjectByTag("bat1_battlemaster");
        ExecuteScript("bat1_spawnatk", oBattleMaster);
    }
}



