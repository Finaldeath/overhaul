//::///////////////////////////////////////////////
//:: q2b04_use_throne
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Teleport Trap from the Throne of Bone that takes any
    PC using it to the Lair of the Vampire level.
    There is No chance to detect or disarm this trap.
    Check to see if the PC has henchman or associates and send
    them along too


*/
//:://////////////////////////////////////////////
//:: Created By: Keith W
//:: Created On: September 23/02
//:://////////////////////////////////////////////


void main()
{
    //Create a flashy Teleport effect
    //create some explosion effects and flashy stuff
    effect eSmoke = EffectVisualEffect(VFX_FNF_DISPEL);
    location lSmoke = GetLocation(OBJECT_SELF);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eSmoke,lSmoke);

    //Get the PC and any possible associates
    object oPC = GetLastUsedBy();
    object oHenchman = GetHenchman(oPC);
    object oFamiliar   = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC);
    object oSummoned   = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPC);
    object oAnimal     = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC);
    object oDominated  = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oPC);

    //Jump the PC to the Lair of the Vampire entrance point
    AssignCommand(oPC, DelayCommand(1.0f,ActionJumpToObject(GetWaypointByTag("wp_lair_entrance"))));

    //If there are any valid associates, jump them to the same spot as the PC.
    if (oHenchman != OBJECT_INVALID)
    {
        AssignCommand(oHenchman, DelayCommand(1.0f,ActionJumpToObject(GetWaypointByTag("wp_lair_entrance"))));
    }
    if (oFamiliar != OBJECT_INVALID)
    {
        AssignCommand(oFamiliar, DelayCommand(1.0f,ActionJumpToObject(GetWaypointByTag("wp_lair_entrance"))));
    }
    if (oSummoned != OBJECT_INVALID)
    {
        AssignCommand(oSummoned, DelayCommand(1.0f,ActionJumpToObject(GetWaypointByTag("wp_lair_entrance"))));
    }
    if (oAnimal != OBJECT_INVALID)
    {
        AssignCommand(oAnimal, DelayCommand(1.0f,ActionJumpToObject(GetWaypointByTag("wp_lair_entrance"))));
    }
    if (oDominated != OBJECT_INVALID)
    {
        AssignCommand(oDominated, DelayCommand(1.0f,ActionJumpToObject(GetWaypointByTag("wp_lair_entrance"))));
    }
}

