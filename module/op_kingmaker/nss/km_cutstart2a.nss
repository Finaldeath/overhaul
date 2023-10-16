//::///////////////////////////////////////////////
//:: km_cutsctart2
//:: Copyright (c) 2004 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The Second opening cutscene, PC and henchmen
    are destroyed at the gates with the masked man
*/
//:://////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: May 2004
//:://////////////////////////////////////////////
#include "x2_inc_cutscene"

void RemoveAllEffect (object oTarget);
void ForceConversation (object oSpeaker, object oTarget, string sConv);
void RemoveAllAssociates (object oMaster);
// Standard cutscene start. Best to wrap in a function in the event
// you need to do things before scene starts.
void StartCutscene(object oPC, int iCut);
void KillGenericHostiles();
void DestroySlotItem(int iSlot, object oPC);
void DestroyPCInventory(object oPC);

void main()
{
    // Change to however you get the cutscene activator.
    object oPC = GetEnteringObject();
    object oArea = GetArea(oPC);
    // Change to whatever cutscene number you want to use.
    int iCut = 10;

    if (GetIsPC(oPC) && (GetLocalInt(GetModule(), "CUTSCENE_2") == TRUE))
    {
        SetLocalInt(GetModule(), "CUTSCENE_2", FALSE);

        // Immediately blacks out screen. Fade in when the scene starts.
        BlackScreen(oPC);

        // Start the scene.
        AssignCommand(GetModule(), StartCutscene(oPC, iCut));
    }
}

void RemoveAllEffect (object oTarget)
{
    effect eHeal = EffectHeal(999);
    effect eEffect = GetFirstEffect(oTarget);

    while (GetIsEffectValid(eEffect) == TRUE)
    {
        RemoveEffect(oTarget, eEffect);
        eEffect = GetNextEffect(oTarget);
    }

    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eHeal, oTarget);
}

void RemoveAllAssociates (object oMaster)
{
    object oTarget;

    oTarget = GetAssociate( ASSOCIATE_TYPE_ANIMALCOMPANION, oMaster, 1);
    DestroyObject(oTarget);
    oTarget = GetAssociate( ASSOCIATE_TYPE_DOMINATED, oMaster, 1);
    DestroyObject(oTarget);
    oTarget = GetAssociate( ASSOCIATE_TYPE_FAMILIAR, oMaster, 1);
    DestroyObject(oTarget);
    oTarget = GetAssociate( ASSOCIATE_TYPE_NONE, oMaster, 1);
    DestroyObject(oTarget);
    oTarget = GetAssociate( ASSOCIATE_TYPE_SUMMONED, oMaster, 1);
    DestroyObject(oTarget);
}


