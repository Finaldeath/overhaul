//::///////////////////////////////////////////////
//:: km_cutsctart1
//:: Copyright (c) 2004 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The first opening cutscene, PC and henchmen see the
    Masked Man for the first time seiging the Cyan keep.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: May 2004
//:://////////////////////////////////////////////
#include "x2_inc_cutscene"

void SetGenericHostile(int iCut);
void GenericCheering(int iCut);

// Standard cutscene start. Best to wrap in a function in the event
// you need to do things before scene starts.
void StartCutscene(object oPC, int iCut);
void StartDialog(object oPC, object oCopyWay);

void main()
{
    // Change to however you get the cutscene activator.
    object oPC = GetFirstPC();
    object oArea = GetArea(oPC);
    // Change to whatever cutscene number you want to use.
    int iCut = 10;

    if (GetLocalInt(oArea, "nDoOnce") != 2)
    {
        // Immediately blacks out screen. Fade in when the scene starts.
        BlackScreen(oPC);

        // Start the scene.
        AssignCommand(GetModule(), StartCutscene(oPC, iCut));
        DelayCommand(20.0, SetLocalInt(oArea, "nDoOnce", 2));
    }
}

//make the monsters hostile to the PC
void SetGenericHostile(int iCut)
{
    int iCounter = 0;
    object oCurrent = GetObjectByTag("KM_GENHOSTILE", iCounter);

    while(oCurrent != OBJECT_INVALID)
    {
        ChangeToStandardFaction(oCurrent, STANDARD_FACTION_HOSTILE);
        oCurrent = GetObjectByTag("KM_GENHOSTILE", iCounter++);
    }

    SetLocalInt(GetModule(), "GENHOSTILE_COUNT", (iCounter - 1));
}

//make the monsters start cheering for the boss
void GenericCheering(int iCut)
{
    int iCounter = 0;
    object oCurrent = GetObjectByTag("KM_GENHOSTILE", iCounter);

    while(oCurrent != OBJECT_INVALID)
    {
        // play one of a few animations
        DelayCommand(IntToFloat(Random(6))/3, SignalEvent(oCurrent, EventUserDefined(4444)));

        oCurrent = GetObjectByTag("KM_GENHOSTILE", iCounter++);
    }
}

