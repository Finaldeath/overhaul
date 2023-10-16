//::///////////////////////////////////////////////
//:: Name cutabort205
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Final battle cutscene abort.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On:Sept 25, 2003
//:://////////////////////////////////////////////
#include "hx_inc_meph"
#include "x2_inc_cutscene"
#include "NW_I0_GENERIC"

// Kill everyone but Meph and PC.
void KillEveryone(int iCut, object oMeph, object oCopy, object oPC, object oDurnan);
// Kill wizard ring.
void KillRing(int iCut, object oPC);
// Clear area of lava.
void ClearLava(int iCut, object oMeph);
// Clear meph invis.
void RemoveMephEffects(object oMeph);
// Destroy arch.
void DestroyArch(object oMeph);
// Teleport all the player's associates.
void TeleportParty(location lLoc, object oObject);
// Clear effects.
void ClearAllEffects();
// Turn henchmen that Meph has persuaded.
void TurnHenchmen(object oPC);

void main()
{
    object oPC = GetLastPCToCancelCutscene();
    int iMephTalk = GetLocalInt(GetModule(), "HX_END_BATTLE_TALKED_2");
    int iCut = 300;
    object oMeph = GetNearestObjectByTag("hx_meph", oPC);
    object oDurnan = GetNearestObjectByTag("hx_end_fight_durnan", oPC);
    object oPCCopy = OBJECT_INVALID;
    location lMephMove = GetLocation(GetNearestObjectByTag("hx_final_meph_move_wp", oPC));
    location lPCMove3 = GetLocation(GetNearestObjectByTag("hx_end_battle_pc_grap_wp", oPC));
    location lHench = GetLocation(GetNearestObjectByTag("hx_end_battle_hench_grap_wp", oPC));
    int iSleep = GetLocalInt(GetModule(), "HX_SLEEPING_END_BATTLE");

    BlackScreen(oPC);
    DelayCommand(2.0, FadeFromBlack(oPC, FADE_SPEED_MEDIUM));

    // Journal.
    AddJournalQuestEntry("XP2_Main", 90, oPC, TRUE, TRUE);
    AddJournalQuestEntry("XP2_Main", 100, oPC, TRUE, TRUE);

    // Turn Henchmen.
    TurnHenchmen(oPC);

    // Jump PC and Meph to right spots.
    AssignCommand(oMeph, ClearAllActions());
    AssignCommand(oPC, ClearAllActions());
    AssignCommand(oMeph, ActionJumpToLocation(lMephMove));
    AssignCommand(oPC, ActionJumpToLocation(lPCMove3));

    // Clear up the level.
    DayToNight(oPC);
    KillEveryone(iCut, oMeph, oPCCopy, oPC, oDurnan);
    KillRing(iCut, oPC);
    DestroyArch(oMeph);
    ClearLava(iCut, oMeph);
    RemoveMephEffects(oMeph);

    // Jump Henchmen.
    TeleportParty(lHench, oPC);

    // Set the music.
    if(MusicBackgroundGetDayTrack(GetArea(oPC)) != 75 || MusicBackgroundGetNightTrack(GetArea(oPC)) != 75)
    {
        MusicBackgroundStop(GetArea(oPC));
        MusicBackgroundChangeDay(GetArea(oPC), 75);
        MusicBackgroundChangeNight(GetArea(oPC), 75);
        DelayCommand(0.2, MusicBackgroundPlay(GetArea(oPC)));
    }
    // Start end conv if not done yet.
    if(iMephTalk == FALSE)
    {
        SetLocalInt(GetModule(), "HX_HAD_TO_SET_CAMERA", TRUE);
        DelayCommand(1.0, StoreCameraFacing());
        DelayCommand(1.7, SetCameraMode(oPC, CAMERA_MODE_TOP_DOWN));
        DelayCommand(1.8, AssignCommand(oPC, SetCameraFacing(90.0, 6.0, 90.0, CAMERA_TRANSITION_TYPE_SNAP)));
        DelayCommand(1.5, AssignCommand(oMeph, ActionStartConversation(oPC)));
    }
    else
    {
        // Sleeping Man busts in.
        if(iSleep == TRUE)
        {
            if(!GetIsObjectValid(GetObjectByTag("hx_sleepman_end")))
            {
                CreateObject(OBJECT_TYPE_CREATURE, "hx_sleepman_end", GetLocation(oPC));
            }
        }
        SetIsTemporaryEnemy(oPC);
        AdjustReputation(oPC, oMeph, -100);
        AssignCommand(oMeph, DetermineCombatRound(oPC));
    }
}

