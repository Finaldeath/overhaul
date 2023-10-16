//::///////////////////////////////////////////////
//:: Name hx_inc_appear
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This include will handle all of the shape-
     changing legalities.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Aug 29, 2003
//:://////////////////////////////////////////////

// Check whether someone is big enough to do giant-sized things.
int CheckGiant(object oPC);
// Check whether someone is able to do wolf things.
int CheckWolf(object oPC);
// Check whether someone is able to do pixie things.
int CheckPixie(object oPC);
// Check if they are a flyer.
int CheckFlier(object oObject);
// See if target is valid for wolf quest.
int CheckWolfQuest(object oPC);

//////////////////////////////////////////////////

// Check whether someone is big enough to do giant-sized things.
int CheckGiant(object oPC)
{
    int iAppear = GetAppearanceType(oPC);

    if(iAppear == APPEARANCE_TYPE_ELEMENTAL_EARTH ||
       iAppear == APPEARANCE_TYPE_ELEMENTAL_EARTH_ELDER ||
       iAppear == 94)
    {
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

// Check whether someone is able to do wolf things.
int CheckWolf(object oPC)
{
    int iAppear = GetAppearanceType(oPC);

    if(iAppear == APPEARANCE_TYPE_DOG_BLINKDOG ||
       iAppear == APPEARANCE_TYPE_DOG_DIRE_WOLF ||
       iAppear == APPEARANCE_TYPE_DOG_FENHOUND ||
       iAppear == APPEARANCE_TYPE_DOG_HELL_HOUND ||
       iAppear == APPEARANCE_TYPE_DOG_SHADOW_MASTIF ||
       iAppear == APPEARANCE_TYPE_DOG_WINTER_WOLF ||
       iAppear == APPEARANCE_TYPE_DOG_WOLF ||
       iAppear == APPEARANCE_TYPE_DOG_WORG)
    {
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

// Check whether someone is able to do pixie things.
int CheckPixie(object oPC)
{
    int iAppear = GetAppearanceType(oPC);

    if(iAppear == APPEARANCE_TYPE_FAIRY)
    {
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

// Check if they are a flyer.
int CheckFlier(object oObject)
{
    int iAppear = GetAppearanceType(oObject);

    if(CheckPixie(oObject) == TRUE)
    {
        return TRUE;
    }
    if(iAppear == APPEARANCE_TYPE_BAT ||
       iAppear == APPEARANCE_TYPE_BAT_HORROR ||
       iAppear == APPEARANCE_TYPE_FALCON ||
       iAppear == APPEARANCE_TYPE_FAERIE_DRAGON ||
       iAppear == APPEARANCE_TYPE_IMP ||
       iAppear == APPEARANCE_TYPE_MEPHIT_FIRE ||
       iAppear == APPEARANCE_TYPE_PSEUDODRAGON ||
       iAppear == APPEARANCE_TYPE_RAVEN ||
       iAppear == APPEARANCE_TYPE_SPECTRE ||
       iAppear == APPEARANCE_TYPE_WILL_O_WISP ||
       iAppear == APPEARANCE_TYPE_WRAITH)
    {
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

// See if target is valid for wolf quest.
int CheckWolfQuest(object oPC)
{
    int iClass1 = GetClassByPosition(1, oPC);
    int iClass2 = GetClassByPosition(2, oPC);
    int iClass3 = GetClassByPosition(3, oPC);

    if(CheckWolf(oPC) == TRUE)
    {
        return TRUE;
    }
    else if(iClass1 == CLASS_TYPE_DRUID || iClass1 == CLASS_TYPE_RANGER ||
            iClass2 == CLASS_TYPE_DRUID || iClass2 == CLASS_TYPE_RANGER ||
            iClass3 == CLASS_TYPE_DRUID || iClass3 == CLASS_TYPE_RANGER)
    {
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}
