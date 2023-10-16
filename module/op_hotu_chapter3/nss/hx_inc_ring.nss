//::///////////////////////////////////////////////
//:: Name hx_inc_ring
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will create the "ring vision" when a PC
     equips the ring that guides them through Hell.
     It will make the area dark, and will create a
     bunch of glowing arrows pointing in the
     direction the PC needs to go.

     Removing the ring will destroy the "ring
     vision".

     There are other useful functions in here,
     explained below.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: July 23, 2003
//:://////////////////////////////////////////////
#include "x2_inc_cutscene"
#include "nw_i0_plot"
// Remove the glow that was applied to the PC from putting on the ring.
void RemovePCGlow(object oPC);
// Creates the "ring vision"
void AstralPlaneCreate(object oPC);
// Purges anything created by "ring vision"
void AstralPlanePurge(object oPC);
// This will set the area enter for areas.
void HXAreaEnter(object oPC);
// This will damage the player every hearbeat for being in the cold.
void HXDoColdDamage(int iDamage = 0);
// Toggle sound on any sound objects that are "ring vision" attachments.
void HXToggleSound(object oPC, int iDay);
// Spawn Creatures.
void HXSpawnCreatures(object oPC, float fRadius = 60.0);
// Get the first PC (if any) in the area.
object GetAreaPC(object oArea);
// Do cold damage to PC and associates.
void DoDamage(object oPC, int iDamage);

//////////////////////////////////////////////////

// Remove the glow that was applied to the PC from putting on the ring.
void RemovePCGlow(object oPC)
{
    effect eEffect = GetFirstEffect(oPC);
    object oGlow;

    while(GetIsEffectValid(eEffect))
    {
        oGlow = GetEffectCreator(eEffect);
        if(oGlow == GetModule())
        {
            RemoveEffect(oPC, eEffect);
        }
        eEffect = GetNextEffect(oPC);
    }
}

// Create the objects that the player sees when putting on the ring. Also,
// Destroy any objects that are marked to only be seen without the ring on.
void AstralPlaneCreate(object oPC)
{
    //Add a journal entry the first time the ring is equipped
    int bDoOnce = GetLocalInt(GetModule(), "bPlayerUsedRing");
    if (bDoOnce == FALSE)
    {
        SetLocalInt(GetModule(), "bPlayerUsedRing", TRUE);
        AddJournalQuestEntry("XP2_Main", 50, oPC, TRUE, TRUE);

        //Give non-repeatable XP
        int i2daRow = 81;
        int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
        if (bDuplicate == FALSE)
        {
            SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
            Reward_2daXP(oPC, i2daRow);
        }
    }

    object oItem;
    location lLoc;

    int x = 1;
    object oWP = GetNearestObjectByTag("h4a_ring_wp", oPC, x);

    // Get the area so we know where everyone is.
    object oArea = GetArea(oPC);
    object oObject = GetFirstObjectInArea(oArea);

    // The mimic.
    object oMimic = GetNearestObjectByTag("hx_mimic", oPC);

    // Set the area to be nighttime. This is done to emphasize the
    // difference between wearing the ring and not wearing it.
    DayToNight(oPC);
    SetLocalInt(GetModule(), "PCHasHellRingOn", 1);

    // Set the ambient music
    SetLocalInt(oArea, "AmbientMusicTrack", MusicBackgroundGetDayTrack(oArea));
    MusicBackgroundChangeDay(oArea, 28);
    MusicBackgroundPlay(oArea);

    //Delete the ring off objects.
    while(GetIsObjectValid(oObject))
    {
        if(GetLocalInt(oObject, "CreatedByHellRingOff") == 1)
        {
            DestroyObject(oObject);
        }
        oObject = GetNextObjectInArea(oArea);
    }

    // Toggle sound.
    HXToggleSound(oPC, 0);

    //Create the "ring vision" objects.
    while(GetIsObjectValid(oWP))
    {
        //if(GetName(oWP) == "h4a_ringarrow")
        //{
        //    SetMapPinEnabled(oWP, TRUE);
        //}
        lLoc = GetLocation(oWP);
        oItem = CreateObject(OBJECT_TYPE_PLACEABLE, GetName(oWP), lLoc);
        SetLocalInt(oItem, "CreatedByHellRing", 1);
        DelayCommand(0.2, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect
                    (VFX_DUR_GLOW_PURPLE), oItem));
        x = x + 1;
        oWP = GetNearestObjectByTag("h4a_ring_wp", oPC, x);
    }
    // Give the player a vision buff effect and a glow, and also the Mimic and gems.
    AssignCommand(GetModule(), ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_MAGICAL_VISION), oPC));
    AssignCommand(GetModule(), ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectVisualEffect(VFX_DUR_GLOW_PURPLE)), oPC));

    if(GetIsObjectValid(oMimic))
        AssignCommand(GetModule(), ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_GLOW_PURPLE), oMimic));

    int y = 1;
    object oGem = GetNearestObjectByTag("hx_mimic_gem", oPC, y);
    while(GetIsObjectValid(oGem))
    {
        AssignCommand(GetModule(), ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_GLOW_PURPLE), oGem));
        y = y + 1;
        oGem = GetNearestObjectByTag("hx_mimic_gem", oPC, y);
    }
}

