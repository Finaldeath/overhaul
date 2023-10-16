//::///////////////////////////////////////////////
//:: inc_plot_func
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This include file has all the commonly needed
    functions required for this module.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

// * CONSTANTS
int PLOT_COST_SHARED_ROOM = 5;
int PLOT_COST_SINGLE_ROOM = 10;
int PLOT_COST_LARGE_ROOM = 20;
int PLOT_COST_ALE = 1;
int PLOT_COST_SPIRITS = 5;
int PLOT_COST_WINE = 10;
int PLOT_MUSIC_1 = 46;
int PLOT_MUSIC_2 = 22;
int PLOT_MUSIC_3 = 24;
// * FUNCTION DECLARATIONS

// *********************
// * Give/Take/Exists Functions
// *********************
object plotGiveSharedKey(object oPC);
object plotGivePrivateKey(object oPC);
object plotGiveLargeKey(object oPC);

int plotGetExistsSharedKey();
int plotGetExistsPrivateKey();
int plotGetExistsLargeKey();
// *********************
// * Setup Functions
// *********************
void SetupInn1RoomPrices();
void SetupInn1DrinkPrices();



// *********************
// * Misc. Functions
// *********************
void plotDestroyObject(object oObject, float fSeconds);
int GetPlayerNear(object oObject);
int PlayerSeen(object oMe = OBJECT_SELF);
void LightAllTorchesInArea(object oArea, string sPrefix, int bTurnOn=TRUE);
// * Design function: returns true if the creatures module local says its dead
int IsDead(string sTag);
int CanIgnite(object oPC);
int IsAtWork(object oNPC = OBJECT_SELF);
void MakeDrink(string sDrink, int nAmount);
void MakeDrunk(object oTarget, int nPoints);
void TryToCloseAllDoorsInArea(object oArea, int nHour);
// * first heartbeat, spawn in new 'fire tile'
location GetAdjustLocation(float fAdjust, location lLoc);


// *********************
// * Movement Functions
// *********************
object plotTeleportCreate(string sResRef, location lWhere);
void plotTeleportDestroy(object oPC);
void plotTeleport(object oTeleporter, object oPlace);


// *********************
// * DEBUG Functions
// *********************
void db(string s);

// *************************
// *************************
// * FUNCTION IMPLEMENTATION
// *************************
// *************************

// *********************
// * Give/Take Functions
// *********************

object plotGiveSharedKey(object oPC)
{
    return CreateItemOnObject("inn1KeyShared", oPC);
}
object plotGivePrivateKey(object oPC)
{
    return CreateItemOnObject("inn1KeyPrivate", oPC);
}
object plotGiveLargeKey(object oPC)
{
    return CreateItemOnObject("inn1KeyLarge", oPC);
}


int plotGetExistsSharedKey()
{
    return GetIsObjectValid(GetObjectByTag("inn1KeyShared"));
}

int plotGetExistsPrivateKey()
{
    return GetIsObjectValid(GetObjectByTag("inn1KeyPrivate"));
}

int plotGetExistsLargeKey()
{
    return GetIsObjectValid(GetObjectByTag("inn1KeyLarge"));
}



// *********************
// * Setup Functions
// *********************
void SetupInn1RoomPrices()
{
    SetCustomToken(101, IntToString(PLOT_COST_SHARED_ROOM));
    SetCustomToken(102, IntToString(PLOT_COST_SINGLE_ROOM));
    SetCustomToken(103, IntToString(PLOT_COST_LARGE_ROOM));
}
void SetupInn1DrinkPrices()
{
    SetCustomToken(104, IntToString(PLOT_COST_SHARED_ROOM));
    SetCustomToken(105, IntToString(PLOT_COST_SINGLE_ROOM));
    SetCustomToken(106, IntToString(PLOT_COST_LARGE_ROOM));
}

// *********************
// * Misc. Functions
// *********************

//::///////////////////////////////////////////////
//:: plotDestroyObject
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Will destroy the object in nSeconds.
    The module does the deleting so it should not
    be interruptible.
