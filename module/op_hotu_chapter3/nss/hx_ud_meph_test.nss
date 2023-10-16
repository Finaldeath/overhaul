//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName hx_ud_meph
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will handle the custom fighting for
     Meph.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Sept 10, 2003
//:://////////////////////////////////////////////
#include "hx_inc_meph"
#include "x2_inc_toollib"
#include "x2_inc_cutscene"
#include "achievement_lib"
// Damage from Meph's gaze.
void DoRadiusDamage(location lLoc);
// Clear effects on PC and associates, and remove effects from Meph.
void ClearMephsEffects(object oObject);
// Jump PC and associates.
void AllJumpToLocation(object oObject, location lLoc);

void main()
{
    int nUser = GetUserDefinedEventNumber();

    // The heartbeat will check if the PC is trying to hide from Meph
    // on the grapple platforms. If so, he will summon them to him.
    if(nUser == 1001) //HEARTBEAT
    {
        int iReady = GetMephReady();
        object oPC = GetFirstPC();
        int iGrapple = GetPCAtGrapple(oPC);

        if(GetLocalInt(OBJECT_SELF, "bSurrender") == TRUE)
            return;

        // Don't do anything in a cutscene.
        int iCut = CutGetActiveCutsceneForObject(oPC);
        if(iCut < 1)
        {
            // Only do the heartbeat if Meph isn't ready for takeoff.
            if(iReady != 1 && (iGrapple == 1 || GetDistanceToObject(oPC) >= 10.0))
            {
                vector vPos = GetPosition(OBJECT_SELF);
                vector vNew = Vector(vPos.x + 3.0, vPos.y, vPos.z);
                location lLoc = Location(GetArea(OBJECT_SELF), vNew, GetFacing(oPC));

                // He will either summon you, or use his gaze.
                if(Random(100) > 40)
                {
                    ClearAllActions(TRUE);
                    ActionCastFakeSpellAtLocation(SPELL_WEIRD, lLoc);
                    DelayCommand(2.2, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_LOS_EVIL_20), lLoc));
                    //DelayCommand(3.0, TLVFXPillar(VFX_FNF_IMPLOSION, GetLocation(oPC), 4, 0.1, 4.0, -1.0));
                    DelayCommand(2.2, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_LOS_EVIL_20), GetLocation(oPC)));
                    DelayCommand(2.3, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_HARM), oPC));
                    DelayCommand(3.0, AllJumpToLocation(oPC, lLoc));
                    DelayCommand(3.4, ActionAttack(oPC));
                }
                else
                {
                    location lLoc = GetLocation(oPC);
                    ClearAllActions(TRUE);
                    SetFacingPoint(GetPosition(oPC));
                    DelayCommand(0.8, PlayAnimation(ANIMATION_FIREFORGET_TAUNT));
                    DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_GLOW_ORANGE), OBJECT_SELF, 2.5));
                    DelayCommand(2.1, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(481), lLoc));
                    DelayCommand(2.5, DoRadiusDamage(lLoc));
                }
            }
        }

    }
    else if(nUser == 1002) // PERCEIVE
    {

    }
    else if(nUser == 1003) // END OF COMBAT
    {
        if(GetLocalInt(OBJECT_SELF, "bSurrender") == TRUE)
            return;
        // Don't do shouts in a cutscene.
        int iCut = CutGetActiveCutsceneForObject(GetFirstPC());
        if(iCut < 1)
        {
            if(Random(100) < 35)
            {
                SpeakOneLinerConversation("hx_mephcmbt_conv");
            }
        }
    }
    else if(nUser == 1004) // ON DIALOGUE
    {

    }
    else if(nUser == 1005) // ATTACKED
    {

    }
    else if(nUser == 1006) // DAMAGED
    {
        object oPC = GetFirstPC();
        int iMax = GetMaxHitPoints();
        int iHPs = GetCurrentHitPoints();
        int iState = GetMephCount();
        object oDestroy = GetNearestObjectByTag("hx_meph_building", oPC);
        int iReady = GetLocalInt(OBJECT_SELF, "HX_READY_4_DAMAGE");
        // Variable indicating that he's been commanded by his True Name to fight.
        int iCommand = GetLocalInt(GetModule(), "bMephCommandedToFight");

        if(iReady != 1)
        {
            if(iState == 0 && iHPs < iMax - 100)
            {
                SetLocalInt(OBJECT_SELF, "HX_READY_4_DAMAGE", 1);
                // Stop the heartbeat.
                SetMephReady();
                // Advance the fight state.
                AssignCommand(GetArea(OBJECT_SELF), DelayCommand(5.0, SetMephCount()));
                // Set the damage taken so far.
                SetMephDamage(iMax - iHPs);
                // Fly away.
                AssignCommand(GetArea(OBJECT_SELF), DelayCommand(2.0, SignalEvent(oDestroy, EventUserDefined(5555))));
                ClearAllActions(TRUE);
                AssignCommand(oPC, ClearAllActions(TRUE));
                PlaySound("fs_flapfeather");
                // Removing all effects
                effect eEff = GetFirstEffect(OBJECT_SELF);
                while(GetIsEffectValid(eEff))
                {
                    RemoveEffect(OBJECT_SELF, eEff);
                    eEff = GetNextEffect(OBJECT_SELF);
                }
                DelayCommand(0.1, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDisappear(), OBJECT_SELF));
                DelayCommand(0.2, NightToDay(GetFirstPC(), 2.0));
            }
            else if(iState == 1 && iHPs < iMax/2)
            {
                SetLocalInt(OBJECT_SELF, "HX_READY_4_DAMAGE", 1);
                // Stop the heartbeat.
                SetMephReady();
                // Advance the fight state.
                AssignCommand(GetArea(OBJECT_SELF), DelayCommand(5.0, SetMephCount()));
                // Set the damage taken so far.
                SetMephDamage(iMax - iHPs);
                // Fly away.
                AssignCommand(GetArea(OBJECT_SELF), DelayCommand(2.0, SignalEvent(oDestroy, EventUserDefined(4444))));
                ClearAllActions(TRUE);
                AssignCommand(oPC, ClearAllActions(TRUE));
                PlaySound("fs_flapfeather");
                // Removing all effects
                effect eEff = GetFirstEffect(OBJECT_SELF);
                while(GetIsEffectValid(eEff))
                {
                    RemoveEffect(OBJECT_SELF, eEff);
                    eEff = GetNextEffect(OBJECT_SELF);
                }
                DelayCommand(0.1, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDisappear(), OBJECT_SELF));
                DelayCommand(0.2, NightToDay(GetFirstPC(), 2.0));
            }
            else if(iState == 2 && iCommand == TRUE && iHPs < iMax/8)
            {
                SetLocalInt(OBJECT_SELF, "HX_READY_4_DAMAGE", 1);
                object oLava = GetNearestObjectByTag("hx_meph_lastlava");

                // Almost dead. As a last ditch effort, summon lava.
                ClearAllActions(TRUE);
                //AssignCommand(oPC, ClearAllActions(TRUE));
                ClearMephsEffects(oPC);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SCREEN_SHAKE), OBJECT_SELF);
                PlayAnimation(ANIMATION_FIREFORGET_TAUNT);
                DelayCommand(0.1, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_GLOW_ORANGE), OBJECT_SELF, 2.5));
                SignalEvent(oLava, EventUserDefined(4444));
                DelayCommand(4.0, ActionAttack(oPC));
                DelayCommand(5.0, SetImmortal(OBJECT_SELF, FALSE));
            }
            else if(iState == 2 && iHPs < iMax/8)
            {
                SetLocalInt(OBJECT_SELF, "HX_READY_4_DAMAGE", 1);
                object oLava = GetNearestObjectByTag("hx_meph_lastlava");
                // Set surrender state.
                SetLocalInt(OBJECT_SELF, "bSurrender", TRUE);
                // Almost dead.
                ClearAllActions(TRUE);
                //AssignCommand(oPC, ClearAllActions(TRUE));
                ClearMephsEffects(oPC);
                SurrenderToEnemies();
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectKnockdown(), OBJECT_SELF, 6.0);
                DelayCommand(0.1, ClearAllActions(TRUE));
                MusicBackgroundStop(GetArea(OBJECT_SELF));
                DelayCommand(0.2, NightToDay(GetFirstPC(), 1.0));
                DelayCommand(1.3, SpeakOneLinerConversation("h9_mephistophele"));
            }
        }
    }
    else if(nUser == 1007) // DEATH
    {
        object oSound = GetNearestObjectByTag("hx_lava_sound");
        location lLoc = GetLocation(GetObjectByTag("hx_final_end_movie_wp"));
        // Clean up the lava after he dies.
        SoundObjectStop(oSound);
        MusicBackgroundStop(GetArea(OBJECT_SELF));

        // bk - nov 11 2003 commenting this out because it seems
        // to break cutscene in the event that M dies quickly
        //AssignCommand(GetFirstPC(), ClearAllActions(TRUE));
        //AssignCommand(GetFirstPC(), ActionJumpToLocation(lLoc));

        SignalEvent(GetArea(OBJECT_SELF), EventUserDefined(7777));
    }
    else if(nUser == 1008) // DISTURBED
    {

    }

}

