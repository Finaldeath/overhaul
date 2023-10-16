
//::///////////////////////////////////////////////
//:: Name hx_inc_meph
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This contains the Meph battle functions
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Edited By: Elyse Hill
//:: Created On: Sept 9, 2003
//:://////////////////////////////////////////////
#include "achievement_lib"
#include "x2_inc_toollib"
#include "x2_inc_cutscene"
#include "nw_i0_plot"
// Get rid of slow effects, and prepare for lava.
void RemoveAreaEffects(object oPC, object oArea);
// Set an int that the player is up at grapple so Meph can deal with them.
void SetPCAtGrapple(object oPC);
// Set an int that the player is not up at grapple.
void SetPCNotAtGrapple(object oPC);
// Make the PC safe from lava.
void SetLavaSafe(object oPC);
// Make the PC unsafe from lava.
void SetLavaUnsafe(object oPC);
// Get the lava state.
int GetLavaSafe(object oPC);
// Get the lava/ice property.
int GetLevelType(object oArea);
// Set the lava/ice property.
void SetLevelType(object oArea, int iType);
// Do cold damage to PC and associates.
void DoPCDamage(object oPC, int iDamage, int iType);
// Clean up the lava effects.
void CleanLava(object oSound, int iSound = FALSE, object oObject = OBJECT_SELF);
// Get how many times PC has fought Meph.
int GetMephCount();
// Set how many times PC has fought Meph.
void SetMephCount();
// Get an int that the player is up at grapple Meph can deal with them.
int GetPCAtGrapple(object oPC);
// Set Meph to be flight-ready.
void SetMephReady();
// Get Meph's ready state.
int GetMephReady();
// The damage Meph is currently at. This is for new versions of him that fly in.
int GetMephDamage();
// Set the damage Meph is currently at.
void SetMephDamage(int iDamage);
// Do the ending and play end movie.
void DoMephEnd(object oMeph, object oPC, int iDeath);

//////////////////////////////////////////////////

// Get rid of slow effects, and prepare for lava.
void RemoveAreaEffects(object oPC, object oArea)
{
    effect eEffect = GetFirstEffect(oPC);

    while(GetIsEffectValid(eEffect))
    {
        if(GetEffectCreator(eEffect) == oArea)
        {
            RemoveEffect(oPC, eEffect);
        }
        eEffect = GetNextEffect(oPC);
    }
    // Make the PC safe from lava.
    SetLavaSafe(oPC);
}

// Set an int that the player is up at grapple Meph can deal with them.
void SetPCAtGrapple(object oPC)
{
    SetLocalInt(oPC, "HX_PC_USED_GRAPPLE", 1);
}