// Destroy the "ring vision" objects. Also, create objects only seen without
// the ring on.
void AstralPlanePurge(object oPC)
{
    object oArea = GetArea(oPC);
    object oObject = GetFirstObjectInArea(oArea);
    location lLoc;
    object oItem;
    int x = 1;
    object oWP = GetNearestObjectByTag("h4a_ringoff_wp", oPC, x);
    // The mimic.
    object oMimic = GetNearestObjectByTag("hx_mimic", oPC);

    // Set the area to be daytime. This is done to emphasize the
    // difference between wearing the ring and not wearing it.
    NightToDay(oPC);
    SetLocalInt(GetModule(), "PCHasHellRingOn", 0);

    // Set the ambient music
    if(GetLocalInt(oArea, "AmbientMusicTrack") != 0)
        MusicBackgroundChangeDay(oArea, GetLocalInt(oArea, "AmbientMusicTrack"));
    MusicBackgroundPlay(oArea);

    //Remove the "ring vision" effect from the PC and Mimic and gems.
    RemovePCGlow(oPC);
    if(GetIsObjectValid(oMimic))
        RemovePCGlow(oMimic);
    int y = 1;
    object oGem = GetNearestObjectByTag("hx_mimic_gem", oPC, y);
    while(GetIsObjectValid(oGem))
    {
        RemovePCGlow(oGem);
        y = y + 1;
        oGem = GetNearestObjectByTag("hx_mimic_gem", oPC, y);
    }

    //Delete the ring on objects.
    while(GetIsObjectValid(oObject))
    {
        //if(GetName(oObject) == "h4a_ringarrow")
        //{
        //    SetMapPinEnabled(oObject, FALSE);
        //}
        if(GetLocalInt(oObject, "CreatedByHellRing") == 1 ||
           GetLocalInt(oObject, "CreatedByHellRingOff") == 1)
        {
            DestroyObject(oObject);
        }
        oObject = GetNextObjectInArea(oArea);
    }

    // Toggle sound.
    HXToggleSound(oPC, 1);

    //Create the "ring vision off" objects.
    while(GetIsObjectValid(oWP))
    {
        lLoc = GetLocation(oWP);
        oItem = CreateObject(OBJECT_TYPE_PLACEABLE, GetName(oWP), lLoc);
        SetLocalInt(oItem, "CreatedByHellRingOff", 1);
        //DelayCommand(0.2, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect
        //            (VFX_DUR_GLOW_BLUE), oItem));
        x = x + 1;
        oWP = GetNearestObjectByTag("h4a_ringoff_wp", oPC, x);
    }

}

