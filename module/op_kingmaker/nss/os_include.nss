//::///////////////////////////////////////////////
//:: Kingmaker Include file
//:: os_include
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Kingmaker Include File
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

//Jumps the player to a waypoint
void q3_JumpToDoor(string sWay);

//checks to see if an object is valid
int os_CheckItem(string sTag);

//checks to see if the trigger has been entered before
int os_CheckTriggerEntered();

//sets that you've entered the trigger
void os_SetTriggerEntered();

//moves the party into the specified place
void os_MoveParty(object oWay, object oPlayer);

//checks to see if the player has spoken to the character
int os_CheckTalkedTo(int nTalked=1);

//sets that the player has spoken to the character
void os_SetTalkedTo(int nTalked=1);

//checks to see if an area has been entered
int os_CheckAreaEntered(int nEntered=0,object oArea = OBJECT_SELF);

//sets an area entered
void os_SetAreaEntered(int nEntered=1,object oArea = OBJECT_SELF);

//sets that you've received xp already
void os_SetXPReceived(int nXP=1);

//gets whether you've received your xp or not
int os_GetXPReceived(int nXP=0);

//brings alias to see the PC if the first vote is not the landowners' guild
void os_FirstVote();

//sets a henchman trigger
void os_SetHenchTrig(object oHench, int nNumber);

//checks on the appropriate henchmen for a trigger
object os_CheckRomance(object oKaidala,object oCalibast,object oPlayer);

//Destroys an item, even if in henchmen's inventory
void os_DestroyItem(string sTag);

//Starts a banter between henchmen
void os_StartBanter(object oHench, object oBanter, int nBanter);


//::///////////////////////////////////////////////
//:: q3_JumpToDoor()
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Jumps the player to the appropriate door
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

void q3_JumpToDoor(string sWay)
{
    object oPC = GetFirstPC();
    object oWay = GetObjectByTag(sWay);
    AssignCommand(oPC,ActionJumpToObject(oWay));
}

//::///////////////////////////////////////////////
//:: os_CheckItem()
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to see if the player has a particular item
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

