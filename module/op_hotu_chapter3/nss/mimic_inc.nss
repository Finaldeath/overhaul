//::///////////////////////////////////////////////
//:: Name mimic_inc
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This include file will handle special events
     and any variable settings for the mimic AI.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: July 28, 2003
//:://////////////////////////////////////////////

object oPC = GetFirstPC();

// Toggle AI on/off.
void SetMimicAI(object oMimic, int iOn = 1);
// Get AI State.
int GetMimicAI(object oMimic);
// Determine what the target is.
object GetTargetObject(object oSelf);
// Internal way of finding the next generic target. Used only for functions in
// this include file.
object DetermineTargetObject(object oSelf);
// Make the mimic do random actions.
void DoRandomMimicAI(object oSelf);
// Find the path to get to the target object.
void PathfindToObject(object oSelf, object oTarget);
// Do any actions once the target is reached.
void DoMimicReachedTarget(object oSelf);
// Do variable cleanup.
void DoCleanup(object oSelf);
// Have the mimic vaccuum up the gem near it.
void GetMimicGem(object oSelf, object oGem);
// Mimic will grapple to its target
void DoMimicGrapple(object oSelf, object oTarget);
// Make sure if center gem is chosen as target, it is reachable.
int GetCenterGemValid(object oSelf, object oGem);
// Have the mimic vaccuum up the gem near it.
void GetMimicEnemyClose(object oSelf, object oEnemy);
// Have the mimic crush the enemy it can't reach.
void GetMimicEnemyFar(object oSelf, object oEnemy);
// Helper function - Have the mimic vaccuum up the enemy near it.
void DoMimicEnemyClose(object oSelf, object oEnemy);
// Helper function - Have the mimic crush the enemy it can't reach.
void DoMimicEnemyFar(object oSelf, object oEnemy);

//////////////////////////////////////////////////

// Toggle AI on/off.
void SetMimicAI(object oMimic, int iOn = 1)
{
    SetLocalInt(oMimic, "MimicAIState", iOn);
}

// Get AI State.
int GetMimicAI(object oMimic)
{
    int iState = GetLocalInt(oMimic, "MimicAIState");
    return iState;
}

// Internal way of finding the next target. Used only for functions in
// this include file.
object DetermineTargetObject(object oSelf)
{
    int x = 0;
    int iRandom = 0;
    object oTarget = GetNearestObjectByTag("grapple_target", oSelf);

    while(GetIsObjectValid(oTarget))
    {
        x = x + 1;
        oTarget = GetNearestObjectByTag("grapple_target", oSelf, x + 1);
    }

    // Pick a random waypoint from what is available. Don't pick the closest if
    // already there or if PC is near.
    iRandom = Random(x) + 1;

    if(iRandom == 1)
    {
        iRandom = 2;
    }
    oTarget = GetNearestObjectByTag("grapple_target", oSelf, iRandom);
    SetLocalObject(oSelf, "MimicTarget", oTarget);
    return oTarget;
}

// Determine what the target is or should become.
object GetTargetObject(object oSelf)
{
    int iReached = GetLocalInt(OBJECT_SELF, "MimicReachedTarget");
    // Last target. Must use following chain to decide if a new target
    // should be acquired instead.
    object oTarget = GetLocalObject(oSelf, "MimicTarget");

    // Get the 2 closest gems.
    object oGem = GetNearestObjectByTag("hx_mimic_gem");
    object oGem2 = GetNearestObjectByTag("hx_mimic_gem", OBJECT_SELF, 2);

    // Get the closest edible enemy.
    object oEnemy = GetNearestObjectByTag("hx_mimic_enemy");

    // Set the priority chain:
    // 1. Scripted to go somewhere. This overrides all else.
    // 2. Gems are on the ground.
    // 3. An edible enemy.
    // 4. Just wandering around.
    int iTarget = GetLocalInt(oSelf, "MimicTarget");

