//::///////////////////////////////////////////////
//:: Name q2aseer_endcon
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Abort Conversation script for the Seer

    If aborted after the maeviir betrayal - teleport
    the PC out for Wave 2 of Battle2
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 11/03
//:://////////////////////////////////////////////
#include "x2_inc_globals"
void JumpToNextCutscene(object oPC);
void WrapJump(object oHench);
void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(oPC, "X2_SiegeUnsafeToLoad",0);


    //if this was aborted during the seer's pre-siege speech - jump to the dream
    //Get rid of the cutscene mode that was on the player
    if (GetLocalInt(GetModule(), "X2_StartSeerSiegeSpeech") == 1)
    {
        SetLocalInt(GetModule(), "X2_StartSeerSiegeSpeech", 2);
        SetCutsceneMode(oPC, FALSE);
        //PC jumps to the Matron's tower in 'dream-state'
        object oTarget = GetWaypointByTag("wp_q2a9_pcsiegeoffer");
        DelayCommand(1.5, AssignCommand(oPC, JumpToObject(oTarget)));
        object oGate = GetObjectByTag("q2ainnergate");
        SetPlotFlag(oGate, FALSE);

        //Make sure any henchmen don't appear in the dream
        int i = 1;
        effect eVis;
        object oHench = GetHenchman(oPC, i);
        while(oHench != OBJECT_INVALID)
        {
            DelayCommand(1.5, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY), oHench));
            i++;
            oHench = GetHenchman(oPC, i);
        }
    }
    //House Maeviir Betrayal Battle Abort
    if (GetLocalInt(GetModule(), "X2_Q2ABattle2Wave1") == 2)
    {
        //Mark Maeviir battle as over
        SetLocalInt(GetModule(), "X2_Q2ABattle2_Maeviir", 2);

        //Variable for Seer Conversation
        // NOTICE: removed this line to set the var only AFTER jumping to the next area.
        // This way the starting condition would remain the same and the player would
        // have a chance to run through the dialog again.
        //SetLocalInt(GetModule(), "X2_Q2ABattle2Wave1", 3);

        //Set City Core ready to spawn next wave of battle.
        SetLocalInt(GetModule(), "X2_Q2AnBattle2Spawn", 0);
        object oPC = GetPCSpeaker();
        //Raise any dead henchmen in the area..
        object oDeekin = GetObjectByTag("x2_hen_deekin");
        if (GetIsObjectValid(oDeekin) == TRUE)
        {
            if (GetIsDead(oDeekin) == TRUE)
            {
                if (GetArea(oDeekin) == GetArea(oPC))
                {
                    WrapJump(oDeekin);
                }
            }
        }
        object oValen = GetObjectByTag("x2_hen_valen");
        if (GetIsObjectValid(oValen) == TRUE)
        {
            if (GetIsDead(oValen) == TRUE)
            {
                if (GetArea(oValen) == GetArea(oPC))
                {
                    WrapJump(oValen);
                }
            }
        }
        object oNathyrra = GetObjectByTag("x2_hen_nathyra");
        if (GetIsObjectValid(oNathyrra) == TRUE)
        {
            if (GetIsDead(oNathyrra) == TRUE)
            {
                if (GetArea(oNathyrra) == GetArea(oPC))
                {
                    WrapJump(oNathyrra);
                }
            }
        }
        object oTarget = GetWaypointByTag("wp_q2abattle2_lossstart");
        AssignCommand(oPC, ActionJumpToObject(oTarget));
    }
    //End of the Duergar attack
    else if (GetLocalInt(OBJECT_SELF, "X2_Q2Battle2Wave2Over") == 1)
    {
        SetLocalInt(OBJECT_SELF, "X2_Q2Battle2Wave2Over",2);
        effect eEffect = GetFirstEffect(oPC);
        while (GetIsEffectValid(eEffect) == TRUE)
        {
            if (GetEffectType(eEffect) == EFFECT_TYPE_CUTSCENEIMMOBILIZE)
                RemoveEffect(oPC, eEffect);
            eEffect = GetNextEffect(oPC);
        }
        SetLocalInt(OBJECT_SELF, "Q2B_CASTING", 1);
        ExecuteScript("cutscene110", oPC);

    }
    //End of the Drow attack
    else if (GetLocalInt(OBJECT_SELF, "X2_Q2Battle2Wave3Over") == 1)
    {
        SetLocalInt(OBJECT_SELF, "X2_Q2Battle2Wave3Over",2);
        object oPC = GetPCSpeaker();

        effect eEffect = GetFirstEffect(oPC);
        while (GetIsEffectValid(eEffect) == TRUE)
        {
            if (GetEffectType(eEffect) == EFFECT_TYPE_CUTSCENEIMMOBILIZE)
                RemoveEffect(oPC, eEffect);
            eEffect = GetNextEffect(oPC);
        }
        SetLocalInt(OBJECT_SELF, "Q2B_CASTING", 1);
        //if the beholders are still in - do their cutscene first
        if (GetGlobalInt("x2_plot_beholders_out") == 0)
            ExecuteScript("cutscene107", oPC);
        //else just do the Mindflayers cutscene
        else if (GetGlobalInt("X2_Q2DOvermind") < 2)
            ExecuteScript("cutscene106", oPC);
        //else jump to the next battle
        else
            JumpToNextCutscene(oPC);


    }
    //End of the Mindflayer/Beholder attack
    else if (GetLocalInt(OBJECT_SELF, "X2_Q2Battle2Wave4Over") == 1)
    {
        JumpToNextCutscene(oPC);
    }
}