int os_CheckItem(string sTag)
{
/*    object oPC = GetFirstPC();
    object oItem = GetItemPossessedBy(oPC,sItem);
    if(GetIsObjectValid(oItem))
    {
        return TRUE;
    }
    else
    {
        return FALSE;
    }*/
    object oPC = GetFirstPC();
    object oItem = GetItemPossessedBy(oPC,sTag);
    object oCal = GetNearestObjectByTag("os_hen_cal");
    object oKai = GetNearestObjectByTag("os_hen_kai");
    object oTrp = GetNearestObjectByTag("os_hen_trp");
    object oJab = GetNearestObjectByTag("os_hen_jab");
    object oItemC = GetItemPossessedBy(oCal,sTag);
    object oItemK = GetItemPossessedBy(oKai,sTag);
    object oItemT = GetItemPossessedBy(oTrp,sTag);
    object oItemJ = GetItemPossessedBy(oJab,sTag);
    if(GetIsObjectValid(oItem))
    {
        return TRUE;
    }
    else if(GetIsObjectValid(oItemC))
    {
        return TRUE;
    }
    else if(GetIsObjectValid(oItemJ))
    {
        return TRUE;
    }
    else if(GetIsObjectValid(oItemK))
    {
        return TRUE;
    }
    else if(GetIsObjectValid(oItemT))
    {
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

//::///////////////////////////////////////////////
//:: os_CheckTriggerEntered()
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the trigger has been entered before
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

int os_CheckTriggerEntered()
{
    int nTrig = GetLocalInt(OBJECT_SELF,"OS_TRIGGER_ENTERED");
    if(nTrig > 0)
    {
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

//::///////////////////////////////////////////////
//:: os_SetTriggerEntered
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets that you've entered the trigger
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

void os_SetTriggerEntered()
{
    SetLocalInt(OBJECT_SELF,"OS_TRIGGER_ENTERED",1);
}

//::///////////////////////////////////////////////
//::  os_MoveParty()
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Moves the party to the specified waypoint
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

void os_MoveParty(object oWay, object oPlayer)
{
    //Get the PC and any possible associates
    object oPC = oPlayer;

    object oHench1 = GetHenchman(oPC, 1);
    object oHench2 = GetHenchman(oPC, 2);

    PrintString("os_MoveParty called with henchmen 1 - " + GetTag(oHench1)
        + " and henchmen 2 - " + GetTag(oHench2));

//    object oHenchman = GetHenchman(oPC);

    object oFamiliar   = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC);
    object oSummoned   = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPC);
    object oAnimal     = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC);
    object oDominated  = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oPC);

    oPC = GetFirstPC();
//            oDest = GetObjectByTag(sDest);

    AssignCommand(oPC, ActionJumpToObject(oWay,FALSE));
    //If there are any valid associates, jump them to the same spot as the PC.
/*    if (oHenchman != OBJECT_INVALID)
    {
        AssignCommand(oHenchman, DelayCommand(1.0f,ActionJumpToObject(oWay,FALSE)));

    }*/
    if (oHench1 != OBJECT_INVALID)
    {
        AssignCommand(oHench1, ClearAllActions(TRUE));
        AssignCommand(oHench1, DelayCommand(1.0f,ActionJumpToObject(oWay,FALSE)));

    }
    if (oHench2 != OBJECT_INVALID)
    {
        AssignCommand(oHench2, ClearAllActions(TRUE));
        AssignCommand(oHench2, DelayCommand(1.0f,ActionJumpToObject(oWay,FALSE)));

    }
    if (oFamiliar != OBJECT_INVALID)
    {
        AssignCommand(oFamiliar, DelayCommand(1.0f,ActionJumpToObject(oWay,FALSE)));
    }
    if (oSummoned != OBJECT_INVALID)
    {
        AssignCommand(oSummoned, DelayCommand(1.0f,ActionJumpToObject(oWay,FALSE)));
    }
    if (oAnimal != OBJECT_INVALID)
    {
        AssignCommand(oAnimal, DelayCommand(1.0f,ActionJumpToObject(oWay,FALSE)));
    }
    if (oDominated != OBJECT_INVALID)
    {
        AssignCommand(oDominated, DelayCommand(1.0f,ActionJumpToObject(oWay,FALSE)));
    }
}

