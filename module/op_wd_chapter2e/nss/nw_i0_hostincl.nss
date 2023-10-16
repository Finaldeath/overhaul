//:://////////////////////////////////////////////
//:: Host Tower Include
//:: NW_I0_2Q6_HostIncl
//:: #include "NW_I0_HOSTINCL"
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 21, 2002
//:://////////////////////////////////////////////

//Makes the NPC face the nearest PC
void FaceNearestPC();
//Make the nearest PC say the stated string
void AssignPCDebugString(string sString);
//Creates a creature with a specific string at a specified location
void CreateObjectVoid(int nObjectType, string sTemplate, location lLoc, int bUseAppearAnimation = FALSE);
//Pass in one of nine predetermined way points to move the character to.
void MoveToPlotPoint(int nPlotPointIndex);
//Set a generic plot flag on a specific character
void SetLocalPlotIntOnCharacter(object oNPC, int nPlotStateIndex);
//Get the generic plot flag off of a character
int GetLocalPlotIntFromCharacter(object oNPC);
//Play Visual Effect on the Door
void  HOST_PlayDoorAnimation();
//Conversation check for the host tower of the arcane teleporter.  Pass in a level and see if it comes up true.
int HOST_PortalValid(int nLevel);
//Sets the portal to activate so that the characters have 1 minute to teleport to the next area.
void HOST_ActivatePortal(int nEnd);
//Returns the integer level of the host tower level the object currently resides on.
int GetHostTowerLevel();
//Removes a key from the PC after unlocking a door.
void RemoveKey(string sKeyTag);

void FaceNearestPC()
{
    vector vFace = GetPosition(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN));
    SetFacingPoint(vFace);
}

void AssignPCDebugString(string sString)
{
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    AssignCommand(oPC, SpeakString(sString));
}

void CreateObjectVoid(int nObjectType, string sTemplate, location lLoc, int bUseAppearAnimation = FALSE)
{
    object oVoid = CreateObject(nObjectType, sTemplate, lLoc, bUseAppearAnimation);
}

void MoveToPlotPoint(int nPlotPointIndex)
{
    string sTag = GetTag(OBJECT_SELF);
    sTag = "PLOT_" + sTag + "_0" + IntToString(nPlotPointIndex);
    object oWay = GetWaypointByTag(sTag);

    if(GetIsObjectValid(oWay))
    {
        ActionForceMoveToObject(oWay, TRUE, 1.0, 20.0);
    }
}

void SetLocalPlotIntOnCharacter(object oNPC, int nPlotStateIndex)
{
    string sTag = "PLOT2Q6" + GetTag(oNPC);
    SetLocalInt(oNPC, sTag, nPlotStateIndex);
}

int GetLocalPlotIntFromCharacter(object oNPC)
{
    string sTag = "PLOT2Q6" + GetTag(oNPC);
    return GetLocalInt(oNPC, sTag);
}

void  HOST_PlayDoorAnimation()
{
    object oWay = GetWaypointByTag("2Q6_DoorAnim");
    effect eVis = EffectVisualEffect(VFX_IMP_LIGHTNING_M);
    DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oWay)));
}

int HOST_PortalValid(int nLevel)
{
    string sAreaTag = GetTag(GetArea(OBJECT_SELF));
    sAreaTag = GetStringRight(sAreaTag, 1);

    if(nLevel == 1 && sAreaTag == "B")
    {
        return FALSE;
    }
    else if(nLevel == 2 && sAreaTag == "C")
    {
        return FALSE;
    }
    else if(nLevel == 3 && sAreaTag == "D")
    {
        return FALSE;
    }
    else if(nLevel == 4 && sAreaTag == "E")
    {
        return FALSE;
    }
    else if(nLevel == 5 && sAreaTag == "F")
    {
        return FALSE;
    }
    else if(nLevel == 6 && sAreaTag == "G")
    {
        return FALSE;
    }
    else if(nLevel == 7 && sAreaTag == "H")
    {
        return FALSE;
    }
    else if(nLevel == 8 && sAreaTag == "I")
    {
        return FALSE;
    }
    else if(nLevel == 9 && sAreaTag == "J")
    {
        return FALSE;
    }
    else if(nLevel == 10 && sAreaTag == "K")
    {
        return FALSE;
    }

    string sStone;
    if(nLevel != 10)
    {
        sStone = "2Q6_STONE0" + IntToString(nLevel);
    }
    else
    {
        sStone = "2Q6_STONE10";
    }

    object oStone = GetItemPossessedBy(GetPCSpeaker(), sStone);
    if(GetIsObjectValid(oStone) || nLevel == 1 || nLevel == 2)
    {
        return TRUE;
    }
    return FALSE;
}