// Set an int that the player is up at grapple Meph can deal with them.
int GetPCAtGrapple(object oPC)
{
    int iGrapple = GetLocalInt(oPC, "HX_PC_USED_GRAPPLE");

    if(iGrapple == 1)
    {
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

// Set an int that the player is not up at grapple.
void SetPCNotAtGrapple(object oPC)
{
    SetLocalInt(oPC, "HX_PC_USED_GRAPPLE", 0);
}

// Make the PC safe from lava.
void SetLavaSafe(object oPC)
{
    SetLocalInt(oPC, "HX_SAFE_LAVA", 0);
}

// Make the PC unsafe from lava.
void SetLavaUnsafe(object oPC)
{
    SetLocalInt(oPC, "HX_SAFE_LAVA", 1);
}

// Get the lava state.
int GetLavaSafe(object oPC)
{
    int iSafe = GetLocalInt(oPC, "HX_SAFE_LAVA");

    if(iSafe == 0)
    {
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

// Get the lava/ice property.
int GetLevelType(object oArea)
{
    int iType = GetLocalInt(oArea, "HX_LAVA_ICE_TYPE");

    return iType;
}

// Set the lava/ice property.
void SetLevelType(object oArea, int iType)
{
    SetLocalInt(oArea, "HX_LAVA_ICE_TYPE", iType);
}

// Do damage to PC and associates.
void DoPCDamage(object oPC, int iDamage, int iType)
{
    object oHench1 = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC, 1);
    object oHench2 = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC, 2);
    object oHench3 = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC, 3);
    object oSummoned = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPC, 1);
    object oDominated = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oPC, 1);
    object oAnimal = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC, 1);
    object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC, 1);

    if(iType > 0)
    {
        if(iType == 1 && GetLavaSafe(oPC) == FALSE)
        {
            // Damage the PC
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(iDamage, DAMAGE_TYPE_FIRE), oPC);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_FLAME_M), oPC);

            // Damage any associates.
            if(GetIsObjectValid(oHench1))
            {
                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(iDamage, DAMAGE_TYPE_FIRE), oHench1);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_FLAME_M), oHench1);
            }
            if(GetIsObjectValid(oHench2))
            {
                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(iDamage, DAMAGE_TYPE_FIRE), oHench2);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_FLAME_M), oHench2);
            }
            if(GetIsObjectValid(oHench3))
            {
                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(iDamage, DAMAGE_TYPE_FIRE), oHench3);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_FLAME_M), oHench3);
            }
            if(GetIsObjectValid(oSummoned))
            {
                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(iDamage, DAMAGE_TYPE_FIRE), oSummoned);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_FLAME_M), oSummoned);
            }
            if(GetIsObjectValid(oDominated))
            {
                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(iDamage, DAMAGE_TYPE_FIRE), oDominated);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_FLAME_M), oDominated);
            }
            if(GetIsObjectValid(oAnimal))
            {
                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(iDamage, DAMAGE_TYPE_FIRE), oAnimal);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_FLAME_M), oAnimal);
            }
            if(GetIsObjectValid(oFamiliar))
            {
                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(iDamage, DAMAGE_TYPE_FIRE), oFamiliar);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_FLAME_M), oFamiliar);
            }
        }
        else if(iType == 2 && GetPCAtGrapple(oPC) == FALSE)
        {
            // Slow the PC
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectMovementSpeedDecrease(65), oPC, 7.0);

            // Damage any associates.
            if(GetIsObjectValid(oHench1))
            {
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectMovementSpeedDecrease(65), oHench1, 7.0);
            }
            if(GetIsObjectValid(oHench2))
            {
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectMovementSpeedDecrease(65), oHench2, 7.0);
            }
            if(GetIsObjectValid(oSummoned))
            {
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectMovementSpeedDecrease(65), oSummoned, 7.0);
            }
            if(GetIsObjectValid(oDominated))
            {
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectMovementSpeedDecrease(65), oDominated, 7.0);
            }
            if(GetIsObjectValid(oAnimal))
            {
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectMovementSpeedDecrease(65), oAnimal, 7.0);
            }
            if(GetIsObjectValid(oFamiliar))
            {
               ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectMovementSpeedDecrease(65), oFamiliar, 7.0);
            }
        }
    }
}

// Clean up the lava effects.
void CleanLava(object oSound, int iSound = FALSE, object oObject = OBJECT_SELF)
{
    int x = 1;
    object oLava = GetNearestObjectByTag("x2_tmp_tile", GetFirstPC(), x);
    int iCut;

    if(iSound != TRUE)
    {
        iCut = CutGetActiveCutsceneForObject(GetFirstPC());
        if(iCut < 1)
        {
            NightToDay(GetFirstPC(), 2.0);
        }
        DelayCommand(1.5, SoundObjectStop(oSound));
    }
    else
    {
        DelayCommand(1.5, SoundObjectStop(oSound));
        SetWeather(GetArea(GetFirstPC()), WEATHER_USE_AREA_SETTINGS);
    }

    while(GetIsObjectValid(oLava))
    {
        SetPlotFlag(oLava, FALSE);
        DestroyObject(oLava);
        x = x + 1;
        oLava = GetNearestObjectByTag("x2_tmp_tile", GetFirstPC(), x);
    }
    SetLevelType(GetArea(GetFirstPC()), 0);
}