// Kill everyone but Meph and PC.
void KillEveryone(int iCut, object oMeph, object oCopy, object oPC, object oDurnan)
{
    location lMeph = GetLocation(oMeph);
    object oCreature = GetFirstObjectInShape(SHAPE_CUBE, 100.0, lMeph, FALSE, OBJECT_TYPE_CREATURE);
    float fDelay = 0.0;

    while(GetIsObjectValid(oCreature))
    {
        if(GetIsPC(oCreature) || oCreature == oMeph)
        {
            ;
        }
        else if(oCreature == OBJECT_INVALID)
        {
            //DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_FLAME_M), oCreature));
            ;
        }
        else if(GetMaster(oCreature) == oPC)
        {
            ;
        }
        else
        {
            if(GetImmortal(oCreature))
            {
                SetImmortal(oCreature, FALSE);
            }
              // Debug
              // DelayCommand(fDelay, AssignCommand(oCreature, SpeakString("OUCH!")));
            //DelayCommand(fDelay, DelayCreate(iCut, oMeph, OBJECT_TYPE_PLACEABLE, "hx_end_flames", GetLocation(oCreature)));
            //DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_FLAME_M), oCreature));
            DestroyObject(oCreature);
        }
        //fDelay = fDelay + 0.08;
        oCreature = GetNextObjectInShape(SHAPE_CUBE, 100.0, lMeph, FALSE, OBJECT_TYPE_CREATURE);
    }
}

void KillRing(int iCut, object oPC)
{
    int z = 0;
    object oWizRing = GetObjectByTag("hx_end_battle_protect", z);

    while(GetIsObjectValid(oWizRing))
    {
        // Apply the ring effect.
        DestroyObject(oWizRing);
        z = z + 1;
        oWizRing = GetObjectByTag("hx_end_battle_protect", z);
    }
}

// Clear area of lava.
void ClearLava(int iCut, object oMeph)
{
    object oSound = GetObjectByTag("hx_lava_sound");

    SoundObjectStop(oSound);
    CleanLava(oSound);
    DelayCommand(0.2, CleanLava(oSound));
}

// Clear meph invis.
void RemoveMephEffects(object oMeph)
{
    effect eEffect = GetFirstEffect(oMeph);

    while(GetIsEffectValid(eEffect))
    {
        RemoveEffect(oMeph, eEffect);
        eEffect = GetNextEffect(oMeph);
    }
}

// Destroy arch.
void DestroyArch(object oMeph)
{
    object oSafety = GetObjectByTag("hx_invis_safety");

    if(GetIsObjectValid(oSafety))
    {
        object oBuilding = GetNearestObjectByTag("hx_meph_building", oMeph);

        int iVFX = StringToInt(GetStringRight(GetName(oBuilding), 3));
        effect eEffect = GetFirstEffect(oBuilding);

        while(GetIsEffectValid(eEffect))
        {
            RemoveEffect(oBuilding, eEffect);
            eEffect = GetNextEffect(oBuilding);
        }
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(iVFX), oBuilding);

        object oNew = CreateObject(OBJECT_TYPE_PLACEABLE, "hx_meph_dest_fin", GetLocation(oBuilding));

        // Apply the destroyed effect to the new object. Make self invis.
        DestroyObject(oSafety);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(iVFX), oNew);
        DelayCommand(5.5, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY), oBuilding));
        DestroyObject(oBuilding, 6.5);
    }
}

