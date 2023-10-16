//::///////////////////////////////////////////////
//:: os_cut_grate
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Notes from Brad:
    Ok, well what sort of fighting do you want?  What I mean is,
        I try to do most cutscene fighting as ambient stuff
        where I never actually tell them to attack in the cutscene script
    I use heartbeat scripts on them that tell them to keep attacking
    Too hard to control fighting in NWN
    Ok, then I would remove all scripts from ppl and set them to immortal.
        Then just write a heartbeat script that tells
        them to attack nearest enemy if they aren't currently doing so.
    Then create the cutscene around them
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////
#include "x2_inc_cutscene"
#include "inc_remeffect"

// Standard cutscene start. Best to wrap in a function in the event
// you need to do things before scene starts.
void StartCutscene(object oPC, int iCut);
// Generic function. Done to show how to make your own functions.
void GenericFunction(int iCut, object oPC);

void main()
{
    // Change to however you get the cutscene activator.
    object oPC = GetEnteringObject();
    // Change to whatever cutscene number you want to use.
    int iCut = 30;

    // Usually check to see if PC is firing the scene.
    if(GetIsPC(oPC))
    {
        // Do once
        if (GetLocalInt(OBJECT_SELF, "nDoOnce") != 1)
        {
            // Immediately blacks out screen. Fade in when the scene starts.
            //BlackScreen(oPC);

            object oEnivid = GetObjectByTag("q2_enivid");
            SetTime(21,1,1,1);
            SetLocalInt(OBJECT_SELF, "nDoOnce", 1);

            // Do any pre-cutscene stuff here.
            //
            SetCutsceneMode(oPC, TRUE);
            AssignCommand(oEnivid,
                ActionStartConversation(oPC,"q2_enivid"));

            AssignCommand(oPC, SetCameraFacing(110.0f, 15.0f, 60.0f));
            DelayCommand(0.5f, AssignCommand(oPC, SetCameraFacing(110.0f, 15.0f, 60.0f)));
            DelayCommand(1.0f, AssignCommand(oPC, SetCameraFacing(110.0f, 15.0f, 60.0f)));

            // Start the scene.
            //DelayCommand(1.0,StartCutscene(oPC, iCut));
        }
    }
}