*/
//:://////////////////////////////////////////////
//:: Created By:  Brent
//:: Created On:
//:://////////////////////////////////////////////
void plotDestroyObject(object oObject, float fSeconds)
{
        DestroyObject(oObject, fSeconds);
}

//::///////////////////////////////////////////////
//:: GetPlayerNear
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to see if anyplayer is near the object passed in.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
int GetPlayerNear(object oObject)
{
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oObject);
    if (GetIsObjectValid(oPC) && GetDistanceBetween(oPC, oObject) <= 10.0)
    {
        return TRUE;
    }
    return FALSE;
}
//::///////////////////////////////////////////////
//:: PlayerSeen
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns true if a player can be seen
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
int PlayerSeen(object oMe = OBJECT_SELF)
{
    // * Exit userdefined script if cannot see a player
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oMe, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN);
    if (GetIsObjectValid(oPC) == FALSE)
    {
        return FALSE;
    }
    return TRUE;

}
//::///////////////////////////////////////////////
//:: LightAllTorchesInArea
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Goes through all sPrefix + "torch" lights
    in the area and turns them all and then adjusts
    the lighting.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void LightAllTorchesInArea(object oArea, string sPrefix, int bTurnOn=TRUE)
{
        string sLightTag = sPrefix + "torch";

        int nIndex = 0;
        object oLight = GetObjectByTag(sLightTag, nIndex);
        while (GetIsObjectValid(oLight) == TRUE)
        {
            int nAnimation =  ANIMATION_PLACEABLE_ACTIVATE;
            if (bTurnOn == FALSE)
            {
                nAnimation = ANIMATION_PLACEABLE_DEACTIVATE;
            }
            AssignCommand(oLight, PlayAnimation(nAnimation));
            DelayCommand(0.4,SetPlaceableIllumination(oLight, bTurnOn));
            nIndex ++;
            oLight = GetObjectByTag(sLightTag, nIndex);
        }
        DelayCommand(0.5,RecomputeStaticLighting(oArea));
}

//::///////////////////////////////////////////////
//:: IsDead
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
// * Design function: returns true if the creatures module local says its dead

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

int IsDead(string sTag)
{
    if (GetLocalInt(GetModule(),"NW_G_DEATH_" + sTag)> 0)
    {
        return TRUE;
    }
    return FALSE;
}
//::///////////////////////////////////////////////
//:: CanIgnite
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns true if oPC has something
    that can start a fire  and is holding it
    in either their main hand or off hand
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

int CanIgnite(object oPC)
{

    object oItem = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC);
    if (GetItemHasItemProperty(oItem, ITEM_PROPERTY_LIGHT) == TRUE)
    {
        return TRUE;
    }
    oItem = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
    if (GetItemHasItemProperty(oItem, ITEM_PROPERTY_LIGHT) == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
//::///////////////////////////////////////////////
//:: IsAtWork
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns true if the NPC is in their 'at work'
    area.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

int IsAtWork(object oNPC = OBJECT_SELF)
{
    if (GetLocalInt(GetArea(oNPC), GetTag(oNPC)) == 10)
    {
        return TRUE;
    }
    return FALSE;
}

//::///////////////////////////////////////////////
//:: Make Drunk
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
loses a few points of int.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
void MakeDrunk(object oTarget, int nPoints)
{
    effect eDumb = EffectAbilityDecrease(ABILITY_INTELLIGENCE, nPoints);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDumb, oTarget, 60.0);
}
//::///////////////////////////////////////////////
//:: MakeDrink
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
NPC will drink from a bottle or player will
be given the specified template.
Can only be ran from conversation
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void MakeDrink(string sDrink, int nAmount)
{
   object oTalker = GetPCSpeaker();
   if (GetIsObjectValid(oTalker) == FALSE)
    {
        oTalker = GetNearestCreature(CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN);
        // * Fake 'drinking'
        AssignCommand(oTalker, ActionPlayAnimation(ANIMATION_FIREFORGET_DRINK, 1.0, 4.0));
        AssignCommand(oTalker, MakeDrunk(oTalker, d6(1)));
    }
    else
    // * if a PC give the PC a bottle of ale
    {
        CreateItemOnObject(sDrink, GetPCSpeaker());
    }
    TakeGoldFromCreature(nAmount, oTalker, TRUE) ;
}