void StartCutscene(object oPC, int iCut)
{
    // Setup the scene for the PC. Leave this alone.
    CutSetActiveCutscene(iCut, CUT_DELAY_TYPE_CONSTANT);
    CutSetActiveCutsceneForObject(oPC, iCut, TRUE);

    effect eYenna1 = EffectDisappearAppear(GetLocation(GetObjectByTag("KMCUT2_YENNA")));
    effect eParalyze = EffectCutsceneParalyze();

    // Cutscene objects other than the PC. Define them, then set the cutscene as
    // active on them. This will allow them to be commanded using any cutscene functions
    // in the include.
    location lPCStart = GetLocation(GetObjectByTag("KMCUT2_PCSTART"));
    location lCal = GetLocation(GetObjectByTag("KMCUT2_STARTCAL"));
    location lJab = GetLocation(GetObjectByTag("KMCUT2_STARTJAB"));
    location lKai = GetLocation(GetObjectByTag("KMCUT2_STARTKAI"));
    location lTrp = GetLocation(GetObjectByTag("KMCUT2_STARTTRP"));

    location lDrow1 = GetLocation(GetObjectByTag("KMCUT2_DROW1"));
    location lDrow2 = GetLocation(GetObjectByTag("KMCUT2_DROW2"));
    location lDrow3 = GetLocation(GetObjectByTag("KMCUT2_DROW3"));
    location lDrow4 = GetLocation(GetObjectByTag("KMCUT2_DROW4"));
    location lDrow5 = GetLocation(GetObjectByTag("KMCUT2_DROW5"));
    location lDrow6 = GetLocation(GetObjectByTag("KMCUT2_DROW6"));

    location lMMan = GetLocation(GetObjectByTag("KMCUT2_MASKEDMAN"));
    location lTarget = GetLocation(GetObjectByTag("KMCUT2_TARGET"));

    RemoveAllEffect(oPC);
    object oCal = GetObjectByTag("km_hen_cal");
    RemoveAllEffect(oCal);
    object oJab = GetObjectByTag("km_hen_jab");
    RemoveAllEffect(oJab);
    object oTrp = GetObjectByTag("km_hen_trp");
    RemoveAllEffect(oTrp);
    object oKai = GetObjectByTag("km_hen_kai");
    RemoveAllEffect(oKai);

    object oMaskedM = GetObjectByTag("km_cutmasked");
    object oDylan = GetObjectByTag("kmcut_dylan");

    object oDrow1 = GetObjectByTag("q3_ddrow",0);
    object oDrow2 = GetObjectByTag("q3_ddrow",1);
    object oDrow3 = GetObjectByTag("q2_gatedrow",0);
    object oDrow4 = GetObjectByTag("q2_gatedrow",1);
    object oDrow5 = GetObjectByTag("q2_gatedrow",2);
    object oDrow6 = GetObjectByTag("q2_gatedrow",3);

    object oGuard1 = GetObjectByTag("KM_CUT1_GUARD",0);
    object oGuard2 = GetObjectByTag("KM_CUT1_GUARD",1);
    object oGuard3 = GetObjectByTag("KM_CUT1_GUARD",2);
    object oGuard4 = GetObjectByTag("KM_CUT1_GUARD",3);
    object oGuard5 = GetObjectByTag("KM_CUT1_GUARD",4);
    object oGuard6 = GetObjectByTag("KM_CUT1_GUARD",5);
    object oGuard7 = GetObjectByTag("KM_CUT1_GUARD",6);
    object oGuard8 = GetObjectByTag("KM_CUT1_GUARD",7);
    object oGuard9 = GetObjectByTag("KM_CUT1_GUARD",8);
    object oGuard10 = GetObjectByTag("KM_CUT1_GUARD",9);

    CutSetActiveCutsceneForObject(oCal, iCut);
    CutSetActiveCutsceneForObject(oJab, iCut);
    CutSetActiveCutsceneForObject(oTrp, iCut);
    CutSetActiveCutsceneForObject(oKai, iCut);

    CutSetActiveCutsceneForObject(oMaskedM, iCut);
    CutSetActiveCutsceneForObject(oDylan, iCut);

    CutSetActiveCutsceneForObject(oDrow1, iCut);
    CutSetActiveCutsceneForObject(oDrow2, iCut);
    CutSetActiveCutsceneForObject(oDrow3, iCut);
    CutSetActiveCutsceneForObject(oDrow4, iCut);
    CutSetActiveCutsceneForObject(oDrow5, iCut);
    CutSetActiveCutsceneForObject(oDrow6, iCut);

    CutSetActiveCutsceneForObject(oGuard1, iCut);
    CutSetActiveCutsceneForObject(oGuard2, iCut);
    CutSetActiveCutsceneForObject(oGuard3, iCut);
    CutSetActiveCutsceneForObject(oGuard4, iCut);
    CutSetActiveCutsceneForObject(oGuard5, iCut);
    CutSetActiveCutsceneForObject(oGuard6, iCut);
    CutSetActiveCutsceneForObject(oGuard7, iCut);
    CutSetActiveCutsceneForObject(oGuard8, iCut);
    CutSetActiveCutsceneForObject(oGuard9, iCut);
    CutSetActiveCutsceneForObject(oGuard10, iCut);

    // Create a PC Copy in the correct locations
    location lLoc = GetLocation(GetObjectByTag("KMCUT2_STARTCLONE"));
    object oPCCopy = CutCreatePCCopy(oPC, lLoc, "KM_PC_COPY");
    CutSetActiveCutsceneForObject(oPCCopy, iCut);

    KillGenericHostiles();
    AssignCommand(oPC,  ClearAllActions(TRUE));
    AssignCommand(oCal, ClearAllActions(TRUE));
    AssignCommand(oJab, ClearAllActions(TRUE));
    AssignCommand(oKai, ClearAllActions(TRUE));
    AssignCommand(oTrp, ClearAllActions(TRUE));

    //Parse through their inventory and copy all items into the Illithid's
    //Chest at the end of the module before deleting the originals.
    DelayCommand(2.5, DestroyPCInventory(oPC));

    RemoveAllAssociates(oPC);
    RemoveAllAssociates(oJab);
    RemoveAllAssociates(oKai);

    RemoveHenchman(oPC, oCal);
    RemoveHenchman(oPC, oJab);
    RemoveHenchman(oPC, oTrp);
    RemoveHenchman(oPC, oKai);

    SetImmortal(oPC, FALSE);
    SetImmortal(oCal, FALSE);
    SetImmortal(oJab, FALSE);
    SetImmortal(oTrp, FALSE);
    SetImmortal(oKai, FALSE);

    SetPlotFlag(oPC, FALSE);
    SetPlotFlag(oCal, FALSE);
    SetPlotFlag(oJab, FALSE);
    SetPlotFlag(oTrp, FALSE);
    SetPlotFlag(oKai, FALSE);

    AssignCommand(oCal, SetIsDestroyable(FALSE,FALSE,FALSE));
    AssignCommand(oJab, SetIsDestroyable(FALSE,FALSE,FALSE));
    AssignCommand(oTrp, SetIsDestroyable(FALSE,FALSE,FALSE));
    AssignCommand(oKai, SetIsDestroyable(FALSE,FALSE,FALSE));

    /////////////////////////////////////////////////////////
    //Continue on with the rest of the cutscene.
    /////////////////////////////////////////////////////////

    CutSetCutsceneMode(1.0, oPC, TRUE, CUT_CAMERA_HEIGHT_HIGH, TRUE, 2);


    CutJumpToLocation(1.2, oPC, lPCStart);
    CutJumpToLocation(1.2, oCal, lCal);
    CutJumpToLocation(1.2, oJab, lJab);
    CutJumpToLocation(1.2, oKai, lKai);
    CutJumpToLocation(1.2, oTrp, lTrp);

    CutJumpToLocation(1.5, oMaskedM, lMMan);
    CutJumpToLocation(1.5, oDrow1, lDrow1);
    CutJumpToLocation(1.5, oDrow2, lDrow2);
    CutJumpToLocation(1.5, oDrow3, lDrow3);
    CutJumpToLocation(1.5, oDrow4, lDrow4);
    CutJumpToLocation(1.5, oDrow5, lDrow5);
    CutJumpToLocation(1.5, oDrow6, lDrow6);

    //CutClearAllActions(1.8f, oPC, TRUE);

    CutSetCamera(2.0, oPC, CAMERA_MODE_TOP_DOWN, 80.0, 16.0, 75.0,
        CAMERA_TRANSITION_TYPE_SNAP);

    CutFadeFromBlack(2.5, oPC, FADE_SPEED_FAST);

    CutPlayAnimation(4.0, oDylan, ANIMATION_LOOPING_TALK_FORCEFUL, 4.0);

    CutSpeakString (4.0, oDylan, "''Look, mercenaries have cut through their ranks!''");

    //START DIALOG HERE//
    CutApplyEffectToObject2(5.0, DURATION_TYPE_TEMPORARY, eParalyze, oMaskedM, 3.0f);

    CutActionStartConversation(8.0, oMaskedM, oPC, "os_maskedman");
    CutSetFacingPoint(8.2, oMaskedM, "KM_PC_COPY");

    DelayCommand(9.0, ForceConversation(oPC, oMaskedM, "os_maskedman"));

}