    if(iTarget == 1)
    {
        return oTarget;
    }
    else if(GetIsObjectValid(oGem) || GetIsObjectValid(oEnemy))
    {
        if(GetIsObjectValid(oGem) && GetIsObjectValid(oEnemy))
        {
            if(GetCenterGemValid(OBJECT_SELF, oGem) &&
               (GetDistanceToObject(oGem) <= GetDistanceToObject(oEnemy)))
            {
                oTarget = GetNearestObjectByTag("grapple_target", oGem);
                SetLocalObject(oSelf, "MimicTarget", oTarget);
                SetLocalInt(oSelf, "MimicTarget", 2);
            }
            else if(GetCenterGemValid(OBJECT_SELF, oEnemy))
            {
                oTarget = GetNearestObjectByTag("grapple_target", oEnemy);
                SetLocalObject(oSelf, "MimicTarget", oTarget);
                SetLocalInt(oSelf, "MimicTarget", 3);
            }
            else
            {
                if(iReached == 0)
                {
                    SetLocalInt(OBJECT_SELF, "MimicReachedTarget", 1);
                    oTarget = DetermineTargetObject(OBJECT_SELF);
                }
            }
        }
        else if(GetIsObjectValid(oGem) && GetCenterGemValid(OBJECT_SELF, oGem))
            {
                oTarget = GetNearestObjectByTag("grapple_target", oGem);
                SetLocalObject(oSelf, "MimicTarget", oTarget);
                SetLocalInt(oSelf, "MimicTarget", 2);
            }
        else if(GetIsObjectValid(oEnemy) && GetCenterGemValid(OBJECT_SELF, oEnemy))
            {
                oTarget = GetNearestObjectByTag("grapple_target", oEnemy);
                SetLocalObject(oSelf, "MimicTarget", oTarget);
                SetLocalInt(oSelf, "MimicTarget", 3);
            }
        else
        {
            if(iReached == 0)
            {
                SetLocalInt(OBJECT_SELF, "MimicReachedTarget", 1);
                oTarget = DetermineTargetObject(OBJECT_SELF);
            }
        }
    }
    else
    {
        if(iReached == 0)
        {
            SetLocalInt(OBJECT_SELF, "MimicReachedTarget", 1);
            oTarget = DetermineTargetObject(OBJECT_SELF);
        }
    }
    return oTarget;
}

// If the AI is off, have the mimic do some random things.
void DoRandomMimicAI(object oSelf)
{
    // Add later
}

// Find the path to get to the target object.
void PathfindToObject(object oSelf, object oTarget)
{
    object oJump;
    object oBestJump;
    object oNextBestJump = OBJECT_INVALID;
    object oGem = GetNearestObjectByTag("hx_mimic_gem");
    object oEnemy = GetNearestObjectByTag("hx_mimic_enemy");

    int x;
    int y = 0;

    if(GetDistanceToObject(oGem) <= 15.0 && GetLocalInt(oSelf, "MimicTarget") == 2)
    {
        DoMimicReachedTarget(oSelf);
    }
    else if(GetDistanceToObject(oEnemy) <= 15.0 && GetLocalInt(oSelf, "MimicTarget") == 3)
    {
        DoMimicReachedTarget(oSelf);
    }
    else if(GetDistanceToObject(oTarget) <= 10.0)
    {
        DoMimicReachedTarget(oSelf);
    }
    else
    {
        // Find the 6 closest jumps from where mimic is.
        for(x = 2; x < 7; x++)
        {
            oJump = GetNearestObjectByTag("grapple_target", oSelf, x);
            // See if it is a legal jump.
            if(GetDistanceToObject(oJump) > 5.0 && GetDistanceToObject(oJump) <= 25.0)
            {
                // First jump acquired in loop. It automatically becomes the best jump.
                if(y == 0)
                {
                    y = 1;
                    oBestJump = oJump;
                }
                // Test further legal jumps against best jump. Set anything closer to
                // be the new best jump. Store the next best jump as well in case we need
                // an alternate path.
                else if(GetDistanceBetween(oJump, oTarget) <=
                        GetDistanceBetween(oBestJump, oTarget))
                {
                    oNextBestJump = oBestJump;
                    oBestJump = oJump;
                }
            }
        }
    }
    // EDIT - Don't bother with worrying about the PC.
    // Grapple to the best jump unless the PC is near it. If so, jump to next best
    // one instead.
    if(GetDistanceBetween(oPC, oBestJump) > -1.0)
    {
        if(GetIsObjectValid(oBestJump))
            DoMimicGrapple(OBJECT_SELF, oBestJump);
        else if(GetIsObjectValid(oNextBestJump))
            DoMimicGrapple(OBJECT_SELF, oNextBestJump);
    }
    else
        DoCleanup(OBJECT_SELF);
}

