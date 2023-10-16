//::///////////////////////////////////////////////
//:: Name: q2c_use_portal
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Randomly teleport the PC and associates to
    another portal(q2bPortal #1_13)
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 19/03
//:://////////////////////////////////////////////
//UPDATED JULY 28/03 - Support for multiple henchmen added
#include "x2_inc_banter"

void main()
{
    object oPC = GetLastUsedBy();
    //Pick a random portal (but don't pick itself)
    int nSelf = StringToInt(GetStringRight(GetTag(OBJECT_SELF), 1));
    int nRandom = Random(13) + 1;
    while (nRandom == nSelf)
    {
        nRandom = Random(13) + 1;
    }

    object oTarget = GetObjectByTag("q2bPortal" + IntToString(nRandom));
    location lLoc = GetLocation(oTarget);

    //teleport effect
    effect ePoof = EffectVisualEffect(VFX_IMP_HEALING_G);

    //PC's current location
    vector vUser = GetPosition(OBJECT_SELF);
    vUser = Vector(vUser.x, vUser.y, vUser.z + 1.0);
    location lUser1 = Location(GetArea(oPC), vUser, 0.0);

    //Target location
    vector vTarget = GetPositionFromLocation(lLoc);
    vTarget = Vector(vTarget.x, vTarget.y, vTarget.z + 1.0);
    location lTarget1 = Location(GetAreaFromLocation(lLoc), vTarget, 0.0);


    //Apply teleport effect at current location
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, ePoof, GetLocation(OBJECT_SELF));
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, ePoof, lUser1);

    //Apply teleport effect at target location
    DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, ePoof, lLoc));
    DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, ePoof, lTarget1));

    //Get the PC and any possible associates

    object oFamiliar   = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC);
    object oSummoned   = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPC);
    object oAnimal     = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC);
    object oDominated  = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oPC);
    object oHenchman1 = GetHenchman(oPC, 1);
    object oHenchman2 = GetHenchman(oPC, 2);

    DelayCommand(0.5, AssignCommand(oPC,JumpToLocation(lLoc)));
    //If there are any valid associates, jump them to the same spot as the PC.
    if (oHenchman1 != OBJECT_INVALID)
        DelayCommand(1.5, AssignCommand(oHenchman1, JumpToLocation(lLoc)));
    if (oHenchman2 != OBJECT_INVALID)
        DelayCommand(1.5, AssignCommand(oHenchman2, JumpToLocation(lLoc)));
    if (oFamiliar != OBJECT_INVALID)
        DelayCommand(1.5, AssignCommand(oFamiliar, JumpToLocation(lLoc)));
    if (oSummoned != OBJECT_INVALID)
        DelayCommand(1.5, AssignCommand(oSummoned, JumpToLocation(lLoc)));
    if (oAnimal != OBJECT_INVALID)
        DelayCommand(1.5, AssignCommand(oAnimal, JumpToLocation(lLoc)));
    if (oDominated != OBJECT_INVALID)
        DelayCommand(1.5, AssignCommand(oDominated, JumpToLocation(lLoc)));

    // * The first time a portal is used, try and fire a henchman popup
    if (GetLocalInt(GetModule(), "X2_L_PORTAL_USED_ONCE") == 0)
    {
        SetLocalInt(GetModule(), "X2_L_PORTAL_USED_ONCE", 1);
        object oSelf = OBJECT_SELF;
        // * delay it so they don't try doing en transit
        DelayCommand(2.5,  AttemptInterjectionOrPopup(oSelf, "x2_oneliner_nr", oPC, 6));
    }
}