void ForceConversation (object oSpeaker, object oTarget, string sConv)
{
    if (IsInConversation(oSpeaker) == FALSE)
    {
        object oDummy = GetNearestObjectByTag("KM_PC_COPY", oTarget);
        vector vDummy = GetPosition(oDummy);

        AssignCommand(oSpeaker, ActionStartConversation(oTarget, sConv));
        DelayCommand(0.2f, AssignCommand(oTarget,
            SetFacingPoint(vDummy)));

        DelayCommand(1.0f, ForceConversation(oSpeaker, oTarget, sConv));
    }
}

// Kill all the ambient hostiles in preperation for the cutscene
void KillGenericHostiles()
{
    int iCounter = 0;
    int iHostiles = GetLocalInt(GetModule(), "GENHOSTILE_COUNT");

    if (iHostiles > 0)
    {
        object oCurrent = GetObjectByTag("KM_GENHOSTILE", iCounter);
        while(oCurrent != OBJECT_INVALID)
        {
            DestroyObject(oCurrent);
            oCurrent = GetObjectByTag("KM_GENHOSTILE", iCounter++);
        }
    }
}

// Clear Slotted Items
void DestroySlotItem(int iSlot, object oPC)
{
    object oIllithidChest = GetObjectByTag("q3_mw_chest");
    object oPCItem;

    oPCItem = GetItemInSlot(iSlot, oPC);
    CopyItem(oPCItem, oIllithidChest, TRUE);
    SetPlotFlag(oPCItem, FALSE);
    DestroyObject(oPCItem, 0.5);
}