//::///////////////////////////////////////////////
//:: CloseAllDoorsInArea
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Closes all doors in the area.
    If any door has the phrase lock in its
    TAG then the door will be locked
    every nHours this will happen
*/
//:://////////////////////////////////////////////
//:: Created By:Brent
//:: Created On:
//:://////////////////////////////////////////////
void TryToCloseAllDoorsInArea(object oArea, int nHour)
{
    // * Determine if the criteria for doors
    // * opening is valid
    if ((GetTimeHour()%nHour) == 0)
    {

        // * Doors should only shut ONCE during the eight hour cycle
        if (GetLocalInt(oArea, "NW_L_DOORTOGGLE") == 0)
        {

            SetLocalInt(oArea,"NW_L_DOORTOGGLE", 10);
        }
        else
            return; // * doors already shut once in this nHour-hr cycle
    }
    else
    {
        // * allows door to open again the next time
        // * nhours pass
        if (GetLocalInt(oArea, "NW_L_DOORTOGGLE") > 0)
        {
            SetLocalInt(oArea,"NW_L_DOORTOGGLE", 0);
        }
        return;
    }
    // * now close the doors

    object oDoor = GetFirstObjectInArea(oArea);
    while (GetIsObjectValid(oDoor) == TRUE)
    {
      if (GetObjectType(oDoor) == OBJECT_TYPE_DOOR)
      {
        if (GetIsOpen(oDoor) == TRUE)
        {
          AssignCommand(oDoor, ActionCloseDoor(oDoor));
          if (FindSubString(GetTag(oDoor),"lock") > -1)
          {
            SetLocked(oDoor, TRUE);
          }
        }
      }
      oDoor = GetNextObjectInArea(oArea);
    }
}


// *********************
// * Movement Functions
// *********************

//::///////////////////////////////////////////////
//:: plotTeleportDestroy
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Destroys the NPC with a nice visual
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void plotTeleportDestroy(object oPC)
{
    effect eImpact = EffectVisualEffect(259);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eImpact, GetLocation(oPC));
    DestroyObject(oPC, 0.0);
}
//::///////////////////////////////////////////////
//:: plotTeleportCreate
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Creates the creature with <resref> with a nice
    visual effect.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

object plotTeleportCreate(string sResRef, location lWhere)
{
    object oNew = CreateObject(OBJECT_TYPE_CREATURE, sResRef, lWhere);
    effect eImpact = EffectVisualEffect(259);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eImpact, GetLocation(oNew));
    return oNew;

}

void plotTeleport(object oTeleporter, object oPlace)
{
        AssignCommand(oTeleporter, ClearAllActions());
        effect eImpact = EffectVisualEffect(259);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eImpact, GetLocation(oTeleporter));
        AssignCommand(oTeleporter, JumpToObject(oPlace));

}



//::///////////////////////////////////////////////
//:: GetAdjustLocation
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Is used for spawning in invisibles objects at a
    certain z-offset.
    fAdjust: adjusted z-axis to lLoc
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

// * first heartbeat, spawn in new 'fire tile'
location GetAdjustLocation(float fAdjust, location lLoc)
{
    vector vPos = GetPositionFromLocation(lLoc);
    object oArea = GetAreaFromLocation(lLoc);
    float fFace = GetFacingFromLocation(lLoc);
    vPos.z = vPos.z + fAdjust;
    return Location(oArea, vPos, fFace);
}



// *********************
// * DEBUG Functions
// *********************
void db(string s)
{
    //AssignCommand(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC), SpeakString(s));
}
