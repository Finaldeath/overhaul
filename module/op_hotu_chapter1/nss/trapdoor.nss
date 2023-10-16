//::///////////////////////////////////////////////
//:: Trap door that takes you to a waypoint that
//:: is stored into the Destination local string.
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: Robert Babiak
//:: Created On: June 25, 2002
//:://////////////////////////////////////////////

void main()
{
    //Get the PC and any possible associates
    object oPC = GetLastUsedBy();

    object oHenchman = GetHenchman(oPC);
    object oHenchman2 = GetHenchman(oPC, 2);

    object oFamiliar   = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC);
    object oSummoned   = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPC);
    object oAnimal     = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC);
    object oDominated  = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oPC);
    object oidDest;
    string sDest;

    if (!GetLocked(OBJECT_SELF) )
    {
        if ( GetIsOpen(OBJECT_SELF))
        {
            sDest = GetLocalString( OBJECT_SELF, "Destination" );

            oPC = GetLastUsedBy();
            oidDest = GetObjectByTag(sDest);

            AssignCommand(oPC, ActionJumpToObject(oidDest,FALSE));
            //If there are any valid associates, jump them to the same spot as the PC.
            if (oHenchman != OBJECT_INVALID)
            {
                AssignCommand(oHenchman, DelayCommand(1.0f,ActionJumpToObject(oidDest,FALSE)));

            }
            if (oHenchman2 != OBJECT_INVALID)
            {
                AssignCommand(oHenchman2, DelayCommand(1.0f,ActionJumpToObject(oidDest,FALSE)));

            }
            if (oFamiliar != OBJECT_INVALID)
            {
                AssignCommand(oFamiliar, DelayCommand(1.0f,ActionJumpToObject(oidDest,FALSE)));
            }
            if (oSummoned != OBJECT_INVALID)
            {
                AssignCommand(oSummoned, DelayCommand(1.0f,ActionJumpToObject(oidDest,FALSE)));
            }
            if (oAnimal != OBJECT_INVALID)
            {
                AssignCommand(oAnimal, DelayCommand(1.0f,ActionJumpToObject(oidDest,FALSE)));
            }
            if (oDominated != OBJECT_INVALID)
            {
                AssignCommand(oDominated, DelayCommand(1.0f,ActionJumpToObject(oidDest,FALSE)));
            }
            PlayAnimation(ANIMATION_PLACEABLE_CLOSE );
        } else
        {
            PlayAnimation(ANIMATION_PLACEABLE_OPEN );
        }
    } else
    {
    //    ActionUseSkill
    }

}