// Check the entering player to see if they have the ring on so we can spawn
// proper stuff in. If they don't, and stuff had been created before, destroy
// that stuff.
void HXAreaEnter(object oPC)
{
    object oRing = GetItemPossessedBy(oPC, "hx_puzzle_ring");
    int iIce = GetLocalInt(OBJECT_SELF, "HX_APPLIED_ICE_EFFECT");

    // Check to see if special ring was equipped.
    if(GetIsPC(oPC))
    {
        if(GetIsObjectValid(oRing) && GetLocalInt(GetModule(), "PCHasHellRingOn"))
        {
            AstralPlanePurge(oPC);
            DelayCommand(0.2, AstralPlaneCreate(oPC));
        }
        else if(GetLocalInt(GetModule(), "PCHasHellRingOn") == 0)
        {
            AstralPlanePurge(oPC);
        }
        // Check for Ice effect.
        if(iIce != 1)
        {
            object oIceObject = GetFirstObjectInArea(OBJECT_SELF);
            string sIce;

            SetLocalInt(OBJECT_SELF, "HX_APPLIED_ICE_EFFECT", 1);

            while(GetIsObjectValid(oIceObject))
            {
                sIce = GetStringRight(GetTag(oIceObject), 7);
                if(sIce == "_ADDICE")
                {
                    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(465), oIceObject);
                }
                oIceObject = GetNextObjectInArea(OBJECT_SELF);
            }
        }
    }
}

// This will do cold damage on the party, unless they made a fire recently.
void HXDoColdDamage(int iDamage = 0)
{
    object oPC = GetFirstPC();
    int iFire = GetLocalInt(oPC, "HX_FIRETYPE");
    int iSafeTime = GetLocalInt(oPC, "HX_FIRETYPE_SAFE");
    int iTime = 0;
    int iTimeOut = 0;
    int iCut;
    object oTorch = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC);

    if(iFire == 1)
    {
        iTime = 6;
        iTimeOut = 1;
        if(iSafeTime == 0)
        {
            SetLocalInt(oPC, "HX_FIRETYPE_SAFE", iTime);
        }
    }
    else if(iFire == 2)
    {
        iTime = 15;
        iTimeOut = 2;
        if(iSafeTime == 0)
        {
            SetLocalInt(oPC, "HX_FIRETYPE_SAFE", iTime);
        }
    }
    else if(iFire == 3)
    {
        iTime = 30;
        iTimeOut = 2;
        if(iSafeTime == 0)
        {
            SetLocalInt(oPC, "HX_FIRETYPE_SAFE", iTime);
        }
    }

    // Do damage to everyone in the area.
    while(GetIsObjectValid(oPC))
    {
        // Don't do damage in a cutscene.
        iCut = CutGetActiveCutsceneForObject(oPC);
        if(iCut < 1)
        {
            if(GetArea(oPC) == OBJECT_SELF)
            {
                if(IsInConversation(oPC))
                {
                    return;
                }
                iSafeTime = GetLocalInt(oPC, "HX_FIRETYPE_SAFE");
                // Do visual if the player is damaged.
                if(iSafeTime <= 0 && GetLocalInt(oPC, "HX_PC_STARTED_FIRE") != 1 && GetLocalInt(oPC, "HX_PC_STANDING_NEAR") != 1)
                {
                    if(iDamage > 0)
                    {
                        DoDamage(oPC, iDamage);
                    }
                }
                else
                {
                    if(GetLocalInt(oPC, "HX_PC_STARTED_FIRE") != 1 && GetLocalInt(oPC, "HX_PC_STANDING_NEAR") != 1)
                    {
                        if(iSafeTime == iTime/2)
                        {
                            //SendMessageToPC(oPC, "[NOT IN STRING EDITOR] The warmth from the last fire is still with you.");
                            if(GetLocalInt(oPC, "HX_FIRE_POTION") == 1)
                            {
                                SendMessageToPCByStrRef(oPC, 86878);
                            }
                            else
                            {
                                SendMessageToPCByStrRef(oPC, 85521);
                            }
                        }
                        else if(iSafeTime == iTimeOut)
                        {

                            //SendMessageToPC(oPC, "[NOT IN STRING EDITOR] The warmth from the last fire has nearly left you.");
                            if(GetLocalInt(oPC, "HX_FIRE_POTION") == 1)
                            {
                                SendMessageToPCByStrRef(oPC, 86879);
                            }
                            else
                            {
                                SendMessageToPCByStrRef(oPC, 85522);
                            }
                        }
                        SetLocalInt(oPC, "HX_FIRETYPE_SAFE", iSafeTime - 1);
                        if(GetLocalInt(oPC, "HX_FIRETYPE_SAFE") <= 0)
                        {
                            SetLocalInt(oPC, "HX_FIRETYPE", 0);
                        }
                    }
                }
            }
        }
        oPC = GetNextPC();
    }
}