void StartCutscene(object oPC, int iCut)
{
      RemovePoly(oPC);

      // Setup the scene for the PC. Leave this alone.
      CutSetActiveCutscene(iCut, CUT_DELAY_TYPE_CONSTANT);
      CutSetActiveCutsceneForObject(oPC, iCut, TRUE);

      // Cutscene objects other than the PC. Define them, then set the cutscene as
      // active on them. This will allow them to be commanded using any cutscene functions
      // in the include.

        //the goodguys
        object oDylan = GetObjectByTag("q2_dylan");
        object oEnivid = GetObjectByTag("q2_enivid");
        object oFeran = GetObjectByTag("q2_feran");
        object oDynschall = GetObjectByTag("q2_dynschall");

        //create the bad guys
        location lOgre = GetLocation(GetObjectByTag("q2_way_gogre"));
        object oOgre = CreateObject(OBJECT_TYPE_CREATURE, "q2_gateogre",lOgre);

        location lDrow = GetLocation(GetObjectByTag("q2_way_gdrow"));
//        CutCreateObject(0.0,oPC,OBJECT_TYPE_CREATURE, "q2_gatedrow",lDrow,0);
        location lDuergar = GetLocation(GetObjectByTag("q2_way_gduergar"));
//        CutCreateObject(0.0,oPC,OBJECT_TYPE_CREATURE, "q2_gateduergar",lDuergar,0);
        location lGoblin = GetLocation(GetObjectByTag("q2_way_ggoblin"));
//        CutCreateObject(0.0,oPC,OBJECT_TYPE_CREATURE, "q2_gategoblin",lGoblin,0);
        location lHobgoblin = GetLocation(GetObjectByTag("q2_way_ghobgob"));
//        CutCreateObject(0.0,oPC,OBJECT_TYPE_CREATURE, "q2_gatehobgoblin",lHobgoblin,0);
        location lKobold = GetLocation(GetObjectByTag("q2_way_gkobold"));
//        CutCreateObject(0.0,oPC,OBJECT_TYPE_CREATURE, "q2_gatekobold",lKobold,0);
        location lSkeleton = GetLocation(GetObjectByTag("q2_way_gskeleton"));
//        CutCreateObject(0.0,oPC,OBJECT_TYPE_CREATURE, "q2_gateskeleton",lSkeleton,0);*/

        //select the bad guys
        // = GetObjectByTag("q2_gateogre");

        /*object oDrow = GetObjectByTag("q2_gatedrow");
        object oDuergar = GetObjectByTag("q2_gateduergar");
        object oGoblin = GetObjectByTag("q2_gategoblin");
        object oHobgoblin = GetObjectByTag("q2_gatehobgoblin");
        object oKobold = GetObjectByTag("q2_gatekobold");
        object oSkeleton = GetObjectByTag("q2_gateskeleton");*/

        //set the cut scene active
        CutSetActiveCutsceneForObject(oDylan, iCut);
        CutSetActiveCutsceneForObject(oEnivid, iCut);
        CutSetActiveCutsceneForObject(oFeran, iCut);
        CutSetActiveCutsceneForObject(oDynschall, iCut);

        CutSetActiveCutsceneForObject(oOgre,iCut);

        /*CutSetActiveCutsceneForObject(oDrow,iCut);
        CutSetActiveCutsceneForObject(oGoblin, iCut);
        CutSetActiveCutsceneForObject(oKobold, iCut);
        CutSetActiveCutsceneForObject(oHobgoblin, iCut);
        CutSetActiveCutsceneForObject(oSkeleton, iCut);
        CutSetActiveCutsceneForObject(oDuergar, iCut);*/

      // PC Copy. Uncomment if needed. Define the loc where you want to create it.
      location lLoc = GetLocation(GetObjectByTag("q2_way_gatecopy"));

      object oPCCopy = CutCreatePCCopy(oPC, lLoc, "OS_PC_COPY");
      ChangeToStandardFaction(oPCCopy,STANDARD_FACTION_COMMONER);
      CutSetActiveCutsceneForObject(oPCCopy, iCut);
      SetImmortal(oPCCopy,TRUE);

      // Waypoint for start. Good idea to jump the PC to where you want at the start.
      location lPCStart = GetLocation(GetObjectByTag("q2aa_way_cutscene"));

/////////////////////////////////////////////////////////

      //
      // Setup the cutscene. Times should stay. Read function comments for more details.
      //
      CutSetCutsceneMode(1.1, oPC, TRUE, CUT_CAMERA_HEIGHT_MEDIUM, TRUE, 2);

      // Starting camera.
      // Adjust the camera how you see fit. Best to do a snap here while screen
      // is black to get your "starting" camera.
      CutSetCamera(2.2, oPC, CAMERA_MODE_TOP_DOWN, 0.0, 20.0, 30.0,
                   CAMERA_TRANSITION_TYPE_SNAP);
        CutJumpToLocation(2.3, oPC, lPCStart);

        // Fade in so we can start the scene.
        CutFadeFromBlack(2.5, oPC, FADE_SPEED_SLOW);

        // Start the scene.
        // This is where all your action takes place. Do PC movements, spells, dialog,
        // fighting, camera movements, etc, here.

        //the fight begins
        CutActionAttack(2.5,oPCCopy,oOgre);
        CutActionAttack(2.5,oEnivid,oOgre);
        CutActionAttack(2.5,oDylan,oOgre);
        CutActionAttack(2.5,oDynschall,oOgre);
        CutActionAttack(2.5,oFeran,oOgre);

        CutApplyEffectAtLocation(3.0, oPC, DURATION_TYPE_INSTANT,
            VFX_FNF_FIREBALL,lKobold, 0.0);
        CutApplyEffectAtLocation(5.0, oPC, DURATION_TYPE_INSTANT,
            VFX_FNF_SCREEN_SHAKE,lGoblin, 0.0);
        CutApplyEffectAtLocation(7.0, oPC, DURATION_TYPE_INSTANT,
            VFX_FNF_FIREBALL,lSkeleton, 0.0);
        CutApplyEffectAtLocation(9.0, oPC, DURATION_TYPE_INSTANT,
            VFX_FNF_SCREEN_SHAKE,lHobgoblin, 0.0);

        //creatures' death scenes
//        SetImmortal(oOgre,FALSE);
//        CutJumpToObject(9.0,oPC,oFeran);
        effect eDam = EffectDamage(1000);
        DelayCommand(11.0,
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eDam,oOgre));
//        CutDeath(10.0,oOgre,TRUE);

        /*CutJumpToObject(9.0,oPC,oFeran);
        CutDeath(10.0,oKobold,TRUE);

        DelayCommand(11.5,SetImmortal(oGoblin,FALSE));
        CutJumpToObject(12.0,oPC,oDynschall);
        CutDeath(13.0,oGoblin,TRUE);

        DelayCommand(14.5,SetImmortal(oSkeleton,FALSE));
        CutJumpToObject(15.0,oPC,oEnivid);
        CutDeath(16.0,oSkeleton,TRUE);

        DelayCommand(18.5,SetImmortal(oHobgoblin,FALSE));
        DelayCommand(19.5,SetImmortal(oDrow,FALSE));
        DelayCommand(20.5,SetImmortal(oDuergar,FALSE));
        CutJumpToObject(18.0,oPC,oDylan);
        CutDeath(19.0,oHobgoblin,TRUE);
        CutDeath(20.0,oDrow,TRUE);
        CutDeath(21.0,oDuergar,TRUE);*/

      // End scene. Change times and parameters accordingly.
      // What should stay: The time difference between Fade and Disable, and the
      // fade length (1.5). These produce the best results.
      CutFadeOutAndIn(14.0, oPC, 1.5);
      CutJumpToLocation(14.5, oPC, lLoc);
      //starts the conversation with Enivid
        CutActionStartConversation(14.5,oEnivid,oPC,"q2_enivid");
      CutDisableCutscene(iCut, 14.5, 14.5, RESTORE_TYPE_NONE);
      //destroy PC Copy
      CutDestroyPCCopy(14.5,oPC,FALSE);
}