// Damage from Meph's gaze.
void DoRadiusDamage(location lLoc)
{
    object oCreature = GetFirstObjectInShape(SHAPE_CUBE, 7.0, lLoc, TRUE, OBJECT_TYPE_CREATURE);
    int iDamage;
    object oSound = GetNearestObjectByTag("hx_crystal_fire_explode", OBJECT_SELF);

    SoundObjectPlay(oSound);

    while(GetIsObjectValid(oCreature))
    {
        iDamage = Random(60) + 25;
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(iDamage, DAMAGE_TYPE_MAGICAL), oCreature);
        oCreature = GetNextObjectInShape(SHAPE_CUBE, 7.0, lLoc, TRUE, OBJECT_TYPE_CREATURE);
    }
}

// Clear effects on PC and associates, and remove effects from Meph.
void ClearMephsEffects(object oObject)
{
    object oHench1 = GetHenchman(oObject, 1);
    object oHench2 = GetHenchman(oObject, 2);
    object oHench3 = GetHenchman(oObject, 3);
    object oAssoc1 = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oObject);
    object oAssoc2 = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oObject);
    object oAssoc3 = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oObject);
    object oAssoc4 = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oObject);

    effect eEffect = GetFirstEffect(OBJECT_SELF);

    while(GetIsEffectValid(eEffect))
    {
        RemoveEffect(OBJECT_SELF, eEffect);
        eEffect = GetNextEffect(OBJECT_SELF);
    }

    AssignCommand(oObject, ClearAllActions(TRUE));

    if(GetIsObjectValid(oHench1))
    {
        AssignCommand(oHench1, ClearAllActions(TRUE));
    }
    if(GetIsObjectValid(oHench2))
    {
        AssignCommand(oHench2, ClearAllActions(TRUE));
    }
    if(GetIsObjectValid(oHench3))
    {
        AssignCommand(oHench3, ClearAllActions(TRUE));
    }
    if(GetIsObjectValid(oAssoc1))
    {
        AssignCommand(oAssoc1, ClearAllActions(TRUE));
    }
    if(GetIsObjectValid(oAssoc2))
    {
        AssignCommand(oAssoc2, ClearAllActions(TRUE));
    }
    if(GetIsObjectValid(oAssoc3))
    {
        AssignCommand(oAssoc3, ClearAllActions(TRUE));
    }
    if(GetIsObjectValid(oAssoc4))
    {
        AssignCommand(oAssoc4, ClearAllActions(TRUE));
    }
}

