//::///////////////////////////////////////////////
//:: os_cut_death
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The opening cutscene, where the player and his companions die
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////
#include "x2_inc_cutscene"

// Standard cutscene start. Best to wrap in a function in the event
// you need to do things before scene starts.
void StartCutscene(object oPC, int iCut);

void StartDialog(object oPC, object oCopyWay);

void DestroyPCInventory(object oPC)
{

    object oIllithidChest = GetObjectByTag("q3_mw_chest");
    object oPCItem = GetFirstItemInInventory(oPC);
    while (oPCItem != OBJECT_INVALID)
    {
        CopyItem(oPCItem, oIllithidChest, TRUE);
        SetPlotFlag(oPCItem,FALSE);
        DestroyObject(oPCItem, 7.5);
        oPCItem = GetNextItemInInventory(oPC);
    }
}

void main()
{
    // Change to however you get the cutscene activator.
    object oPC = GetFirstPC();
    object oArea = GetArea(oPC);
    // Change to whatever cutscene number you want to use.
    int iCut = 10;

    // Usually check to see if PC is firing the scene.
//    if(GetIsPC(oPC))
//    {
        // Do once
        if (GetLocalInt(oArea, "nDoOnce") != 1)
        {
            // Immediately blacks out screen. Fade in when the scene starts.
            BlackScreen(oPC);
            SetLocalInt(oArea, "nDoOnce", 1);

            // Do any pre-cutscene stuff here.
            //

            // Start the scene.
            StartCutscene(oPC, iCut);
        }
//    }
}