// Sound object toggle function.
// Toggle sound on any sound objects that are "ring vision" attachments.
void HXToggleSound(object oPC, int iDay)
{
    int x = 1;
    int y = 1;
    object oSoundDay = GetNearestObjectByTag("hx_sound_day" + IntToString(x), oPC);
    object oSoundNight = GetNearestObjectByTag("hx_sound_night" + IntToString(y), oPC);

    while(GetIsObjectValid(oSoundDay))
    {
        if(iDay == 1)
        {
            SoundObjectPlay(oSoundDay);
        }
        else
        {
            SoundObjectStop(oSoundDay);
        }
        x = x + 1;
        oSoundDay = GetNearestObjectByTag("hx_sound_day" + IntToString(x), oPC);
    }
    while(GetIsObjectValid(oSoundNight))
    {
        if(iDay == 1)
        {
            SoundObjectStop(oSoundNight);
        }
        else
        {
            SoundObjectPlay(oSoundNight);
        }
        y = y + 1;
        oSoundNight = GetNearestObjectByTag("hx_sound_night" + IntToString(y), oPC);
    }
}

// Spawn creatures.
void HXSpawnCreatures(object oPC, float fRadius = 60.0)
{
    location lLoc = GetLocation(oPC);
    object oWP = GetFirstObjectInShape(SHAPE_SPHERE, fRadius, lLoc, FALSE, OBJECT_TYPE_WAYPOINT);
    object oCreature;
    string sName, sCreatureName, sCommand, sDetail, sNumber, sCommandPlus, sNumberString, sRun;
    string sTime, sFull, sHalf, sTemp;
    int iSpawnTime, iTime;
    object oWalk, oWalkWP, oDest;
    // Used for random waypoints.
    int x = 1;
    int iTotal = 0;

    while(GetIsObjectValid(oWP))
    {
        if(GetTag(oWP) == "HX_CREATURE_SPAWN")
        {
            oCreature = GetLocalObject(oWP, "HX_SPAWN_CHILD");

            // Leave 3 spaces at end for special functions.
            sName = GetName(oWP);
            sFull = GetStringRight(sName, 12);
            sHalf = GetStringRight(sName, 9);
            sTemp = GetStringRight(sFull, 6);
            sCommandPlus = GetStringRight(sName, 6);
            sCommand = GetStringRight(sName, 3);
            sTime = GetStringRight(sName, 6);
            iSpawnTime = StringToInt(GetStringRight(sName, 3)) / 6;
            // If respawn is specified, shift the others.
            if(GetStringLeft(sTemp, 3) == "_rs")
            {
                sCommandPlus = GetStringLeft(sFull, 6);
            }
            else if(GetStringLeft(sHalf, 3) == "_rw" || GetStringLeft(sHalf, 3) == "_hp")
            {
                sCommand = GetStringLeft(sHalf, 3);
                sCommandPlus = GetStringRight(sHalf, 6);
            }
            else if(GetStringLeft(sCommandPlus, 3) == "_wp" || GetStringLeft(sCommandPlus, 3) == "_dw")
            {
                sCommand = GetStringLeft(sCommandPlus, 3);
            }

            ///////

            if(sCommand == "_rw" || sCommand == "_hp")
            {
                if(GetStringLeft(sTime, 3) == "_rs" || GetStringLeft(sTemp, 3) == "_rs")
                {
                    sCreatureName = GetStringLeft(sName, GetStringLength(sName) - 9);
                }
                else
                {
                    sCreatureName = GetStringLeft(sName, GetStringLength(sName) - 3);
                }
            }
            else if(GetStringLeft(sCommandPlus, 3) == "_wp" || GetStringLeft(sCommandPlus, 3) == "_dw")
            {
                if(GetStringLeft(sTime, 3) == "_rs"  || GetStringLeft(sTemp, 3) == "_rs")
                {
                    sCreatureName = GetStringLeft(sName, GetStringLength(sName) - 12);
                }
                else
                {
                    sCreatureName = GetStringLeft(sName, GetStringLength(sName) - 6);
                }
            }
            else
            {
                if(GetStringLeft(sTime, 3) == "_rs"  || GetStringLeft(sTemp, 3) == "_rs")
                {
                    sCreatureName = GetStringLeft(sName, GetStringLength(sName) - 6);
                }
                else
                {
                    sCreatureName = sName;
                }
            }

            if(!GetIsObjectValid(oCreature))
            {
                if(GetLocalInt(oWP, "HX_SPAWN_START") == FALSE)
                {
                    SetLocalInt(oWP, "HX_SPAWN_START", TRUE);
                    SetLocalInt(oWP, "HX_SPAWN_RESTART", 0);
                    oCreature = CreateObject(OBJECT_TYPE_CREATURE, sCreatureName, GetLocation(oWP));
                    // Set the spawned creature as the waypoint's child.
                    SetLocalObject(oWP, "HX_SPAWN_CHILD", oCreature);
                }
                // Check the respawn trigger.
                else if(GetStringLeft(sTime, 3) == "_rs")
                {
                    iTime = GetLocalInt(oWP, "HX_SPAWN_RESTART");
                    // Ready for a spawn.
                    if(iTime >= iSpawnTime)
                    {
                        oCreature = CreateObject(OBJECT_TYPE_CREATURE, sCreatureName, GetLocation(oWP));
                        // Set the spawned creature as the waypoint's child.
                        SetLocalObject(oWP, "HX_SPAWN_CHILD", oCreature);
                        SetLocalInt(oWP, "HX_SPAWN_RESTART", 0);
                    }
                    else
                    {
                        SetLocalInt(oWP, "HX_SPAWN_RESTART", iTime + 1);
                    }
                }
            }
            //
            // Commands for the creatures. Only do outside of combat.
            //
            if(!GetIsInCombat(oCreature) && GetIsObjectValid(oCreature) && !IsInConversation(oCreature))
            {
                // Random Walk.
                if(sCommand == "_rw")
                {
                    if(GetCurrentAction(oCreature) != ACTION_MOVETOPOINT)
                    {
                        AssignCommand(oCreature, ClearAllActions());
                        AssignCommand(oCreature, ActionRandomWalk());
                    }
                }
                // Hunt Player.
                else if(sCommand == "_hp")
                {
                    if(GetDistanceBetween(oCreature, oPC) <= 25.0)
                    {
                        if(GetCurrentAction(oCreature) != ACTION_ATTACKOBJECT)
                        {
                            AssignCommand(oCreature, ClearAllActions(TRUE));
                            AssignCommand(oCreature, ActionAttack(oPC));
                        }
                    }
                    else if(GetCurrentAction(oCreature) != ACTION_MOVETOPOINT)
                    {
                        AssignCommand(oCreature, ClearAllActions(TRUE));
                        AssignCommand(oCreature, ActionMoveToObject(oPC, FALSE, 23.0));
                    }
                }
                // Walk points. The points are waypoints and can be done in a certain order,
                // or can be done randomly. The waypoints can also specify what should be done
                // when they are reached.
                else if(GetStringLeft(sCommandPlus, 3) == "_wp" || GetStringLeft(sCommandPlus, 3) == "_dw")
                {
                    // Added functionality to commands.
                    sDetail = GetSubString(sCommandPlus, 3, 2);
                    sNumber = GetSubString(sCommandPlus, 3, 1);
                    sNumberString = GetSubString(sCommandPlus, 4, 1);
                    sRun = GetStringRight(sCommandPlus, 1);

                    oWalk = GetNearestObjectByTag("HX_CREATURE_SPAWN_WALK_WP", oCreature, x);

                    // Get the total number of waypoints.
                    while(GetIsObjectValid(oWalk))
                    {
                        iTotal = iTotal + 1;
                        x = x + 1;
                        oWalk = GetNearestObjectByTag("HX_CREATURE_SPAWN_WALK_WP", oCreature, x);
                    }

                    // Random points.

                    if(sDetail == "_r")
                    {
                        oWalk = GetNearestObjectByTag("HX_CREATURE_SPAWN_WALK_WP", oCreature, Random(iTotal) + 1);
                        oWalkWP = GetLocalObject(oCreature, "HX_SPAWN_TARGET_WP");

                        if(!GetIsObjectValid(oWalkWP))
                        {
                            SetLocalObject(oCreature, "HX_SPAWN_TARGET_WP", oWalk);
                        }
                        oWalkWP = GetLocalObject(oCreature, "HX_SPAWN_TARGET_WP");

                        if(GetStringLeft(sCommandPlus, 3) == "_dw" && GetDistanceBetween(oWalkWP, oCreature) <= 1.0)
                        {
                            if(GetPlotFlag(oCreature))
                            {
                                SetPlotFlag(oCreature, FALSE);
                            }
                            if(GetImmortal(oCreature))
                            {
                                SetImmortal(oCreature, FALSE);
                            }
                            DeleteLocalObject(oCreature, "HX_SPAWN_TARGET_WP");
                            DestroyObject(oCreature);
                            return;
                        }
                        else if(GetCurrentAction(oCreature) != ACTION_MOVETOPOINT)
                        {
                            if(GetStringLeft(sCommandPlus, 3) == "_dw" && GetIsObjectValid(oWalkWP))
                            {
                                AssignCommand(oCreature, ClearAllActions());
                                // Run there.
                                if(sRun == "r")
                                {
                                    AssignCommand(oCreature, ActionMoveToLocation(GetLocation(oWalkWP), TRUE));
                                }
                                // Walk there.
                                else
                                {
                                    AssignCommand(oCreature, ActionMoveToLocation(GetLocation(oWalkWP), FALSE));
                                }
                            }
                            else if(GetIsObjectValid(oWalk))
                            {
                                AssignCommand(oCreature, ClearAllActions());
                                // Run there.
                                if(sRun == "r")
                                {
                                    AssignCommand(oCreature, ActionMoveToLocation(GetLocation(oWalk), TRUE));
                                }
                                // Walk there.
                                else
                                {
                                    AssignCommand(oCreature, ActionMoveToLocation(GetLocation(oWalk), FALSE));
                                }
                            }
                            else
                            {
                                AssignCommand(oCreature, ActionRandomWalk());
                            }
                        }

                    }


                    // Go to a specific point.

                    else if(sNumber == "_")
                    {
                        if(GetCurrentAction(oCreature) != ACTION_MOVETOPOINT)
                        {
                            x = 1;
                            oWalk = GetNearestObjectByTag("HX_CREATURE_SPAWN_WALK_WP", oCreature, x);

                            // Get the total number of waypoints.
                            while(GetIsObjectValid(oWalk))
                            {
                                if(GetName(oWalk) == sNumberString)
                                {
                                    oDest = oWalk;
                                }
                                x = x + 1;
                                oWalk = GetNearestObjectByTag("HX_CREATURE_SPAWN_WALK_WP", oCreature, x);
                            }

                            if(GetIsObjectValid(oDest) && GetDistanceBetween(oDest, oCreature) > 1.0)
                            {
                                if(GetCurrentAction(oCreature) != ACTION_MOVETOPOINT)
                                {
                                    AssignCommand(oCreature, ClearAllActions());
                                    // Run.
                                    if(sRun == "r")
                                    {
                                        AssignCommand(oCreature, ActionMoveToLocation(GetLocation(oDest), TRUE));
                                    }
                                    // Walk.
                                    else
                                        AssignCommand(oCreature, ActionMoveToLocation(GetLocation(oDest), FALSE));

                                }
                            }
                            else if(GetStringLeft(sCommandPlus, 3) == "_dw" && GetDistanceBetween(oDest, oCreature) <= 1.0)
                            {
                                if(GetPlotFlag(oCreature))
                                {
                                    SetPlotFlag(oCreature, FALSE);
                                }
                                if(GetImmortal(oCreature))
                                {
                                    SetImmortal(oCreature, FALSE);
                                }
                                DestroyObject(oCreature);
                                return;
                            }
                            else
                            {
                                AssignCommand(oCreature, ActionRandomWalk());
                            }
                        }
                    }
                }
            }
            //
            // End commands.
            //
        }
        oWP = GetNextObjectInShape(SHAPE_SPHERE, fRadius, lLoc, FALSE, OBJECT_TYPE_WAYPOINT);
    }
}

