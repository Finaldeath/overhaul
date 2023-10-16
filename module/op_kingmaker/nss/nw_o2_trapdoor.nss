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
//:: Modified By: Andrew Nobbs
//:: Modified On: September 23, 2002
//:: Modification: Removed unnecessary spaces.
//:://////////////////////////////////////////////
//:: Modified By: Keith K2 Hayward
//:: Modified On: September 7, 2004
//:: Modification: Now supports multiple henchmen and creatures
//:://////////////////////////////////////////////

void SendCreature(object oCreature, object oDest)
{
    if(oCreature != OBJECT_INVALID)
    {
        AssignCommand(oCreature, ClearAllActions());
        AssignCommand(oCreature, ActionJumpToObject(oDest,FALSE));
    }
}

void main()
{
    object oidUser;
    object oidDest;
    int iCounter = 1;
    string sDest;

    if (!GetLocked(OBJECT_SELF))
    {
        if (GetIsOpen(OBJECT_SELF))
        {
            sDest = GetLocalString(OBJECT_SELF,"Destination");

            oidUser = GetLastUsedBy();
            oidDest = GetObjectByTag(sDest);

            AssignCommand(oidUser,ActionJumpToObject(oidDest,FALSE));

            object oAnimal = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oidUser);
            while (oAnimal != OBJECT_INVALID)
            {
                SendCreature(oAnimal, oidDest);
                iCounter++;
                oAnimal = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oidUser, iCounter);
            }

            iCounter = 1;
            object oDominated = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oidUser);
            while (oDominated != OBJECT_INVALID)
            {
                SendCreature(oDominated, oidDest);
                iCounter++;
                oDominated = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oidUser, iCounter);
            }

            iCounter = 1;
            object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oidUser);
            while (oFamiliar != OBJECT_INVALID)
            {
                SendCreature(oFamiliar, oidDest);
                iCounter++;
                oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oidUser, iCounter);
            }

            iCounter = 1;
            object oHenchman = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oidUser);
            while (oHenchman != OBJECT_INVALID)
            {
                SendCreature(oHenchman, oidDest);
                iCounter++;
                oHenchman = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oidUser, iCounter);
            }

            iCounter = 1;
            object oSummoned = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oidUser);
            while (oSummoned != OBJECT_INVALID)
            {
                SendCreature(oSummoned, oidDest);
                iCounter++;
                oSummoned = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oidUser, iCounter);
            }

            //PlayAnimation(ANIMATION_PLACEABLE_CLOSE);
        } else
        {
            PlayAnimation(ANIMATION_PLACEABLE_OPEN);
        }
    } else
    {
    //    ActionUseSkill
    }

}
