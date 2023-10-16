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

        // Only do the heartbeat if Meph isn't ready for takeoff.
        if(iReady != 1 && iGrapple == 1)
        {
            vector vPos = GetPosition(OBJECT_SELF);
            vector vNew = Vector(vPos.x + 3.0, vPos.y, vPos.z);
            location lLoc = Location(GetArea(OBJECT_SELF), vNew, GetFacing(oPC));

            ClearAllActions(TRUE);
            ActionCastFakeSpellAtLocation(SPELL_WEIRD, lLoc);
            DelayCommand(2.2, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_LOS_EVIL_20), lLoc));
            //DelayCommand(3.0, TLVFXPillar(VFX_FNF_IMPLOSION, GetLocation(oPC), 4, 0.1, 4.0, -1.0));
            DelayCommand(2.2, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_LOS_EVIL_20), GetLocation(oPC)));
            DelayCommand(2.3, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_HARM), oPC));
            DelayCommand(3.0, AssignCommand(oPC, ActionJumpToLocation(lLoc)));
            DelayCommand(3.4, ActionAttack(oPC));
        }
    }
    else if(nUser == 1002) // PERCEIVE
    {

    }
    else if(nUser == 1003) // END OF COMBAT
    {

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
                DelayCommand(0.1, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDisappear(), OBJECT_SELF));
                DelayCommand(0.2, NightToDay(GetFirstPC(), 2.0));
            }
            /*else if(iState == 2 && iHPs < iMax/8)
            {
                SetLocalInt(OBJECT_SELF, "HX_READY_4_DAMAGE", 1);
                object oLava = GetNearestObjectByTag("hx_meph_lastlava");

                // Almost dead. As a last ditch effort, summon lava.
                ClearAllActions(TRUE);
                AssignCommand(oPC, ClearAllActions(TRUE));
                PlayAnimation(ANIMATION_FIREFORGET_TAUNT);
                SignalEvent(oLava, EventUserDefined(4444));
                DelayCommand(1.5, ActionAttack(oPC));
                DelayCommand(3.0, SetImmortal(OBJECT_SELF, FALSE));
            }*/
            else if(iState == 2 && iHPs < iMax/8)
            {
                SetLocalInt(OBJECT_SELF, "HX_READY_4_DAMAGE", 1);
                object oLava = GetNearestObjectByTag("hx_meph_lastlava");
                // Set surrender state.
                SetLocalInt(OBJECT_SELF, "bSurrender", TRUE);
                // Almost dead.
                ClearAllActions(TRUE);
                AssignCommand(oPC, ClearAllActions(TRUE));
                SurrenderToEnemies();
                //ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectKnockdown(), OBJECT_SELF);
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
        //AssignCommand(GetFirstPC(), ClearAllActions(TRUE));
        //AssignCommand(GetFirstPC(), ActionJumpToLocation(lLoc));
        SignalEvent(GetArea(OBJECT_SELF), EventUserDefined(5555));
    }
    else if(nUser == 1008) // DISTURBED
    {

    }

}

