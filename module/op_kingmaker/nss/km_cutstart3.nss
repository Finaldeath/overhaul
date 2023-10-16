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
#include "inc_remeffect"

// Standard cutscene start. Best to wrap in a function in the event
// you need to do things before scene starts.
void StartCutscene(object oPC, int iCut);

void main()
{
    // Change to however you get the cutscene activator.
    object oPC = GetFirstPC();
    object oArea = GetArea(oPC);

    // Change to whatever cutscene number you want to use.
    int iCut = 30;

    if ((GetLocalInt(GetModule(), "KM_CUT3") == 1)
    && (GetIsPC(oPC) == TRUE))
    {
        // Immediately blacks out screen. Fade in when the scene starts.
        BlackScreen(oPC);
        RemovePoly(oPC);

        // Start the scene.
        AssignCommand(GetModule(), StartCutscene(oPC, iCut));
        SetLocalInt(GetModule(), "KM_CUT3", 2);
    }
    else if (GetLocalInt(GetModule(), "KM_CUT3") == 2)
    {
        FloatingTextStringOnCreature("You should speak to Dylan to enter the keep.", oPC);
    }
    else
    {
        FloatingTextStringOnCreature("Your ghostly hand reaches for the gate but some strange force repels it.", oPC);
    }
}

void StartCutscene(object oPC, int iCut)
{
    // Setup the scene for the PC. Leave this alone.
    CutSetActiveCutscene(iCut, CUT_DELAY_TYPE_CONSTANT);
    CutSetActiveCutsceneForObject(oPC, iCut, TRUE);

    // Cutscene objects other than the PC. Define them, then set the cutscene as
    // active on them. This will allow them to be commanded using any cutscene functions
    // in the include.
    location lPCClone = GetLocation(GetObjectByTag("KM_CUT3_STARTCLONE1"));
    location lPCStart = GetLocation(GetObjectByTag("KM_CUT3_STARTPC1"));
    location lHench1 = GetLocation(GetObjectByTag("KM_CUT3_HENCH1"));
    location lHench2 = GetLocation(GetObjectByTag("KM_CUT3_HENCH2"));
    location lDylan1 = GetLocation(GetObjectByTag("KM_CUT3_DYLAN1"));
    location lDane1 = GetLocation(GetObjectByTag("KM_CUT3_DANE1"));
    location lDylan2 = GetLocation(GetObjectByTag("KM_CUT3_DYLAN2"));
    location lDane2 = GetLocation(GetObjectByTag("KM_CUT3_DANE2"));
    location lDane3 = GetLocation(GetObjectByTag("KM_CUT3_DANE3"));

    object oHench1 = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC, 1);
    object oHench2 = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC, 2);
    object oDylan = CreateObject(OBJECT_TYPE_CREATURE, "km_cut_dylan", lDylan1);
    object oDane = CreateObject(OBJECT_TYPE_CREATURE, "km_cut_dane", lDane1);

    CutSetActiveCutsceneForObject(oHench1, iCut);
    CutSetActiveCutsceneForObject(oHench2, iCut);
    CutSetActiveCutsceneForObject(oDylan, iCut);
    CutSetActiveCutsceneForObject(oDane, iCut);

    AssignCommand (oPC, ClearAllActions (TRUE));

    CutJumpToLocation(0.5, oPC, lPCStart);
    CutJumpToLocation(0.5, oHench1, lHench1);
    CutJumpToLocation(0.5, oHench2, lHench2);

    // Create a PC Copy in the correct locations
    location lLoc = lPCStart;
    object oPCCopy = CutCreatePCCopy(oPC, lLoc, "KM_PC_COPY");
    CutSetActiveCutsceneForObject(oPCCopy, iCut);


    /////////////////////////////////////////////////////////
    //Continue on with the rest of the cutscene.
    /////////////////////////////////////////////////////////

    CutSetCutsceneMode(1.0, oPC, TRUE, CUT_CAMERA_HEIGHT_VERY_HIGH, TRUE, FALSE);

    CutJumpToLocation(1.5, oPC, lPCStart);
    CutSetCamera(2.0, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 17.0, 75.0,
        CAMERA_TRANSITION_TYPE_SNAP);

    CutSetCamera(2.5, oPC, CAMERA_MODE_TOP_DOWN, 80.0, 20.0, 50.0,
        CAMERA_TRANSITION_TYPE_SLOW);

    CutFadeFromBlack(3.0, oPC, FADE_SPEED_MEDIUM);

    CutActionMoveToLocation(4.0, oDylan, lDylan2, FALSE);

    DelayCommand(6.0, AssignCommand(oDylan,
        SpeakString("''Something's down below. Stay back from the edge, Momma Dane.''")));

    CutActionMoveToLocation(7.0, oDylan, lDylan2, TRUE);

    CutActionMoveToLocation(6.50, oDane, lDane2, FALSE);

    DelayCommand(10.0, AssignCommand(oDane,
        SpeakString("''Nonsense, Dylan. What monster would attack twice in the same night?''")));

    CutActionMoveToLocation(14.0, oDane, lDane3, TRUE);

    DelayCommand(15.0, AssignCommand(oDane,
        SpeakString("''...Don't you answer that, young man.''")));

    DelayCommand(17.0, AssignCommand(oDylan,
        SpeakString("''I'd rather be safe than sorry, that's all.''")));

    DelayCommand(19.0, AssignCommand(oDylan, SetFacing(270.0f)));

    CutSpeakString(20.0, oDylan, "''Halt, who goes there?''");

    DelayCommand(21.0, AssignCommand(oDane, SetFacing(270.0f)));

    CutSetCamera(21.0, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 18.0, 60.0,
        CAMERA_TRANSITION_TYPE_MEDIUM);

    CutFadeOutAndIn(24.5, oPC, 2.0);

    CutDestroyPCCopy(25.0, oPC, FALSE);
    CutDisableCutscene(iCut, 25.5, 23.5, RESTORE_TYPE_NONE);

    DelayCommand(25.0, SetLocalInt(GetModule(), "MW_ACTIVATE", TRUE));
    DelayCommand(26.0, AssignCommand(oDylan, ActionStartConversation(oPC)));
}