//Sends the PCs inventory to the Illithid chamber
void DestroyPCInventory(object oPC)
{
    object oIllithidChest = GetObjectByTag("q3_mw_chest");
    object oPCItem;
    int iGold = GetGold(oPC);

    AssignCommand(oPC, TakeGoldFromCreature(iGold, oPC, TRUE));
    AssignCommand(oPC, ClearAllActions(TRUE));
    SetXP(oPC, 0);

    DestroySlotItem(INVENTORY_SLOT_ARMS, oPC);
    DestroySlotItem(INVENTORY_SLOT_ARROWS, oPC);
    DestroySlotItem(INVENTORY_SLOT_BELT, oPC);
    DestroySlotItem(INVENTORY_SLOT_BOLTS, oPC);
    DestroySlotItem(INVENTORY_SLOT_BOOTS, oPC);
    DestroySlotItem(INVENTORY_SLOT_BULLETS, oPC);
    DestroySlotItem(INVENTORY_SLOT_CHEST, oPC);
    DestroySlotItem(INVENTORY_SLOT_CLOAK, oPC);
    DestroySlotItem(INVENTORY_SLOT_HEAD, oPC);
    DestroySlotItem(INVENTORY_SLOT_LEFTHAND, oPC);
    DestroySlotItem(INVENTORY_SLOT_LEFTRING, oPC);
    DestroySlotItem(INVENTORY_SLOT_NECK, oPC);
    DestroySlotItem(INVENTORY_SLOT_RIGHTHAND, oPC);
    DestroySlotItem(INVENTORY_SLOT_RIGHTRING, oPC);

    oPCItem = GetFirstItemInInventory(oPC);

    while (oPCItem != OBJECT_INVALID)
    {
        CopyItem(oPCItem, oIllithidChest, TRUE);
        SetPlotFlag(oPCItem,FALSE);
        DestroyObject(oPCItem, 0.5);
        PrintString("-Lost Item : " + GetName(oPCItem));
        oPCItem = GetNextItemInInventory(oPC);
    }

    //Add some ragged clothes to the player if you wish
    object oClothes = CreateItemOnObject("os_cut_rags", oPC);
    AssignCommand(oPC, CutActionEquipItem(0.1, oPC, oClothes, INVENTORY_SLOT_CHEST));
}