void JumpToNextCutscene(object oPC)
{
    SetLocalInt(OBJECT_SELF, "X2_Q2Battle2Wave4Over",2);
    SetLocalInt(GetModule(), "X2_ENDING_STATUS", 2);


    // removing all henchmen
    //int i = 1;
    object oHench = GetHenchman(oPC);
    while(oHench != OBJECT_INVALID)
    {
        RemoveHenchman(oPC, oHench);
        AssignCommand(oHench, ClearAllActions(TRUE));
        //i++;
        oHench = GetHenchman(oPC);
    }
    /*
    //Battle 2 Over variables
    //If Deekin is with the player when triggering the final cutscene then:
    object oDeekin = GetObjectByTag("x2_hen_deekin");
    if (GetIsObjectValid(oDeekin) == TRUE)
    {
        if (GetIsObjectValid(GetMaster(oDeekin)) == TRUE)
        {
            SetLocalInt(GetModule(), "X2_DEEKIN_ALIVE_AFTER_SIEGE", 1);
            ForceRest(oPC);
        }
    }

    object oValen = GetObjectByTag("x2_hen_valen");
    if (GetIsObjectValid(oValen) == TRUE)
    {
        if (GetIsObjectValid(GetMaster(oValen)) == TRUE)
        {
            ForceRest(oValen);
        }

    }

    object oNath = GetObjectByTag("x2_hen_nathyra");
    if (GetIsObjectValid(oNath) == TRUE)
    {
        if (GetIsObjectValid(GetMaster(oNath)) == TRUE)
        {
            ForceRest(oNath);
        }

    }
    */
    object oTarget = GetWaypointByTag("q7a_wp_camera1");
    ForceRest(oPC);
    //Remove immobalize (and polymorph) and jump PC to outside the Matron's fortress cutscene
    effect eEffect = GetFirstEffect(oPC);
    while (GetIsEffectValid(eEffect) == TRUE)
    {
        if (GetEffectType(eEffect) == EFFECT_TYPE_CUTSCENEIMMOBILIZE ||
            GetEffectType(eEffect) == EFFECT_TYPE_POLYMORPH)
            RemoveEffect(oPC, eEffect);
        eEffect = GetNextEffect(oPC);
    }
    DelayCommand(1.0, AssignCommand(oPC, JumpToObject(oTarget)));

}

void WrapJump(object oHench)
{
    if (GetIsDead(oHench))
    {
        // * Resurrect and heal again, just in case
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectResurrection(), oHench);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectHeal(GetMaxHitPoints(oHench)), OBJECT_SELF);

        // * recursively call self until we are alive again
        DelayCommand(1.0f,WrapJump(oHench));
        return;
    }
    AssignCommand(oHench, JumpToObject(GetWaypointByTag("wp_bat2_henchspawn"), FALSE));
}