// Get how many times PC has fought Meph.
int GetMephCount()
{
    int iCount = GetLocalInt(GetArea(OBJECT_SELF), "HX_MEPH_FIGHT_COUNT");

    return iCount;
}

// Set how many times PC has fought Meph.
void SetMephCount()
{
    SetLocalInt(GetArea(OBJECT_SELF), "HX_MEPH_FIGHT_COUNT", GetMephCount() + 1);
}

// Set Meph to be flight-ready.
void SetMephReady()
{
    SetLocalInt(OBJECT_SELF, "HX_MEPH_READY", 1);
}

// Get Meph's ready state.
int GetMephReady()
{
    int iState = GetLocalInt(OBJECT_SELF, "HX_MEPH_READY");

    if(iState == 1)
    {
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

// The damage Meph is currently at. This is for new versions of him that fly in.
int GetMephDamage()
{
    int iDamage = GetLocalInt(GetArea(GetFirstPC()), "HX_MEPH_DAMAGE");

    return iDamage;
}

// Set the damage Meph is currently at.
void SetMephDamage(int iDamage)
{
    SetLocalInt(GetArea(GetFirstPC()), "HX_MEPH_DAMAGE", iDamage);
}

// Do the ending and play end movie.
void DoMephEnd(object oMeph, object oPC, int iDeath)
{
    // Disable cutscene abort.
    CutDisableAbort(300);

    //Set M's Fate local
    SetLocalString(GetModule(), "sMephistophelesFate", "CeaseExist");

    //Add Journal entry
    DelayCommand(2.0, AddJournalQuestEntry("XP2_Main", 110, oPC, TRUE, TRUE));

    //Give non-repeatable XP
    int i2daRow = 85;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        DelayCommand(2.0, Reward_2daXP(oPC, i2daRow));
    }

    //Mephisto-Fallen Achievement
    PlotAchievement(oPC, 6);

    //Difficulty Achievement: Player must fight Mephistopheles, cannot command him
    //or lower difficulty during the battle
    int iDifficulty;
    if(iDeath == 0 || iDeath == 1 || iDeath == 8){
        iDifficulty = GetLocalInt(GetModule(), "ach_meph_difficulty");
        if(iDifficulty >= 3 && GetLocalInt(GetModule(), "ach_lower_difficulty") != 1){
            DifficultyAchievements(oPC, GetObjectByTag("hx_meph"), GetGameDifficulty());
        }
    }

    // Player kills Meph.
    if(iDeath == 0)
    {
        //Set M's Fate local
        SetLocalString(GetModule(), "sMephistophelesFate", "CeaseExist");

        // Attack Meph.
        AssignCommand(oPC, ClearAllActions());
        AssignCommand(oPC, ActionAttack(oMeph));

        DelayCommand(1.0, PlayVoiceChat(VOICE_CHAT_DEATH));
        DelayCommand(1.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(464), GetLocation(oMeph)));
        //DelayCommand(1.0, PlayAnimation(ANIMATION_LOOPING_DEAD_BACK, 1.0, 999.0));
        DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSleep(), OBJECT_SELF));
        DelayCommand(1.1, SurrenderToEnemies());
        DelayCommand(1.1, AssignCommand(oPC, ClearAllActions(TRUE)));
        DelayCommand(1.1, ClearAllActions(TRUE));
        DelayCommand(1.1, SetCommandable(FALSE, oPC));
        DelayCommand(1.1, AdjustReputation(oPC, oMeph, 100));
        DelayCommand(5.0, FadeToBlack(oPC, FADE_SPEED_FAST));
        DelayCommand(6.8, SetCommandable(TRUE, oPC));
        CutDisableCutscene(300, 7.0, 7.0, RESTORE_TYPE_NONE);
        DelayCommand(7.0, ExecuteScript("hx_sendpc_to_end", oPC));
        DestroyObject(oMeph, 7.1);
    }
    // Meph ceases to exist.
    else if(iDeath == 1)
    {
        //Set M's Fate local
        SetLocalString(GetModule(), "sMephistophelesFate", "CeaseExist");

        DelayCommand(0.0, PlayVoiceChat(VOICE_CHAT_DEATH));
        DelayCommand(0.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(464), GetLocation(oMeph)));
        DelayCommand(0.0, PlayAnimation(ANIMATION_LOOPING_DEAD_BACK, 1.0, 999.0));
        DelayCommand(0.1, SurrenderToEnemies());
        DelayCommand(0.1, AssignCommand(oPC, ClearAllActions(TRUE)));
        DelayCommand(0.1, ClearAllActions(TRUE));
        DelayCommand(0.1, SetCommandable(FALSE, oPC));
        DelayCommand(0.1, AdjustReputation(oPC, oMeph, 100));
        DelayCommand(5.0, FadeToBlack(oPC, FADE_SPEED_FAST));
        DelayCommand(6.8, SetCommandable(TRUE, oPC));
        CutDisableCutscene(300, 7.0, 7.0, RESTORE_TYPE_NONE);
        DelayCommand(7.0, ExecuteScript("hx_sendpc_to_end", oPC));
        DestroyObject(oMeph, 7.1);
    }
    // Meph becomes good.
    else if(iDeath == 2)
    {
        //Set M's Fate local
        SetLocalString(GetModule(), "sMephistophelesFate", "Kindhearted");

        //Change his alignment to good
        AdjustAlignment(OBJECT_SELF, ALIGNMENT_GOOD, 100);
        //ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_STRIKE_HOLY), GetLocation(oMeph));
        TLVFXPillar(VFX_FNF_PWSTUN, GetLocation(oMeph), 4, 0.1, 6.0, -2.0);
        DelayCommand(0.3, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectKnockdown(), oMeph));

        //Apply daze VFX
        DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_IMP_DAZED_S), oMeph));

        DelayCommand(0.1, SetCommandable(FALSE, oPC));
        DelayCommand(1.1, AdjustReputation(oPC, oMeph, 100));
        DelayCommand(4.0, FadeToBlack(oPC, FADE_SPEED_FAST));
        DelayCommand(5.8, SetCommandable(TRUE, oPC));
        CutDisableCutscene(300, 6.0, 6.0, RESTORE_TYPE_NONE);
        DelayCommand(6.0, ExecuteScript("hx_sendpc_to_end", oPC));
        DestroyObject(oMeph, 6.1);
    }
    // Banished.
    else if(iDeath == 3)
    {
        //Set M's Fate local
        SetLocalString(GetModule(), "sMephistophelesFate", "Banish");

        DelayCommand(0.2, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectKnockdown(), oMeph));

        //Have him disappear in a Gate VFX
        DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_CELESTIAL), GetLocation(oMeph)));

        DelayCommand(0.1, SurrenderToEnemies());
        DelayCommand(0.1, AssignCommand(oPC, ClearAllActions(TRUE)));
        DelayCommand(0.1, ClearAllActions(TRUE));
        DelayCommand(0.1, SetCommandable(FALSE, oPC));
        DelayCommand(1.1, AdjustReputation(oPC, oMeph, 100));

        // He vanishes.
        DelayCommand(3.6, PlayVoiceChat(VOICE_CHAT_DEATH));
        DelayCommand(5.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY), oMeph));

        DelayCommand(7.0, FadeToBlack(oPC, FADE_SPEED_FAST));
        DelayCommand(8.8, SetCommandable(TRUE, oPC));
        CutDisableCutscene(300, 9.0, 9.0, RESTORE_TYPE_NONE);
        DelayCommand(9.0, ExecuteScript("hx_sendpc_to_end", oPC));
        DestroyObject(oMeph, 9.1);
    }
    // Servant.
    else if(iDeath == 4)
    {
        //Set M's Fate local
        SetLocalString(GetModule(), "sMephistophelesFate", "Servant");
        TLVFXPillar(VFX_FNF_PWSTUN, GetLocation(oMeph), 4, 0.1, 6.0, -2.0);
        //ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_STRIKE_HOLY), GetLocation(oMeph));
        AssignCommand(oMeph, SetFacingPoint(GetPosition(oPC)));
        DelayCommand(0.8, AssignCommand(oMeph, PlayAnimation(ANIMATION_LOOPING_WORSHIP, 1.0, 20.0)));

        DelayCommand(0.1, SetCommandable(FALSE, oPC));
        DelayCommand(0.1, AdjustReputation(oPC, oMeph, 100));
        DelayCommand(4.0, FadeToBlack(oPC, FADE_SPEED_FAST));
        DelayCommand(5.8, SetCommandable(TRUE, oPC));
        CutDisableCutscene(300, 6.0, 6.0, RESTORE_TYPE_NONE);
        DelayCommand(6.0, ExecuteScript("hx_sendpc_to_end", oPC));
        DestroyObject(oMeph, 6.1);
    }
    // Co-ruler
    else if(iDeath == 5)
    {
        //Set M's Fate local
        SetLocalString(GetModule(), "sMephistophelesFate", "Co-Ruler");

        //ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_STRIKE_HOLY), GetLocation(oMeph));
        TLVFXPillar(VFX_FNF_PWSTUN, GetLocation(oMeph), 4, 0.1, 6.0, -2.0);
        // They face each other and salute.
        AssignCommand(oMeph, SetFacingPoint(GetPosition(oPC)));
        DelayCommand(0.2, SetCommandable(TRUE, oPC));
        DelayCommand(0.3, AssignCommand(oPC, SetFacingPoint(GetPosition(oMeph))));
        DelayCommand(0.4, SetCommandable(FALSE, oPC));

        DelayCommand(1.0, AssignCommand(oMeph, PlayAnimation(ANIMATION_FIREFORGET_SALUTE)));
        DelayCommand(1.3, SetCommandable(TRUE, oPC));
        DelayCommand(1.4, AssignCommand(oPC, PlayAnimation(ANIMATION_FIREFORGET_SALUTE)));
        DelayCommand(1.5, SetCommandable(FALSE, oPC));
        DelayCommand(0.1, SetCommandable(FALSE, oPC));
        DelayCommand(0.1, AdjustReputation(oPC, oMeph, 100));
        DelayCommand(5.0, FadeToBlack(oPC, FADE_SPEED_FAST));
        DelayCommand(6.8, SetCommandable(TRUE, oPC));
        CutDisableCutscene(300, 7.0, 7.0, RESTORE_TYPE_NONE);
        DelayCommand(7.0, ExecuteScript("hx_sendpc_to_end", oPC));
        DestroyObject(oMeph, 7.1);
    }
    // Chamber maid.
    else if(iDeath == 6)
    {
        //Set M's Fate local
        SetLocalString(GetModule(), "sMephistophelesFate", "Chambermaid");

        //ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_STRIKE_HOLY), GetLocation(oMeph));
        TLVFXPillar(VFX_FNF_PWSTUN, GetLocation(oMeph), 4, 0.1, 6.0, -2.0);
        //Have him beg.
        DelayCommand(0.2, AssignCommand(oMeph, PlayAnimation(ANIMATION_LOOPING_TALK_PLEADING, 1.0, 10.0)));

        DelayCommand(0.1, SetCommandable(FALSE, oPC));
        DelayCommand(0.1, AdjustReputation(oPC, oMeph, 100));
        DelayCommand(4.0, FadeToBlack(oPC, FADE_SPEED_FAST));
        DelayCommand(5.8, SetCommandable(TRUE, oPC));
        CutDisableCutscene(300, 6.0, 6.0, RESTORE_TYPE_NONE);
        DelayCommand(6.0, ExecuteScript("hx_sendpc_to_end", oPC));
        DestroyObject(oMeph, 6.1);
    }
    // Meph surrenders prime and Cania
    else if(iDeath == 7)
    {
        //Set M's Fate local
        SetLocalString(GetModule(), "sMephistophelesFate", "CaniaKnowers");

        //ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_STRIKE_HOLY), GetLocation(oMeph));
        TLVFXPillar(VFX_FNF_PWSTUN, GetLocation(oMeph), 4, 0.1, 6.0, -2.0);
        AssignCommand(oMeph, SetFacingPoint(GetPosition(oPC)));
        DelayCommand(0.8, AssignCommand(oMeph, PlayAnimation(ANIMATION_LOOPING_WORSHIP, 1.0, 20.0)));

        DelayCommand(0.1, SetCommandable(FALSE, oPC));
        DelayCommand(0.1, AdjustReputation(oPC, oMeph, 100));
        DelayCommand(4.0, FadeToBlack(oPC, FADE_SPEED_FAST));
        DelayCommand(5.8, SetCommandable(TRUE, oPC));
        CutDisableCutscene(300, 6.0, 6.0, RESTORE_TYPE_NONE);
        DelayCommand(6.0, ExecuteScript("hx_sendpc_to_end", oPC));
        DestroyObject(oMeph, 6.1);
    }
    // Not commanded. Plots revenge.
    else if(iDeath == 8)
    {
        //Set M's Fate local
        SetLocalString(GetModule(), "sMephistophelesFate", "NotCommanded");

        DelayCommand(0.2, AssignCommand(oMeph, PlayAnimation(ANIMATION_FIREFORGET_TAUNT)));

        //Have him disappear in a Gate VFX
        DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_CELESTIAL), GetLocation(oMeph)));

        DelayCommand(0.1, SurrenderToEnemies());
        DelayCommand(0.1, AssignCommand(oPC, ClearAllActions(TRUE)));
        DelayCommand(0.1, ClearAllActions(TRUE));
        DelayCommand(0.1, SetCommandable(FALSE, oPC));
        DelayCommand(1.1, AdjustReputation(oPC, oMeph, 100));

        // He vanishes.
        DelayCommand(3.6, PlayVoiceChat(VOICE_CHAT_LAUGH));
        DelayCommand(5.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY), oMeph));

        DelayCommand(5.0, FadeToBlack(oPC, FADE_SPEED_FAST));
        DelayCommand(6.8, SetCommandable(TRUE, oPC));
        CutDisableCutscene(300, 7.0, 7.0, RESTORE_TYPE_NONE);
        DelayCommand(7.0, ExecuteScript("hx_sendpc_to_end", oPC));
        DestroyObject(oMeph, 7.1);
    }
    // Servant in hell.
    else if(iDeath == 9)
    {
        //Set M's Fate local
        SetLocalString(GetModule(), "sMephistophelesFate", "HellServant");

        //ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_STRIKE_HOLY), GetLocation(oMeph));
        TLVFXPillar(VFX_FNF_PWSTUN, GetLocation(oMeph), 4, 0.1, 6.0, -2.0);
        AssignCommand(oMeph, SetFacingPoint(GetPosition(oPC)));
        DelayCommand(0.8, AssignCommand(oMeph, PlayAnimation(ANIMATION_LOOPING_WORSHIP, 1.0, 20.0)));

        DelayCommand(0.1, SetCommandable(FALSE, oPC));
        DelayCommand(0.1, AdjustReputation(oPC, oMeph, 100));
        DelayCommand(4.0, FadeToBlack(oPC, FADE_SPEED_FAST));
        DelayCommand(5.8, SetCommandable(TRUE, oPC));
        CutDisableCutscene(300, 6.0, 6.0, RESTORE_TYPE_NONE);
        DelayCommand(6.0, ExecuteScript("hx_sendpc_to_end", oPC));
        DestroyObject(oMeph, 6.1);
    }
}
