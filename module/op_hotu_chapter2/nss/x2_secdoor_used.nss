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
    string sDest;

    if (!GetLocked(OBJECT_SELF))
    {
        if (GetIsOpen(OBJECT_SELF))
        {
            sDest = GetLocalString(OBJECT_SELF,"Destination");

            oidUser = GetLastUsedBy();
            oidDest = GetObjectByTag(sDest);
            SignalEvent(oidDest, EventUserDefined(101)); // reveal the secret door on the other side

            AssignCommand(oidUser,ActionJumpToObject(oidDest,FALSE));
            object oAnimal = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oidUser);
            object oDominated = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oidUser);
            object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oidUser);
            object oSummoned = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oidUser);

            int i = 1;
            object oHenchman = GetHenchman(oidUser, i);
            while(oHenchman != OBJECT_INVALID)
            {
                SendCreature(oHenchman, oidDest);
                i++;
                oHenchman = GetHenchman(oidUser, i);
            }

            SendCreature(oAnimal, oidDest);
            SendCreature(oDominated, oidDest);
            SendCreature(oFamiliar, oidDest);
            SendCreature(oSummoned, oidDest);
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