void HOST_ActivatePortal(int nEnd)
{
    string sEnd;
    string sTrigger;
    string sStart;
    if(nEnd == 10)
    {
        sEnd = "2Q6_PORTAL_B_10";
    }
    else
    {
        sEnd = "2Q6_PORTAL_B_0" + IntToString(nEnd);
    }
    int nStart = GetHostTowerLevel();
    if(nStart == 10)
    {
        sTrigger = "2Q6_Portal_10";
        sStart = "2Q6_START_10";
    }
    else
    {
        sTrigger = "2Q6_Portal_0" + IntToString(nStart);
        sStart =  "2Q6_START_0" + IntToString(nStart);
    }
    //Use the destination to jump to the new area
    object oWayEnd = GetWaypointByTag(sEnd);
    //Use the start to create the portal
    object oWayStart = GetWaypointByTag(sStart);
    object oTrigger = GetObjectByTag(sTrigger);

    if(GetIsObjectValid(oWayStart) && GetIsObjectValid(oWayEnd) && GetIsObjectValid(oTrigger))
    {
        //AssignPCDebugString("All 3 Valid");
    }

    string sPortalColor;

    if(nEnd == 1)
    {
        sPortalColor = "2Q6_VX_PORTAL_01";
    }
    else if(nEnd == 2)
    {
        sPortalColor = "2Q6_VX_PORTAL_02";
    }
    else if(nEnd == 3)
    {
        sPortalColor = "2Q6_VX_PORTAL_03";
    }
    else if(nEnd == 4)
    {
        sPortalColor = "2Q6_VX_PORTAL_04";
    }
    else if(nEnd == 5)
    {
        sPortalColor = "2Q6_VX_PORTAL_05";
    }
    else if(nEnd == 6)
    {
        sPortalColor = "2Q6_VX_PORTAL_06";
    }
    else if(nEnd == 7)
    {
        sPortalColor = "2Q6_VX_PORTAL_07";
    }
    else if(nEnd == 8)
    {
        sPortalColor = "2Q6_VX_PORTAL_08";
    }
    else if(nEnd == 9)
    {
        sPortalColor = "2Q6_VX_PORTAL_09";
    }
    else if(nEnd == 10)
    {
        sPortalColor = "2Q6_VX_PORTAL_10";
    }
    //Create a visual effect for the portal start
    effect eVis = EffectVisualEffect(VFX_IMP_SUPER_HEROISM);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oWayStart));
    //Create the duration effect for the portal
    CreateObject(OBJECT_TYPE_PLACEABLE, sPortalColor, GetLocation(oWayStart));
    DestroyObject(GetObjectByTag(sPortalColor), 30.0);
    SetLocalObject(oTrigger, "NW_2Q6_PORTAL_DESTINATION", oWayEnd);
    DelayCommand(30.0, DeleteLocalObject(oTrigger, "NW_2Q6_PORTAL_DESTINATION"));
}

int GetHostTowerLevel()
{
    string sAreaTag = GetTag(GetArea(OBJECT_SELF));
    sAreaTag = GetStringRight(sAreaTag, 1);
    if(sAreaTag == "B")
    {
        return 1;
    }
    else if(sAreaTag == "C")
    {
        return 2;
    }
    else if(sAreaTag == "D")
    {
        return 3;
    }
    else if(sAreaTag == "E")
    {
        return 4;
    }
    else if(sAreaTag == "F")
    {
        return 5;
    }
    else if(sAreaTag == "G")
    {
        return 6;
    }
    else if(sAreaTag == "H")
    {
        return 7;
    }
    else if(sAreaTag == "I")
    {
        return 8;
    }
    else if(sAreaTag == "J")
    {
        return 9;
    }
    else if(sAreaTag == "K")
    {
        return 10;
    }
    else
    {
        return FALSE;
    }
}

void RemoveKey(string sKeyTag)
{
    object oPC = GetLastOpenedBy();
    if(GetIsObjectValid(oPC))
    {
        object oKey = GetItemPossessedBy(oPC, sKeyTag);
        if(GetIsObjectValid(oKey))
        {
            DestroyObject(oKey, 0.0);
        }
    }
}