void StartCutscene(object oPC, int iCut)
{
    // Setup the scene for the PC. Leave this alone.
    CutSetActiveCutscene(iCut, CUT_DELAY_TYPE_CONSTANT);
    CutSetActiveCutsceneForObject(oPC, iCut, TRUE);

    // Cutscene objects other than the PC. Define them, then set the cutscene as
    // active on them. This will allow them to be commanded using any cutscene functions
    // in the include.
    object oCal = GetObjectByTag("os_cut_cal");
    CutSetActiveCutsceneForObject(oCal, iCut);
    object oJab = GetObjectByTag("os_cut_jab");
    CutSetActiveCutsceneForObject(oJab, iCut);
    object oKai = GetObjectByTag("os_cut_kai");
    CutSetActiveCutsceneForObject(oKai, iCut);
    object oTrp = GetObjectByTag("os_cut_trp");
    CutSetActiveCutsceneForObject(oTrp, iCut);
    object oDoor = GetNearestObjectByTag("EvilStoneDoor");
    CutSetActiveCutsceneForObject(oDoor, iCut);

    //create monsters
    location lDrow = GetLocation(GetObjectByTag("q3_way_ddrow"));
    object oDrow = CreateObject(OBJECT_TYPE_CREATURE, "q3_ddrow",lDrow);
    CutSetActiveCutsceneForObject(oDrow, iCut);

    location lOrc = GetLocation(GetObjectByTag("q3_way_dorc"));
    location lGoblin = GetLocation(GetObjectByTag("q3_way_dgoblin"));
    location lKobold = GetLocation(GetObjectByTag("q3_way_dkobold"));
    location lOgre = GetLocation(GetObjectByTag("q3_way_dogre"));
    location lHob = GetLocation(GetObjectByTag("q3_way_dhobgob"));

    object oOrc1 = CreateObject(OBJECT_TYPE_CREATURE, "q3_dorc",lOrc);
    object oOrc2 = CreateObject(OBJECT_TYPE_CREATURE, "q3_dorc",lGoblin);
    object oOrc3 = CreateObject(OBJECT_TYPE_CREATURE, "q3_dorc",lKobold);
    object oOrc4 = CreateObject(OBJECT_TYPE_CREATURE, "q3_dorc",lOgre);
    object oOrc5 = CreateObject(OBJECT_TYPE_CREATURE, "q3_dorc",lHob);
    CutSetActiveCutsceneForObject(oOrc1, iCut);
    CutSetActiveCutsceneForObject(oOrc2, iCut);
    CutSetActiveCutsceneForObject(oOrc3, iCut);
    CutSetActiveCutsceneForObject(oOrc4, iCut);
    CutSetActiveCutsceneForObject(oOrc5, iCut);

    object oGoblin1 = CreateObject(OBJECT_TYPE_CREATURE, "q3_dgoblin",lGoblin);
    object oShaman = CreateObject(OBJECT_TYPE_CREATURE, "q3_dgoblinshaman",lGoblin);
    object oGoblin2 = CreateObject(OBJECT_TYPE_CREATURE, "q3_dgoblin",lOrc);
    object oGoblin3 = CreateObject(OBJECT_TYPE_CREATURE, "q3_dgoblin",lOgre);
    object oGoblin4 = CreateObject(OBJECT_TYPE_CREATURE, "q3_dgoblin",lHob);
    object oGoblin5 = CreateObject(OBJECT_TYPE_CREATURE, "q3_dgoblin",lKobold);
    CutSetActiveCutsceneForObject(oGoblin1, iCut);
    CutSetActiveCutsceneForObject(oShaman, iCut);
    CutSetActiveCutsceneForObject(oGoblin2, iCut);
    CutSetActiveCutsceneForObject(oGoblin3, iCut);
    CutSetActiveCutsceneForObject(oGoblin4, iCut);
    CutSetActiveCutsceneForObject(oGoblin5, iCut);

    object oKobold1 = CreateObject(OBJECT_TYPE_CREATURE, "q3_dkobold",lKobold);
    object oArcher = CreateObject(OBJECT_TYPE_CREATURE, "q3_dkoboldarcher",lKobold);
    object oKobold2 = CreateObject(OBJECT_TYPE_CREATURE, "q3_dkobold",lHob);
    object oKobold3 = CreateObject(OBJECT_TYPE_CREATURE, "q3_dkobold",lOrc);
    object oKobold4 = CreateObject(OBJECT_TYPE_CREATURE, "q3_dkobold",lGoblin);
    object oKobold5 = CreateObject(OBJECT_TYPE_CREATURE, "q3_dkobold",lOgre);
    CutSetActiveCutsceneForObject(oKobold1, iCut);
    CutSetActiveCutsceneForObject(oArcher, iCut);
    CutSetActiveCutsceneForObject(oKobold2, iCut);
    CutSetActiveCutsceneForObject(oKobold3, iCut);
    CutSetActiveCutsceneForObject(oKobold4, iCut);
    CutSetActiveCutsceneForObject(oKobold5, iCut);

    object oOgre1 = CreateObject(OBJECT_TYPE_CREATURE, "q3_dogre",lOgre);
    object oOgre2 = CreateObject(OBJECT_TYPE_CREATURE, "q3_dogre",lKobold);
    object oOgre3 = CreateObject(OBJECT_TYPE_CREATURE, "q3_dogre",lHob);
    object oOgre4 = CreateObject(OBJECT_TYPE_CREATURE, "q3_dogre",lOrc);
    object oOgre5 = CreateObject(OBJECT_TYPE_CREATURE, "q3_dogre",lGoblin);
    CutSetActiveCutsceneForObject(oOgre1, iCut);
    CutSetActiveCutsceneForObject(oOgre2, iCut);
    CutSetActiveCutsceneForObject(oOgre3, iCut);
    CutSetActiveCutsceneForObject(oOgre4, iCut);
    CutSetActiveCutsceneForObject(oOgre5, iCut);

    object oHob1 = CreateObject(OBJECT_TYPE_CREATURE, "q3_dhobgoblin",lHob);
    object oHob2 = CreateObject(OBJECT_TYPE_CREATURE, "q3_dhobgoblin",lOgre);
    object oHob3 = CreateObject(OBJECT_TYPE_CREATURE, "q3_dhobgoblin",lGoblin);
    object oHob4 = CreateObject(OBJECT_TYPE_CREATURE, "q3_dhobgoblin",lKobold);
    object oHob5 = CreateObject(OBJECT_TYPE_CREATURE, "q3_dhobgoblin",lOrc);
    CutSetActiveCutsceneForObject(oHob1, iCut);
    CutSetActiveCutsceneForObject(oHob2, iCut);
    CutSetActiveCutsceneForObject(oHob3, iCut);
    CutSetActiveCutsceneForObject(oHob4, iCut);
    CutSetActiveCutsceneForObject(oHob5, iCut);

    object oJabWay = GetObjectByTag("q3ai_way_deadjab");
    object oCalWay = GetObjectByTag("q3ai_way_deadcal");
    object oKaiWay = GetObjectByTag("q3ai_way_deadkai");
    object oCopyWay = GetObjectByTag("q3_way_dcopy2");
    object oCamJab = GetObjectByTag("q3_way_camjab");
    object oCamCal = GetObjectByTag("q3_way_camcal");
    object oCamKai = GetObjectByTag("q3_way_camkai");
    object oCamTrp = GetObjectByTag("q3_way_camtrp");
    object oCamCopy = GetObjectByTag("q3_way_camcopy");
    object oWay = GetObjectByTag("q3_way_dcentral");
    object oTrpWay = GetObjectByTag("q3ai_way_deadtrp");
    object oOgre1Way = GetObjectByTag("q3_way_ogre1");
    object oOgre2Way = GetObjectByTag("q3_way_ogre2");
    object oOgre3Way = GetObjectByTag("q3_way_ogre3");
    object oOgre4Way = GetObjectByTag("q3_way_ogre4");

    location lJab1 = GetLocation(GetObjectByTag("q3_way_jabexp"));
    location lKai1 = GetLocation(GetObjectByTag("q3_way_kaiexp"));
    location lTrp1 = GetLocation(GetObjectByTag("q3_way_trpexp"));
    location lCal1 = GetLocation(GetObjectByTag("q3_way_calexp"));
    location lExp1 = GetLocation(GetObjectByTag("q3_way_pcexp"));

    //objects in the cutscene but hidden
    object oHidden = GetObjectByTag("q3ai_way_hench");
    location lHidden = GetLocation(oHidden);
    object oFire = CreateObject(OBJECT_TYPE_CREATURE,"q3_dfireelement",lHidden);
    object oLight = CreateObject(OBJECT_TYPE_CREATURE,"q3_dmessage",lHidden);
//    object oLight = CreateObject(OBJECT_TYPE_PLACEABLE,"q3ai_mw_intro",lHidden);
    CutSetActiveCutsceneForObject(oFire, iCut);
    CutSetActiveCutsceneForObject(oLight, iCut);

    AssignCommand(oTrp,ClearAllActions());
    AssignCommand(oTrp,JumpToObject(oCopyWay));

    // PC Copy. Uncomment if needed. Define the loc where you want to create it.
    location lLoc = GetLocation(GetObjectByTag("q3_way_dcopy1"));
    object oPCCopy = CutCreatePCCopy(oPC, lLoc, "OS_PC_COPY");
    CutSetActiveCutsceneForObject(oPCCopy, iCut);

    // Waypoint for start. Good idea to jump the PC to where you want at the start.
    location lPCStart = GetLocation(GetObjectByTag("q3_way_dpc1"));

    /////////////////////////////////////////////////////////
    //Now that the clone's been created, we can strip the player's items & gold.
    /////////////////////////////////////////////////////////

    //Clear actions
    AssignCommand (oPC, ClearAllActions (TRUE));

    //Unequip their items
    int iInventorySlot = 0;
    object oUnequip;
    while (iInventorySlot < 18)
    {
        oUnequip = GetItemInSlot(iInventorySlot, oPC);
        AssignCommand(oPC,ActionUnequipItem(oUnequip));
        iInventorySlot++;
    }

    //Parse through their inventory and copy all items into the Illithid's
    //Chest at the end of the module before deleting the originals.
    DelayCommand(1.0,DestroyPCInventory(oPC));

    //Delete their gold.
    int iPCGold = GetGold(oPC);
    AssignCommand(oPC, TakeGoldFromCreature(iPCGold, OBJECT_SELF, TRUE));

    //Add some ragged clothes to the player if you wish
    object oClothes = CreateItemOnObject("os_cut_rags", oPC);
    AssignCommand(oPC, CutActionEquipItem(0.1, oPC, oClothes, INVENTORY_SLOT_CHEST));

    //Set Player to level 1.
    SetXP(oPC,0);

    /////////////////////////////////////////////////////////
    //Continue on with the rest of the cutscene.
    /////////////////////////////////////////////////////////

    //
    // Setup the cutscene. Times should stay. Read function comments for more details.
    //
    CutSetCutsceneMode(1.1, oPC, TRUE, CUT_CAMERA_HEIGHT_LOW, TRUE, 2);

    // Starting camera.
    // Adjust the camera how you see fit. Best to do a snap here while screen
    // is black to get your "starting" camera.
    CutSetCamera(2.2, oPC, CAMERA_MODE_TOP_DOWN, 315.0, 6.0, 75.0,
               CAMERA_TRANSITION_TYPE_SNAP);
    CutJumpToLocation(2.3, oPC, lPCStart);

    // Fade in so we can start the scene.
    CutFadeFromBlack(2.5, oPC, FADE_SPEED_MEDIUM);

    // Start the scene.
    // This is where all your action takes place. Do PC movements, spells, dialog,
    // fighting, camera movements, etc, here.

    //the group moves to the centre area of the room
    object oCalWay1 = GetObjectByTag("q3_way_dcalibast");
    object oKaiWay1 = GetObjectByTag("q3_way_dkaidala");
    object oJabWay1 = GetObjectByTag("q3_way_djaboli");
    CutActionOpenDoor(2.3,oDoor,oDoor);
    CutActionMoveToObject(2.8,oKai,oKaiWay1,TRUE);
    CutActionMoveToObject(2.9,oCal,oCalWay1,TRUE);
    CutActionMoveToObject(3.0,oJab,oJabWay1,TRUE);
    CutActionMoveToObject(3.1,oPCCopy,oWay,TRUE);

    //the good guys gasp
    CutSpeakString(7.5,oJab,"Gods preserve us.");
    CutSpeakString(8.0,oCal,"We can take them!");

    //the camera pans around to see the badguys
    CutSetCamera(10.0, oPC, CAMERA_MODE_TOP_DOWN, 135.0, 10.0, 75.0,
               CAMERA_TRANSITION_TYPE_MEDIUM);


    //fades as the scene is set up again
    CutFadeToBlack(17.0,oPC);

    //reset scenes

    CutClearAllActions(17.9,oJab,TRUE);
    CutClearAllActions(17.9,oCal,TRUE);
    CutClearAllActions(17.9,oKai,TRUE);

    CutClearAllActions(17.9,oPCCopy,TRUE);
    CutJumpToObject(18.0,oJab,oJabWay);
    CutJumpToObject(18.0,oCal,oCopyWay);
    CutJumpToObject(18.0,oKai,oCopyWay);
    CutJumpToObject(18.0,oPCCopy,oCopyWay);

    object oDrowJab = GetObjectByTag("q3_way_ddrowjab");
    object oShamanWay = GetObjectByTag("q3_way_dshaman");
    object oArcherWay = GetObjectByTag("q3_way_darcher");

    CutJumpToObject(18.0,oShaman,oShamanWay);
    CutJumpToObject(18.0,oDrow,oDrowJab);
    CutJumpToObject(18.0,oArcher,oArcherWay);

    CutJumpToObject(18.0,oGoblin1,oJabWay);
    CutJumpToObject(18.0,oOrc2,oJabWay);
    CutJumpToObject(18.0,oOrc1,oJabWay);
    CutJumpToObject(18.0,oHob1,oJabWay);
    CutJumpToObject(18.0,oOrc3,oJabWay);

    //fade back at Jaboli's death
    CutSetCamera(22.2, oPC, CAMERA_MODE_TOP_DOWN, 85.0, 9.0, 75.0,
               CAMERA_TRANSITION_TYPE_SNAP);
    CutJumpToObject(22.3,oPC,oCamJab);
    CutActionAttack(22.3,oGoblin1,oJab);
    CutActionAttack(22.3,oOrc1,oJab);
    CutActionAttack(22.3,oOrc2,oJab);
    CutActionAttack(22.3,oHob1,oJab);
    CutActionAttack(22.3,oOrc3,oJab);
    CutActionAttack(22.3,oJab,oHob1);

    CutFadeFromBlack(22.5,oPC);

    //should be flashy, with magic spells killing a number of weaker creatures.
    CutClearAllActions(24.0,oJab,TRUE);
    CutActionCastFakeSpellAtLocation(26.0,SPELL_CLOUDKILL,oJab,GetLocation(oJab));
    CutApplyEffectAtLocation(28.3, oPC, DURATION_TYPE_INSTANT,
        VFX_FNF_FIREBALL,lJab1, 0.0);
    CutDeath(28.5,oGoblin1,TRUE);
    CutDeath(28.5,oOrc1,TRUE);
    CutClearAllActions(28.5,oJab,TRUE);
    CutActionCastFakeSpellAtLocation(30.0,SPELL_ICE_STORM,oJab,GetLocation(oJab));
    CutApplyEffectAtLocation(31.0,oPC,DURATION_TYPE_INSTANT,VFX_FNF_ICESTORM,
        GetLocation(oJab));
    CutDeath(33.5,oOrc2,TRUE);
    CutDeath(33.5,oHob1,TRUE);
    CutDeath(33.5,oOrc3,TRUE);
    //Then flash to the drow, who yells, "She's a Rakshasa, fools! Use blessed
    //crossbow bolts!" Show a goblin shaman cast a spell on an archer, and
    //then Jaboli dies in a dramatic explosion.
    CutSetCamera(34.5, oPC, CAMERA_MODE_TOP_DOWN, 315.0, 5.0, 75.0,
               CAMERA_TRANSITION_TYPE_SNAP);
    CutSpeakString(35.5,oDrow,"She's a rakshasa, fools! Use blessed crossbow bolts!");
    CutActionCastFakeSpellAtObject(36.5,SPELL_BLESS,oShaman,oArcher);

    CutSetCamera(39.0, oPC, CAMERA_MODE_TOP_DOWN, 85.0, 7.0, 75.0,
               CAMERA_TRANSITION_TYPE_SNAP);
    CutApplyEffectToObject(40.0,DURATION_TYPE_INSTANT,VFX_FNF_STRIKE_HOLY,oJab);
    CutDeath(40.5,oJab,TRUE);

    //Trip's death
    object oDrowTrp = GetObjectByTag("q3_way_ddrowtrp");
    object oKobTrp = GetObjectByTag("q3_way_dkobtrp");
    object oOgreTrp = GetObjectByTag("q3_way_ogretrp");
    CutFadeToBlack(41.5,oPC);
    CutJumpToObject(42.0,oTrp,oCamTrp);
    //gets rid of objects from previous fight
    CutDestroyObject(42.0,oShaman);
    CutDestroyObject(42.0,oArcher);
    CutSetCamera(43.2, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 10.0, 75.0,
               CAMERA_TRANSITION_TYPE_SNAP);
    CutJumpToObject(43.3,oPC,oCamTrp);
    CutJumpToObject(43.3,oDrow,oDrowTrp);
    CutFadeFromBlack(43.5,oPC);
    //- is running for an exit, when four kobolds jump out in front of him.
    CutActionMoveToObject(43.5,oTrp,oTrpWay,TRUE);
    CutJumpToObject(44.0,oKobold1,oKobTrp);
    CutJumpToObject(44.0,oKobold2,oKobTrp);
    CutJumpToObject(44.0,oKobold3,oKobTrp);
    CutJumpToObject(44.0,oKobold4,oKobTrp);
    //He squeaks an "Eek!" then attacks them.
    CutSpeakString(44.5,oTrp,"Eek!");
    CutActionAttack(45.0,oTrp,oKobold4);
    CutActionAttack(45.5,oKobold1,oTrp);
    CutActionAttack(45.5,oKobold2,oTrp);
    CutActionAttack(45.5,oKobold3,oTrp);
    CutActionAttack(45.5,oKobold4,oTrp);
    //Flash to the drow who says, "Squish the rat!"
    CutSpeakString(52.0,oDrow,"Squish the rat!");
    //Flash back to Trip who kills a kobold;
    //flash to an ogre, lumbering grimly up behind Trip,
    CutJumpToObject(54.3,oOgre1,oOgreTrp);
    CutActionMoveToObject(54.5,oOgre1,oTrp,FALSE);
    CutDeath(56.0,oKobold4,FALSE);
    //flash to Trip killing the rest of the kobolds, shouting "Trip wins!"
    CutActionAttack(56.1,oTrp,oKobold2);
    CutApplyEffectAtLocation(56.5, oPC, DURATION_TYPE_INSTANT,
        VFX_FNF_FIREBALL,lTrp1, 0.0);
    CutDeath(57.0,oKobold2,FALSE);
    CutDeath(58.0,oKobold3,FALSE);
    CutDeath(59.0,oKobold1,FALSE);
    CutSpeakString(59.5,oTrp,"Trip wins!");
    //Then the ogre smashes him and he dies.
    CutActionAttack(60.0,oOgre1,oTrp);
    CutDeath(61.5,oTrp,FALSE);

    //Kaidala's death
    object oDrowKai = GetObjectByTag("q3_way_ddrowkai");
    object oCamKai2 = GetObjectByTag("q3_way_camkai2");
    object oDrowFire = GetObjectByTag("q3_way_ddrowfire");
    location lDrowFire = GetLocation(oDrowFire);
    location lKai = GetLocation(oKaiWay);
    CutFadeToBlack(63.0,oPC);
    CutJumpToObject(64.2,oKai,oKaiWay);
    CutJumpToObject(64.2,oKobold5,oKaiWay);
    CutJumpToObject(64.2,oGoblin2,oKaiWay);
    CutJumpToObject(64.2,oOrc4,oKaiWay);
    CutJumpToObject(64.2,oHob2,oKaiWay);
    CutJumpToObject(64.2,oDrow,oDrowKai);
    //show her battling a bunch of small creatures,
    CutActionAttack(64.3,oKai,oKobold5);
    CutActionAttack(64.3,oKobold5,oKai);
    CutActionAttack(64.3,oGoblin2,oKai);
    CutActionAttack(64.3,oOrc4,oKai);
    CutActionAttack(64.3,oHob2,oKai);
    CutSetCamera(65.2, oPC, CAMERA_MODE_TOP_DOWN, 225.0, 10.0, 75.0,
               CAMERA_TRANSITION_TYPE_SNAP);
    CutJumpToObject(65.3,oPC,oCamKai2);
    CutFadeFromBlack(65.5,oPC);

    //flash to the drow. He yells, "Show scar face a little fire!"
//    CutFadeToBlack(70.0,oPC);
    CutDeath(68.0,oKobold5,FALSE);
    CutApplyEffectAtLocation(68.5, oPC, DURATION_TYPE_INSTANT,
        VFX_FNF_FIREBALL,lKai1, 0.0);
    CutDeath(69.0,oGoblin2,FALSE);
//    CutSetCamera(72.2, oPC, CAMERA_MODE_TOP_DOWN, 225.0, 5.0, 75.0,
//               CAMERA_TRANSITION_TYPE_SNAP);
//    CutJumpToObject(72.3,oPC,oCamKai2);
//    CutFadeFromBlack(72.5,oPC);
    CutSpeakString(70.0,oDrow,"Show scarface a little fire!");

    //Have the drow conjure a fire elemental that moves towards Kaidala.
    CutActionCastFakeSpellAtLocation(71.0,SPELL_SUMMON_CREATURE_V,oDrow,lDrowFire);
    CutApplyEffectAtLocation(73.0,oPC,DURATION_TYPE_INSTANT,
        VFX_FNF_SUMMON_MONSTER_3,lDrowFire);
    CutJumpToObject(73.5,oFire,oDrowFire);
    CutActionMoveToObject(73.9,oFire,oKai,TRUE);
    //She screams, "Gods no!" and she is killed in a big, fiery blast.
//    CutFadeToBlack(78.0,oPC);
    CutDeath(73.9,oOrc4,FALSE);
    CutDeath(73.9,oHob2,FALSE);
//    CutSetCamera(81.2, oPC, CAMERA_MODE_TOP_DOWN, 225.0, 10.0, 75.0,
//               CAMERA_TRANSITION_TYPE_SNAP);
//    CutJumpToObject(81.3,oPC,oCamKai);
//    CutFadeFromBlack(81.5,oPC);
    CutSpeakString(75.5,oKai,"Gods, no!");
    CutApplyEffectAtLocation(77.0,oPC,DURATION_TYPE_INSTANT,VFX_FNF_FIREBALL,lKai);
    CutDeath(78.0,oKai,FALSE);

    //Calibast's death
    object oDrowCal = GetObjectByTag("q3_way_ddrowcal");
    CutFadeToBlack(79.0,oPC);
    CutClearAllActions(80.0,oDrow,TRUE);
    CutJumpToObject(80.1,oDrow,oDrowCal);
    CutJumpToObject(80.1,oCal,oCalWay);
    CutJumpToObject(80.1,oOrc5,oCalWay);
    CutJumpToObject(80.1,oHob3,oCalWay);
    CutJumpToObject(80.1,oHob4,oCalWay);
    CutJumpToObject(80.1,oHob5,oCalWay);
    CutJumpToObject(80.1,oOgre1,oCalWay);
    CutJumpToObject(80.1,oPC,oCamCal);
    //he should be surrounded by many dead bodies and is fighting an ogre.
    CutDeath(80.2,oOrc5,FALSE);
    CutDeath(80.2,oHob3,FALSE);
    CutDeath(80.2,oHob4,FALSE);
    CutDeath(80.2,oHob5,FALSE);
    //clean up from Kaidala's death
    CutDestroyObject(81.0,oFire);
    CutSetCamera(81.2, oPC, CAMERA_MODE_TOP_DOWN, 180.0, 10.0, 75.0,
               CAMERA_TRANSITION_TYPE_SNAP);
    CutActionAttack(81.3,oOgre1,oCal);
    CutActionAttack(81.3,oCal,oOgre1);
    CutFadeFromBlack(81.5,oPC);
    //Let him kill the ogre
    CutApplyEffectAtLocation(82.0, oPC, DURATION_TYPE_INSTANT,
        VFX_FNF_FIREBALL,lCal1, 0.0);
    CutDeath(83.0,oOgre1,FALSE);
    //then get hit by a series of spell blasts from the drow
    //(not fire!), including ice, lightning, etc.
    CutActionCastFakeSpellAtObject(83.5,SPELL_ICE_DAGGER,oDrow,oCal);
//vfx?
//    CutActionCastFakeSpellAtObject(95.0,SPELL_LIGHTNING_BOLT,oDrow,oCal);
//    CutApplyEffectAtLocation(96.5,oCal,DURATION_TYPE_INSTANT,VFX_IMP_LIGHTNING_S,GetLocation(oCal));
//    CutActionCastFakeSpellAtObject(97.0,SPELL_EVARDS_BLACK_TENTACLES,oDrow,oCal);
//vfx?
    //Calibast dies.
    CutDeath(86.0,oCal,FALSE);

    //the 'pc's' death
    object oDrowCopy = GetObjectByTag("q3_way_ddrowcopy");
    object oGobWay1 = GetObjectByTag("q3_way_dgob1");
    object oGobWay2 = GetObjectByTag("q3_way_dgob2");
    object oGobWay3 = GetObjectByTag("q3_way_dgob3");
    CutFadeToBlack(87.0,oPC);
    CutJumpToObject(87.5,oDrow,oDrowCopy);
    CutJumpToObject(87.5,oGoblin3,oGobWay1);
    CutJumpToObject(87.5,oGoblin4,oGobWay2);
    CutJumpToObject(87.5,oGoblin5,oGobWay3);
    CutJumpToObject(87.5,oOgre2,oOgre1Way);
    CutJumpToObject(87.5,oOgre3,oOgre2Way);
    CutJumpToObject(87.5,oOgre4,oOgre3Way);
    CutJumpToObject(87.5,oOgre5,oOgre4Way);
    CutDeath(87.6,oOgre2,FALSE);
    CutDeath(87.6,oOgre3,FALSE);
    CutDeath(87.6,oOgre4,FALSE);
    CutDeath(87.6,oOgre5,FALSE);
    CutSetCamera(89.2, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 10.0, 75.0,
               CAMERA_TRANSITION_TYPE_SNAP);
    CutJumpToObject(89.3,oPC,oCamCopy);
    CutFadeFromBlack(90.0,oPC);
    //the last to go, the PC should yell, "No!"
    CutSpeakString(91.5,oPCCopy,"No!");
    //Then he/she should run at the drow wizard and kill him.
    CutActionAttack(92.0,oPCCopy,oDrow);
    CutActionAttack(93.0,oDrow,oPCCopy);
    CutApplyEffectAtLocation(95.0, oPC, DURATION_TYPE_INSTANT,
        VFX_FNF_FIREBALL,lExp1, 0.0);
    CutDeath(96.0,oDrow,FALSE);
    //One of the goblins should then shout,
    //"It kills the master's favorite! Collapse tunnel!"
    CutSpeakString(98.0,oGoblin3,"It kills the master's favorite! Collapse tunnel!");
    //Show several creatures bash at something (invisible object? Barrels?)
    //near the walls, then have the massive blocks of earth collapse on the PC.
    CutPlayAnimation(99.0,oGoblin3,ANIMATION_LOOPING_WORSHIP,4.0);
    CutPlayAnimation(99.0,oGoblin4,ANIMATION_LOOPING_WORSHIP,4.0);
    CutPlayAnimation(99.0,oGoblin5,ANIMATION_LOOPING_WORSHIP,4.0);
    CutApplyEffectAtLocation(101.0,oPC,DURATION_TYPE_INSTANT,VFX_FNF_SUMMON_GATE,
        GetLocation(oGoblin3));
    CutApplyEffectAtLocation(101.0,oPC,DURATION_TYPE_INSTANT,VFX_FNF_SUMMON_GATE,
        GetLocation(oGoblin4));
    CutApplyEffectAtLocation(101.0,oPC,DURATION_TYPE_INSTANT,VFX_FNF_SUMMON_GATE,
        GetLocation(oGoblin5));
    //rocks fall on the PC
    //353 //VFX_COM_CHUNK_STONE_SMALL
    //354 //VFX_COM_CHUNK_STONE_MEDIUM
    //137 //VFX_IMP_ROCKSUP
    CutApplyEffectAtLocation(103.0,oPC,DURATION_TYPE_TEMPORARY,354,
        GetLocation(oGobWay1),4.0);
    CutApplyEffectAtLocation(103.0,oPC,DURATION_TYPE_TEMPORARY,354,
        GetLocation(oGobWay2),4.0);
    CutApplyEffectAtLocation(103.0,oPC,DURATION_TYPE_TEMPORARY,354,
        GetLocation(oGobWay3),4.0);
    CutApplyEffectAtLocation(103.0,oPC,DURATION_TYPE_TEMPORARY,354,
        GetLocation(oCopyWay),4.0);
    //the PC is lying on his back, as if dead
    CutPlayAnimation(104.0,oPCCopy,ANIMATION_LOOPING_DEAD_BACK,20.0);
    CutDeath(104.0,oGoblin3,TRUE);
    CutDeath(104.0,oGoblin4,TRUE);
    CutDeath(104.0,oGoblin5,TRUE);
    CutFadeToBlack(105.5,oPC);
    //move camera
    CutJumpToObject(106.2, oLight, oCopyWay);
    CutSetCamera(106.2, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 5.0, 90.0,
               CAMERA_TRANSITION_TYPE_SNAP);
    CutFadeFromBlack(108.5,oPC);
    //something speaks
    CutSpeakString(111.5,oLight,"Wake up!");
    CutSpeakString(112.5,oLight,"You must wake up, please!");

    // End scene. Change times and parameters accordingly.
    // What should stay: The time difference between Fade and Disable, and the
    // fade length (1.5). These produce the best results.
    CutFadeOutAndIn(113.5, oPC, 1.5);
    CutJumpToObject(113.5, oPC, oCopyWay);
    CutDestroyObject(113.5,oLight);
    CutDestroyPCCopy(113.5,oPC,FALSE);

    //Start conversation with the weapon
    DelayCommand(113.5, StartDialog(oPC, oCopyWay));

    //End the cutscene
    CutDisableCutscene(iCut, 114.0, 114.0, RESTORE_TYPE_NONE);
}

// Change to be whatever you need.
void StartDialog(object oPC, object oCopyWay)
{
    object oMagicW;
    oMagicW = CreateObject( OBJECT_TYPE_PLACEABLE, "q3ai_mw_intro", GetLocation(oCopyWay), FALSE);
    DelayCommand(1.0, AssignCommand(oMagicW, ActionStartConversation(oPC)));
}