// Jump PC and associates.
void AllJumpToLocation(object oObject, location lLoc)
{
    object oHench1 = GetHenchman(oObject, 1);
    object oHench2 = GetHenchman(oObject, 2);
    object oHench3 = GetHenchman(oObject, 3);
    object oAssoc1 = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oObject);
    object oAssoc2 = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oObject);
    object oAssoc3 = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oObject);
    object oAssoc4 = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oObject);

    AssignCommand(oObject, ClearAllActions(TRUE));
    AssignCommand(oObject, ActionJumpToLocation(lLoc));

    if(GetIsObjectValid(oHench1))
    {
        AssignCommand(oHench1, ClearAllActions(TRUE));
        DelayCommand(0.2, AssignCommand(oHench1, ActionJumpToLocation(lLoc)));
    }
    if(GetIsObjectValid(oHench2))
    {
        AssignCommand(oHench2, ClearAllActions(TRUE));
        DelayCommand(0.2, AssignCommand(oHench2, ActionJumpToLocation(lLoc)));
    }
    if(GetIsObjectValid(oHench3))
    {
        AssignCommand(oHench3, ClearAllActions(TRUE));
        DelayCommand(0.2, AssignCommand(oHench3, ActionJumpToLocation(lLoc)));
    }
    if(GetIsObjectValid(oAssoc1))
    {
        AssignCommand(oAssoc1, ClearAllActions(TRUE));
        DelayCommand(0.2, AssignCommand(oAssoc1, ActionJumpToLocation(lLoc)));
    }
    if(GetIsObjectValid(oAssoc2))
    {
        AssignCommand(oAssoc2, ClearAllActions(TRUE));
        DelayCommand(0.2, AssignCommand(oAssoc2, ActionJumpToLocation(lLoc)));
    }
    if(GetIsObjectValid(oAssoc3))
    {
        AssignCommand(oAssoc3, ClearAllActions(TRUE));
        DelayCommand(0.2, AssignCommand(oAssoc3, ActionJumpToLocation(lLoc)));
    }
    if(GetIsObjectValid(oAssoc4))
    {
        AssignCommand(oAssoc4, ClearAllActions(TRUE));
        DelayCommand(0.2, AssignCommand(oAssoc4, ActionJumpToLocation(lLoc)));
    }
}
