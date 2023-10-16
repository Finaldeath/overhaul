//::///////////////////////////////////////////////
//:: Henchman Death Script : SG_HENCHD_EATH
//::
//:: Copyright (c) 2004-2005 Bioware Corp.
//:://////////////////////////////////////////////
//:: Shadow Guard Heanchmen Death System
//:://////////////////////////////////////////////
//:: Under this system Henchmen will fall and
//:: become uncommandable in combat if their HP
//:: falls to one point. They will get up once the
//:: PC charater is no longer in combat and no
//:: hostiles are nearby.
//:://////////////////////////////////////////////

#include "nw_i0_generic"
#include "nw_i0_plot"

void DownNPC(object oTarget);
void ClearAllEffects(object oTarget);
void DistractAttackers(object oTarget);
int CheckForThreats(object oTarget);

// main call
void main ()
{
    object oSelf = OBJECT_SELF;
    object oMaster = GetMaster(oSelf);

    if ((GetCurrentHitPoints(oSelf) <= 1)
    && (GetLocalInt(oSelf, "KNOCKED_DOWN") == FALSE)
    && (oMaster != OBJECT_INVALID))
    {
        DownNPC(oSelf);
    }
}

// workhorse function - this handles the actual functionalty of the system
void DownNPC(object oTarget)
{
    effect eDown = EffectKnockdown();
    effect eHeal = EffectHeal(9);
    int iGetKnock = GetLocalInt(oTarget, "KNOCKED_DOWN");

    if (CheckForThreats(oTarget) == TRUE)
    {
        AssignCommand(oTarget, ClearAllActions(TRUE));

        if (iGetKnock == FALSE)
        {
            SetLocalInt(oTarget, "KNOCKED_DOWN", TRUE);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eDown, oTarget);
        }

        DistractAttackers(oTarget);
        DelayCommand(1.0f, DownNPC(oTarget));
    }
    else
    {
        ClearAllEffects(oTarget);
        SetLocalInt(oTarget, "KNOCKED_DOWN", FALSE);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eHeal, oTarget);
    }
}

// Clear all the objects effects
void ClearAllEffects(object oTarget)
{
    effect eRemove = GetFirstEffect(oTarget);

    while(GetIsEffectValid(eRemove) == TRUE)
    {
        RemoveEffect(oTarget, eRemove);
        eRemove = GetNextEffect(oTarget);
    }
}

// Set attackers neutral to the downed NPC
void DistractAttackers(object oTarget)
{
    int nShape = SHAPE_SPHERE;
    float fSize = RADIUS_SIZE_HUGE;
    location lTarget = GetLocation(oTarget);

    object oPC = GetMaster(oTarget);
    object oCheck = GetFirstObjectInShape(nShape, fSize, lTarget);

    while(oCheck != OBJECT_INVALID)
    {
        if(GetAttackTarget(oCheck) == oTarget)
        {
            AssignCommand(oCheck, ClearAllActions(TRUE));
            SetIsTemporaryNeutral(oCheck, oTarget);
        }
        oCheck = GetNextObjectInShape(nShape, fSize, lTarget);
    }
}

// Check for any NPCs the Target may consider hostile
int CheckForThreats(object oTarget)
{
    int iResult = FALSE;
    int nShape = SHAPE_SPHERE;
    float fSize = RADIUS_SIZE_HUGE;
    location lTarget = GetLocation(oTarget);

    object oPC = GetMaster(oTarget);
    object oCheck = GetFirstObjectInShape(nShape, fSize, lTarget);

    // if there are hostiles around the NPC
    while(oCheck != OBJECT_INVALID)
    {
        if((GetIsDead(oCheck) == FALSE) && (GetIsEnemy(oCheck, oPC) == TRUE))
        {
            iResult = TRUE;
        }

        oCheck = GetNextObjectInShape(nShape, fSize, lTarget);
    }

    // or if the master is in combat.
    if (GetIsInCombat(oPC) == TRUE)
    {
        iResult = TRUE;
    }

    return iResult;
}