void StartCutscene(object oPC, int iCut)
{
    // Setup the scene for the PC. Leave this alone.
//    CutSetActiveCutscene(iCut, CUT_DELAY_TYPE_CONSTANT);
    CutSetActiveCutsceneForObject(oPC, iCut, TRUE);

    // Cutscene objects other than the PC. Define them, then set the cutscene as
    // active on them. This will allow them to be commanded using any cutscene functions
    // in the include.
    location lPCStart = GetLocation(GetObjectByTag("KMCUT_PCSTART"));
    location lCal = GetLocation(GetObjectByTag("KMCUT_CALSTART"));
    location lJab = GetLocation(GetObjectByTag("KMCUT_JOMSTART"));
    location lKai = GetLocation(GetObjectByTag("KMCUT_KAISTART"));
    location lTrp = GetLocation(GetObjectByTag("KMCUT_TRPSTART"));

    object oCal = CreateObject(OBJECT_TYPE_CREATURE, "km_hen_cal",lCal);
    object oJab = CreateObject(OBJECT_TYPE_CREATURE, "km_hen_jab",lJab);
    object oTrp = CreateObject(OBJECT_TYPE_CREATURE, "km_hen_kai",lKai);
    object oKai = CreateObject(OBJECT_TYPE_CREATURE, "km_hen_trp",lTrp);

    SetImmortal(oCal, TRUE);
    SetImmortal(oJab, TRUE);
    SetImmortal(oTrp, TRUE);
    SetImmortal(oKai, TRUE);
    SetImmortal(oPC, TRUE);

    CutSetActiveCutsceneForObject(oCal, iCut);
    CutSetActiveCutsceneForObject(oJab, iCut);
    CutSetActiveCutsceneForObject(oTrp, iCut);
    CutSetActiveCutsceneForObject(oKai, iCut);

    AssignCommand (oPC, ClearAllActions (TRUE));

    // Create a PC Copy in the correct locations
    location lLoc = GetLocation(GetObjectByTag("KMCUT_CLONESTART"));
    object oPCCopy = CutCreatePCCopy(oPC, lLoc, "KM_PC_COPY");
    CutSetActiveCutsceneForObject(oPCCopy, iCut);

    object oMaskedM = GetObjectByTag("km_cutmasked");
    object oDylan = GetObjectByTag("kmcut_dylan");
    AssignCommand(oDylan, ClearAllActions(TRUE));

    CutSetActiveCutsceneForObject(oMaskedM, iCut);
    CutSetActiveCutsceneForObject(oDylan, iCut);

    object oDrow1 = GetObjectByTag("q3_ddrow",0);
    object oDrow2 = GetObjectByTag("q3_ddrow",1);
    object oDrow3 = GetObjectByTag("q2_gatedrow",0);
    object oDrow4 = GetObjectByTag("q2_gatedrow",1);
    object oDrow5 = GetObjectByTag("q2_gatedrow",2);
    object oDrow6 = GetObjectByTag("q2_gatedrow",3);

    CutSetActiveCutsceneForObject(oDrow1, iCut);
    CutSetActiveCutsceneForObject(oDrow2, iCut);
    CutSetActiveCutsceneForObject(oDrow3, iCut);
    CutSetActiveCutsceneForObject(oDrow4, iCut);
    CutSetActiveCutsceneForObject(oDrow5, iCut);
    CutSetActiveCutsceneForObject(oDrow6, iCut);

    //Set the Parties level High :)
    SetXP(oPC,50000);
    SetXP(oCal,50000);
    SetXP(oKai,50000);
    SetXP(oJab,50000);
    SetXP(oTrp,50000);

    int iCounter = 0;
    for(iCounter = 0; iCounter < 9; iCounter++)
    {
        LevelUpHenchman(oPC, CLASS_TYPE_INVALID, TRUE);
        LevelUpHenchman(oCal, CLASS_TYPE_INVALID, TRUE);
        LevelUpHenchman(oKai, CLASS_TYPE_INVALID, TRUE);
        LevelUpHenchman(oJab, CLASS_TYPE_INVALID, TRUE);
        LevelUpHenchman(oTrp, CLASS_TYPE_INVALID, TRUE);
    }

    /////////////////////////////////////////////////////////
    //Continue on with the rest of the cutscene.
    /////////////////////////////////////////////////////////

    CutSetCutsceneMode(1.0, oPC, TRUE, CUT_CAMERA_HEIGHT_HIGH, TRUE, 2);

    CutJumpToLocation(1.5, oPC, lPCStart);
    CutSetCamera(2.0, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 17.0, 75.0,
        CAMERA_TRANSITION_TYPE_SNAP);

    CutFadeFromBlack(2.9, oPC, FADE_SPEED_MEDIUM);

    //CutSpeakString (4.0, oDylan, "''We will not bow to you, villain!''");
    //CutPlaySound(4.0, oPC, "km1_dylan001");

    CutSpeakString (8.0, oMaskedM, "''This will be your final opportunity...''");
    CutSpeakString (12.0, oMaskedM, "''Surrender Cyan. I leave you no other choice.''");
    DelayCommand(8.0, SoundObjectPlay(GetObjectByTag("km1_masked001")));

    CutActionMoveToLocation(17.0f, oPC, lLoc, TRUE);

    CutSetCamera(17.0, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 5.0, 80.0,
        CAMERA_TRANSITION_TYPE_SLOW);

    DelayCommand(18.0, AssignCommand(oMaskedM, SetFacing (270.0f)));
    CutPlayAnimation(19.0f, oMaskedM, ANIMATION_FIREFORGET_VICTORY2, 0.0f);

    CutSpeakString (20.0, oMaskedM, "''The keep shall be ours!''");
    DelayCommand(20.0, SoundObjectPlay(GetObjectByTag("km1_masked002")));

    DelayCommand(22.0, GenericCheering(iCut));
    CutFadeOutAndIn(37.5, oPC, 2.0);

    DelayCommand(38.0, AddHenchman(oPC, oCal));
    DelayCommand(38.0, ForceRest(oCal));
    DelayCommand(38.1, AddHenchman(oPC, oJab));
    DelayCommand(38.1, ForceRest(oJab));
    DelayCommand(38.2, AddHenchman(oPC, oTrp));
    DelayCommand(38.2, ForceRest(oTrp));
    DelayCommand(38.3, AddHenchman(oPC, oKai));
    DelayCommand(38.3, ForceRest(oKai));

    DelayCommand(38.4, ForceRest(oPC));

    DelayCommand(38.5, SetGenericHostile(iCut));

    CutJumpToLocation(38.6, oPC, lLoc);
    CutDestroyPCCopy(38.7,oPC,FALSE);
    CutDisableCutscene(iCut, 38.7, 38.7, RESTORE_TYPE_NONE);

    DelayCommand(39.0, AssignCommand(oPC,
        SetCameraFacing(90.0, 15.0, 65.0)));
    DelayCommand(39.0, SetLocalInt(GetModule(), "CUTSCENE_2", TRUE));
}

