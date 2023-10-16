//::///////////////////////////////////////////////
//:: Name           Battle Formation: Ballista on Heart
//:: FileName       q2a_hb_rebcat
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Placeable's script file
    On Heart script for the ballista placeable.

    This is the rebels ballista - it can be controlled
    by the PC - or will fire automatically if the PC
    is not around
*/
//:://////////////////////////////////////////////
//:: Created By:    Keith Warner
//:: Created On:    August 20/03
//:://////////////////////////////////////////////
#include "q2_inc_battle"

const int nBallistaFireChancePercentage = 50;

void FireCatapult();

void main()
{
    //Only works during the battle
    if (GetLocalInt(GetModule(), "X2_Q2ABattle1Started") != 1)
        return;

    object oBallista = OBJECT_SELF;

    //Make sure the PC is not using the Ballista
    if (IsInConversation(oBallista) == TRUE)
        return;

    //Add check to see if Ballista crew is still living.*******
    if (RebelCatapult_FireTeamAlive(oBallista) == TRUE)
    {
        object oFirer = GetNearestObjectByTag("q2a_rebcatteam", oBallista);
        //AssignCommand(oFirer, ActionMoveToObject(oBallista, TRUE));
        DelayCommand(1.0, AssignCommand(oFirer, ActionPlayAnimation(ANIMATION_LOOPING_GET_MID, 1.0, 2.0)));
        // % chance that the ballista is firing
        if (d100() > nBallistaFireChancePercentage ) return;
            FireCatapult();

     }
}

void FireCatapult()
{



    //Calculate the target location.
    float fRange = 60.0;
    location lImpact;


    if (GetLocalString(OBJECT_SELF, "szTarget") != "")
    {
        object oTarget = GetObjectByTag(GetLocalString(OBJECT_SELF, "szTarget"));
        lImpact = GetLocation(oTarget);
        fRange = GetDistanceToObject(oTarget);

    }
    else
    {
        object oCurrentArea = GetArea(OBJECT_SELF);

        vector vCurrentPosition = GetPosition(OBJECT_SELF);
        float fCurrentFacing = GetFacing(OBJECT_SELF);
        //////////////////////////////////////////////////////////
        //This is a hack to work around a known GetFacing() //
        //math error in the scripting language. It can be   //
        //removed once the issue has been patched.          //
        if (fCurrentFacing > 360.0)                         //
        {                                                   //
            fCurrentFacing = 720 - fCurrentFacing;          //
        }                                                   //
        //////////////////////////////////////////////////////////

        vector vDelta;
        vDelta.x = cos(fCurrentFacing) * fRange;
        vDelta.y = sin(fCurrentFacing) * fRange;

        vector vImpact;
        vImpact.x = vCurrentPosition.x + vDelta.x;
        vImpact.y = vCurrentPosition.y + vDelta.y;

        lImpact = Location(oCurrentArea, vImpact, fCurrentFacing);
    }

    float fImpactDelay = fRange/12;

    //Play the catapult's VFX
    effect eImpact = EffectVisualEffect(VFX_FNF_FIREBALL);
    effect eBump = EffectVisualEffect(VFX_FNF_SCREEN_BUMP);

    ActionCastFakeSpellAtLocation(SPELL_FIREBALL, lImpact, PROJECTILE_PATH_TYPE_BALLISTIC);
    ActionWait(fImpactDelay);
    ActionDoCommand(ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eImpact, lImpact));
    ActionDoCommand(ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eBump, lImpact));
}