// Teleport all the player's associates.
void TeleportParty(location lLoc, object oObject)
{
    //if(iCut == GetLocalInt(oObject, "nCutsceneNumber"))
    //{
        object oHench1 = GetHenchman(oObject, 1);
        object oHench2 = GetHenchman(oObject, 2);
        object oHench3 = GetHenchman(oObject, 3);
        object oAssoc1 = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oObject);
        object oAssoc2 = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oObject);
        object oAssoc3 = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oObject);
        object oAssoc4 = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oObject);

        if(GetIsObjectValid(oHench1))
        {
            AssignCommand(oHench1, ClearAllEffects());
            DelayCommand(0.2, AssignCommand(oHench1, ActionJumpToLocation(lLoc)));
        }
        if(GetIsObjectValid(oHench2))
        {
            AssignCommand(oHench2, ClearAllEffects());
            DelayCommand(0.2, AssignCommand(oHench2, ActionJumpToLocation(lLoc)));
        }
        if(GetIsObjectValid(oHench3))
        {
            AssignCommand(oHench3, ClearAllEffects());
            DelayCommand(0.2, AssignCommand(oHench3, ActionJumpToLocation(lLoc)));
        }
        if(GetIsObjectValid(oAssoc1))
        {
            AssignCommand(oAssoc1, ClearAllEffects());
            DelayCommand(0.2, AssignCommand(oAssoc1, ActionJumpToLocation(lLoc)));
        }
        if(GetIsObjectValid(oAssoc2))
        {
            AssignCommand(oAssoc2, ClearAllEffects());
            DelayCommand(0.2, AssignCommand(oAssoc2, ActionJumpToLocation(lLoc)));
        }
        if(GetIsObjectValid(oAssoc3))
        {
            AssignCommand(oAssoc3, ClearAllEffects());
            DelayCommand(0.2, AssignCommand(oAssoc3, ActionJumpToLocation(lLoc)));
        }
        if(GetIsObjectValid(oAssoc4))
        {
            AssignCommand(oAssoc4, ClearAllEffects());
            DelayCommand(0.2, AssignCommand(oAssoc4, ActionJumpToLocation(lLoc)));
        }
    //}
}

void ClearAllEffects()
{
    effect eEffect = GetFirstEffect(OBJECT_SELF);

    while(GetIsEffectValid(eEffect))
    {
        RemoveEffect(OBJECT_SELF, eEffect);
        eEffect = GetNextEffect(OBJECT_SELF);
    }
}

void TurnHenchmen(object oPC)
{
    object oAribeth = GetNearestObjectByTag("H2_Aribeth", oPC);
    int iAribeth = GetLocalInt(GetModule(), "bAribethBetrays");
    object oDeekin = GetNearestObjectByTag("x2_hen_deekin", oPC);
    int iDeekin = GetLocalInt(GetModule(), "bDeekinBetrays");
    object oValen = GetNearestObjectByTag("x2_hen_valen", oPC);
    int iValen = GetLocalInt(GetModule(), "bValenBetrays");
    object oNathyrra = GetNearestObjectByTag("x2_hen_nathyra", oPC);
    int iNathyrra = GetLocalInt(GetModule(), "bNathyrraBetrays");

    if(iAribeth == TRUE)
    {
        RemoveHenchman(oPC, oAribeth);
        ChangeToStandardFaction(oAribeth, STANDARD_FACTION_HOSTILE);
        DelayCommand(0.5, AssignCommand(oAribeth, ActionAttack(oPC)));
    }
    if(iDeekin == TRUE)
    {
        RemoveHenchman(oPC, oDeekin);
        ChangeToStandardFaction(oDeekin, STANDARD_FACTION_HOSTILE);
        DelayCommand(0.5, AssignCommand(oDeekin, ActionAttack(oPC)));
    }
    if(iValen == TRUE)
    {
        RemoveHenchman(oPC, oValen);
        ChangeToStandardFaction(oValen, STANDARD_FACTION_HOSTILE);
        DelayCommand(0.5, AssignCommand(oValen, ActionAttack(oPC)));
    }
    if(iNathyrra == TRUE)
    {
        RemoveHenchman(oPC, oNathyrra);
        ChangeToStandardFaction(oNathyrra, STANDARD_FACTION_HOSTILE);
        DelayCommand(0.5, AssignCommand(oNathyrra, ActionAttack(oPC)));
    }
}