// Do variable cleanup.
void DoCleanup(object oSelf)
{
    DeleteLocalObject(oSelf, "MimicTarget");
    DeleteLocalInt(oSelf, "MimicTarget");
}

// Mimic has reached its target. Do appropriate cleanup and actions (if any).
void DoMimicReachedTarget(object oSelf)
{
    int iTarget = GetLocalInt(oSelf, "MimicTarget");
    object oGem = GetNearestObjectByTag("hx_mimic_gem");
    object oEnemy = GetNearestObjectByTag("hx_mimic_enemy");
    float fDistance;
    object oCenter = GetObjectByTag("h4c_conductor");

    // Allow for new targets to be acquired.
    SetLocalInt(OBJECT_SELF, "MimicReachedTarget", 0);

    if(iTarget == 1)
    {
        SetMimicAI(oSelf, 0);
        DoCleanup(OBJECT_SELF);
    }
    else if(iTarget == 2)
    {
        if(GetIsObjectValid(oGem))
        {
            fDistance = GetDistanceToObject(oGem);
            if(GetLocalInt(OBJECT_SELF, "MIMIC_AT_CENTER_GEM") == TRUE)
            {
                SetLocalInt(OBJECT_SELF, "MIMIC_AT_CENTER_GEM", FALSE);
                GetMimicGem(OBJECT_SELF, oGem);
                DoCleanup(OBJECT_SELF);
            }
            else if(GetDistanceBetween(oGem, oCenter) <= 5.0)
            {
                ClearAllActions();
                PlayAnimation(ANIMATION_LOOPING_SPASM);
                DelayCommand(0.5, ActionMoveToObject(oGem, FALSE, 2.0));
                SetLocalInt(OBJECT_SELF, "MIMIC_AT_CENTER_GEM", TRUE);
            }
            else if(fDistance <= 8.0)
            {
                GetMimicGem(OBJECT_SELF, oGem);
                DoCleanup(OBJECT_SELF);
            }
            else if(fDistance <= 18.0)
            {
                ClearAllActions();
                PlayAnimation(ANIMATION_LOOPING_SPASM);
                DelayCommand(0.5, ActionMoveToObject(oGem, FALSE, 2.0));
                if(fDistance < 13.0)
                    DelayCommand(4.5, ClearAllActions());
            }
            else
                DoCleanup(OBJECT_SELF);
        }
        else
            DoCleanup(OBJECT_SELF);
    }
    else if(iTarget == 3)
    {
        if(GetIsObjectValid(oEnemy))
        {
            fDistance = GetDistanceToObject(oEnemy);
            if(fDistance <= 10.0)
            {
                GetMimicEnemyClose(OBJECT_SELF, oEnemy);
                DoCleanup(OBJECT_SELF);
            }
            else if(fDistance <= 18.0)
            {
                GetMimicEnemyFar(OBJECT_SELF, oEnemy);
                DoCleanup(OBJECT_SELF);
            }
            else
                DoCleanup(OBJECT_SELF);
        }
        else
            DoCleanup(OBJECT_SELF);
    }
    else
        DoCleanup(OBJECT_SELF);
}

// Have the mimic vaccuum up the gem near it.
void GetMimicGem(object oSelf, object oGem)
{
    location lLoc = GetLocation(oGem);
    object oInvisGem = CreateObject(OBJECT_TYPE_PLACEABLE, "hx_invis_gem", lLoc);

    DestroyObject(oGem, 2.2);
    ClearAllActions();
    SetFacingPoint(GetPosition(oInvisGem));
    DelayCommand(1.0, PlayAnimation(ANIMATION_LOOPING_CONJURE1, 1.0, 1.5));
    DelayCommand(1.4, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY), oGem));
    DelayCommand(1.5, AssignCommand(oInvisGem, ActionCastFakeSpellAtObject(722, oSelf,
                 PROJECTILE_PATH_TYPE_BALLISTIC)));
    DelayCommand(2.4, DestroyObject(oInvisGem));
    DelayCommand(2.8, PlayAnimation(ANIMATION_LOOPING_SPASM));

    // Random burp after eating.
    if(Random(100) > 65)
    {
        DelayCommand(3.8, PlaySound("as_pl_belchingm1"));
        DelayCommand(3.9, PlayAnimation(ANIMATION_LOOPING_CONJURE1, 1.0, 1.0));
    }
}

