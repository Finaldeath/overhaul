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
#include "os_include"
#include "q_include"

// Standard cutscene start. Best to wrap in a function in the event
// you need to do things before scene starts.
void StartCutscene(object oPC, int iCut);

void main()
{
    // Change to however you get the cutscene activator.
    object oPC = GetFirstPC();
    object oArea = GetArea(oPC);

    // Change to whatever cutscene number you want to use.
    int iCut = 10;

    if (GetLocalInt(oArea, "nDoOnce") != 1)
    {
        // Immediately blacks out screen. Fade in when the scene starts.
        BlackScreen(oPC);

        // Start the scene.
        AssignCommand(GetModule(), StartCutscene(oPC, iCut));
        DelayCommand(20.0, SetLocalInt(oArea, "nDoOnce", 1));
    }
}

void StartCutscene(object oPC, int iCut)
{
    // Setup the scene for the PC. Leave this alone.
    CutSetActiveCutscene(iCut, CUT_DELAY_TYPE_CONSTANT);
    CutSetActiveCutsceneForObject(oPC, iCut, TRUE);

    object oCal = GetObjectByTag("os_cut_cal");
    object oJab = GetObjectByTag("os_cut_jab");
    object oKai = GetObjectByTag("os_cut_kai");
    object oTrp = GetObjectByTag("os_cut_trp");
    object oPC = GetFirstPC();
    object oBecket = GetObjectByTag("q2_sirbecket");
    object oEnivid = GetObjectByTag("q2_enivid");
    object oMW = GetItemPossessedBy(oPC,"os_magicweapon");

    CutSetActiveCutsceneForObject(oCal, iCut, TRUE);
    CutSetActiveCutsceneForObject(oJab, iCut, TRUE);
    CutSetActiveCutsceneForObject(oTrp, iCut, TRUE);
    CutSetActiveCutsceneForObject(oKai, iCut, TRUE);

    if(GetIsObjectValid(oMW))
    {
        DestroyObject(oMW);
    }

    SetLocalInt(GetModule(), "OS_BECKET_VOTES",4);
    SetLocalInt(GetModule(), "OS_ENIVID_VOTES",5);

    AssignCommand(oCal,SetIsDestroyable(FALSE,FALSE,FALSE));
    AssignCommand(oJab,SetIsDestroyable(FALSE,FALSE,FALSE));
    AssignCommand(oKai,SetIsDestroyable(FALSE,FALSE,FALSE));
    AssignCommand(oTrp,SetIsDestroyable(FALSE,FALSE,FALSE));
    os_SetAreaEntered();

    object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND,oPC);
    if(!GetIsObjectValid(oWeapon))
    {
        q3_GiveWeapon();
    }

    SetMaxHenchmen(4);

    //////////////////////////////////////////////////////////////////
    // Do Cutscene stuff
    //////////////////////////////////////////////////////////////////

    CutSetCutsceneMode(0.0, oPC, TRUE, FALSE);

    CutSetCamera(2.0, oPC, CAMERA_MODE_TOP_DOWN, 110.0, 10.0, 80.0,
        CAMERA_TRANSITION_TYPE_SNAP);

    CutFadeFromBlack(2.2, oPC, FADE_SPEED_MEDIUM);

    DelayCommand(3.0,AssignCommand(oCal,ActionStartConversation(oPC)));
}