// Get the first PC (if any) in the area.
object GetAreaPC(object oArea)
{
    object oPC = GetFirstPC();

    while(GetIsObjectValid(oPC))
    {
        if(GetArea(oPC) == oArea)
        {
            return oPC;
        }
        oPC = GetNextPC();
    }

    return OBJECT_INVALID;
}

// Do cold damage to PC and associates.
void DoDamage(object oPC, int iDamage)
{
    object oHench1 = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC, 1);
    object oHench2 = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC, 2);
    object oHench3 = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC, 3);
    object oSummoned = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPC, 1);
    object oDominated = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oPC, 1);
    object oAnimal = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC, 1);
    object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC, 1);
    object oTorch = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC);


    // Damage the PC
    if(GetTag(oTorch) != "hx_berry_torch")
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(iDamage, DAMAGE_TYPE_COLD), oPC);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_FROST_S), oPC);
    }
    // Damage any associates.
    if(GetIsObjectValid(oHench1))
    {
        oTorch = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oHench1);
        if(GetTag(oTorch) != "hx_berry_torch")
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(iDamage, DAMAGE_TYPE_COLD), oHench1);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_FROST_S), oHench1);
        }
    }
    if(GetIsObjectValid(oHench2))
    {
        oTorch = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oHench2);
        if(GetTag(oTorch) != "hx_berry_torch")
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(iDamage, DAMAGE_TYPE_COLD), oHench2);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_FROST_S), oHench2);
        }
    }
    if(GetIsObjectValid(oHench3))
    {
        oTorch = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oHench3);
        if(GetTag(oTorch) != "hx_berry_torch")
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(iDamage, DAMAGE_TYPE_COLD), oHench3);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_FROST_S), oHench3);
        }
    }
    if(GetIsObjectValid(oSummoned))
    {
        oTorch = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oSummoned);
        if(GetTag(oTorch) != "hx_berry_torch")
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(iDamage, DAMAGE_TYPE_COLD), oSummoned);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_FROST_S), oSummoned);
        }
    }
    if(GetIsObjectValid(oDominated))
    {
        oTorch = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oDominated);
        if(GetTag(oTorch) != "hx_berry_torch")
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(iDamage, DAMAGE_TYPE_COLD), oDominated);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_FROST_S), oDominated);
        }
    }
    if(GetIsObjectValid(oAnimal))
    {
        oTorch = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oAnimal);
        if(GetTag(oTorch) != "hx_berry_torch")
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(iDamage, DAMAGE_TYPE_COLD), oAnimal);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_FROST_S), oAnimal);
        }
    }
    if(GetIsObjectValid(oFamiliar))
    {
        oTorch = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oFamiliar);
        if(GetTag(oTorch) != "hx_berry_torch")
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(iDamage, DAMAGE_TYPE_COLD), oFamiliar);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_FROST_S), oFamiliar);
        }
    }
}