// Mimic will grapple to its target
void DoMimicGrapple(object oSelf, object oTarget)
{
    ClearAllActions(TRUE);
    SetFacingPoint(GetPosition(oTarget));
    DelayCommand(1.0, ActionCastSpellAtObject(793, oTarget, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT));
    DelayCommand(3.5, ActionJumpToObject(oTarget));
}

// These are 2 test distances in which we should exclude a gem as
// being a legal target. This is done because the mimic can't reach
// the middle without being led there, so if the middle is the closest
// gem and he can't reach it, we need to exclude it.
int GetCenterGemValid(object oSelf, object oGem)
{
    object oCenter = GetObjectByTag("h4c_conductor");
    float fCheck1 = GetDistanceBetween(oSelf, oGem);
    float fCheck2 = GetDistanceBetween(oGem, oCenter);

    if(fCheck1 > 18.0 && fCheck2 < 6.0)
        return FALSE;
    else
        return TRUE;
}

// Have the mimic vaccuum up the enemy near it.
void GetMimicEnemyClose(object oSelf, object oEnemy)
{
    ClearAllActions();
    SetFacingPoint(GetPosition(oEnemy));
    DelayCommand(1.0, PlayAnimation(ANIMATION_LOOPING_CONJURE1, 1.0, 1.8));
    DelayCommand(1.5, DoMimicEnemyClose(oSelf, oEnemy));

    // Random burp after eating.
    if(Random(100) > 65)
    {
        DelayCommand(4.8, PlaySound("as_pl_belchingm1"));
        DelayCommand(4.9, PlayAnimation(ANIMATION_LOOPING_CONJURE1, 1.0, 0.8));
    }
}

// Have the mimic crush the enemy it can't reach.
void GetMimicEnemyFar(object oSelf, object oEnemy)
{
    ClearAllActions(TRUE);
    SetFacingPoint(GetPosition(oEnemy));
    DelayCommand(1.0, ActionCastSpellAtObject(793, oEnemy, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT));
}

// Helper function - Have the mimic vaccuum up the enemy near it.
void DoMimicEnemyClose(object oSelf, object oEnemy)
{
    location lLoc = GetLocation(oEnemy);
    object oInvisGem = CreateObject(OBJECT_TYPE_PLACEABLE, "hx_invis_gem", lLoc);
    float fDist = GetDistanceToObject(oEnemy);
    float fDelay = 0.0;

    // Adjust for longer distance.
    if(fDist > 8.0)
    {
        //fDelay = 0.5;
    }
    else
    {
        DelayCommand(2.2, PlayAnimation(ANIMATION_LOOPING_SPASM));
    }

    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY), oEnemy);

    DelayCommand(0.05, AssignCommand(oInvisGem, ActionCastFakeSpellAtObject(726, oSelf,
                 PROJECTILE_PATH_TYPE_BALLISTIC)));
    DelayCommand(1.5 + fDelay, PlaySound("bf_med_insect"));
    DelayCommand(1.52 + fDelay, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_CHUNK_RED_SMALL), GetLocation(oSelf)));
    DelayCommand(2.1 + fDelay, DestroyObject(oEnemy));

    DelayCommand(3.0, DestroyObject(oInvisGem));
}

// Helper function - Have the mimic crush the enemy it can't reach.
void DoMimicEnemyFar(object oSelf, object oEnemy)
{
    int iAteGem = GetLocalInt(oEnemy, "HX_RAT_ATE_GEM");
    location lLoc = GetLocation(oEnemy);

    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY), oEnemy);

    DelayCommand(0.05, PlaySound("bf_med_insect"));
    DelayCommand(0.06, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_CHUNK_RED_SMALL), lLoc));
    if(iAteGem == TRUE)
    {
        object oGem = CreateObject(OBJECT_TYPE_PLACEABLE, "hx_mimic_pcgem", lLoc);
        if(GetLocalInt(GetModule(), "PCHasHellRingOn") == 1)
        {
            AssignCommand(GetModule(), ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_GLOW_PURPLE), oGem));
        }
    }
    DelayCommand(2.0, DestroyObject(oEnemy));
}