//::///////////////////////////////////////////////
//:: os_CheckTalkedTo()
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    checks to see if the player has spoken to the character
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////
int os_CheckTalkedTo(int nTalked=1)
{
    if(GetLocalInt(OBJECT_SELF,"OS_TALKED_TO")==nTalked)
    {
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

//::///////////////////////////////////////////////
//:: os_SetTalkedTo
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets that the player has spoken to the character
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

void os_SetTalkedTo(int nTalked=1)
{
    SetLocalInt(OBJECT_SELF,"OS_TALKED_TO",nTalked);
}

//::///////////////////////////////////////////////
//:: os_CheckAreaEntered
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to see if the area has been entered before
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////
int os_CheckAreaEntered(int nEntered=0,object oArea = OBJECT_SELF)
{
    if(GetLocalInt(oArea,"OS_AREA_ENTERED")==nEntered)
    {
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

//::///////////////////////////////////////////////
//:: os_SetAreaEntered
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    sets than an area has been entered
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////
void os_SetAreaEntered(int nEntered=1,object oArea = OBJECT_SELF)
{
    SetLocalInt(oArea,"OS_AREA_ENTERED",nEntered);
}

//::///////////////////////////////////////////////
//:: os_SetXPReceived
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    sets that you've received xp already
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: September 2003
//:://////////////////////////////////////////////
void os_SetXPReceived(int nXP=1)
{
    SetLocalInt(OBJECT_SELF,"OS_XP_RECEIVED",nXP);
}

//::///////////////////////////////////////////////
//:: os_GetXPReceived
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    gets whether you've received your xp or not
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: September 2003
//:://////////////////////////////////////////////
int os_GetXPReceived(int nXP=0)
{
    if(GetLocalInt(OBJECT_SELF,"OS_XP_RECEIVED")==nXP)
    {
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

//::///////////////////////////////////////////////
//:: os_FirstVote
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    brings alias to see the PC if the first vote is not the landowners' guild
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////
void os_FirstVote()
{
    object oAlias = GetObjectByTag("q2_alias");
    object oPC = GetFirstPC();
    int nVote = GetLocalInt(oPC,"OS_PC_VOTES");
    if(nVote==0 && GetLocalInt(oPC,"OS_LANDGUILD_PC")==0)
    {
        SetLocalInt(oAlias,"OS_ALIAS_VOTE",10);
//        AssignCommand(oAlias,ActionJumpToObject(oPC));
    }
}

//::///////////////////////////////////////////////
//:: os_SetHenchTrig
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    sets a henchman trigger
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

void os_SetHenchTrig(object oHench, int nNumber)
{
    object oPC = GetFirstPC();
    SetLocalInt(oPC,"OS_HENCH_INTERJECT",10);
    SetLocalInt(oHench,"OS_HENCH_CONV",nNumber);
    AssignCommand(oHench,ClearAllActions(TRUE));
    AssignCommand(oHench,JumpToObject(oPC));
    AssignCommand(oPC,ClearAllActions(TRUE));
    AssignCommand(oHench,ActionStartConversation(oPC));
}

//::///////////////////////////////////////////////
//:: os_CheckRomance
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    checks on the appropriate henchmen for a trigger
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////
object os_CheckRomance(object oKaidala,object oCalibast,object oPlayer)
{
    if(GetIsObjectValid(oKaidala)
        && GetGender(oPlayer)==GENDER_MALE
        && GetLocalInt(oPlayer,"OS_KAI_ROMANCE")<99)
    {
        return oKaidala;
    }
    else if(GetIsObjectValid(oCalibast)
        && GetGender(oPlayer)==GENDER_FEMALE
        && GetLocalInt(oPlayer,"OS_CAL_ROMANCE")<99)
    {
        return oCalibast;
    }
    else
    {
        return OBJECT_INVALID;
    }
}

//::///////////////////////////////////////////////
//:: os_DestroyItem
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Destroys an item, even if in henchmen's inventory
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Dec 2003
//:://////////////////////////////////////////////

void os_DestroyItem(string sTag)
{
    object oPC = GetFirstPC();
    object oItem = GetItemPossessedBy(oPC,sTag);
    object oCal = GetNearestObjectByTag("os_hen_cal");
    object oKai = GetNearestObjectByTag("os_hen_kai");
    object oTrp = GetNearestObjectByTag("os_hen_trp");
    object oJab = GetNearestObjectByTag("os_hen_jab");
    object oItemC = GetItemPossessedBy(oCal,sTag);
    object oItemK = GetItemPossessedBy(oKai,sTag);
    object oItemT = GetItemPossessedBy(oTrp,sTag);
    object oItemJ = GetItemPossessedBy(oJab,sTag);
    if(GetIsObjectValid(oItem))
    {
        DestroyObject(oItem);
    }
    else if(GetIsObjectValid(oItemC))
    {
        DestroyObject(oItemC);
    }
    else if(GetIsObjectValid(oItemJ))
    {
        DestroyObject(oItemJ);
    }
    else if(GetIsObjectValid(oItemK))
    {
        DestroyObject(oItemK);
    }
    else if(GetIsObjectValid(oItemT))
    {
        DestroyObject(oItemT);
    }
}

//::///////////////////////////////////////////////
//:: os_StartBanter(object oHench)
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    sets a henchman banter trigger
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

void os_StartBanter(object oHench, object oBanter, int nBanter)
{
    object oPC = GetFirstPC();
    SetLocalInt(oHench,"OS_HEN_BANTER",nBanter);
    AssignCommand(oHench,ClearAllActions(TRUE));
    AssignCommand(oHench,JumpToObject(oPC));
    AssignCommand(oBanter,ClearAllActions(TRUE));
    AssignCommand(oBanter,JumpToObject(oPC));
    AssignCommand(oPC,ClearAllActions(TRUE));
    AssignCommand(oHench,ActionStartConversation(oPC));
}

