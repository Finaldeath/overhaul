//::///////////////////////////////////////////////
//:: Name act_q2drocks_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Jump the PC to the other side of the rocks.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 1/03
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

    oidUser = GetPCSpeaker();
    oidDest = GetWaypointByTag("wp_q2d_rockjump" + GetStringRight(GetTag(OBJECT_SELF), 1));

    BlackScreen(oidUser);
    DelayCommand(1.0, FadeFromBlack(oidUser));
    AssignCommand(oidUser,ActionJumpToObject(oidDest,FALSE));
            object oAnimal = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oidUser);
            object oDominated = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oidUser);
            object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oidUser);
            //You could add a loop here for unlimited henchmen
            object oHenchman1 = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oidUser, 1);
            object oHenchman2 = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oidUser, 2);

            object oSummoned = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oidUser);

            DelayCommand(0.5, SendCreature(oAnimal, oidDest));
            DelayCommand(0.5, SendCreature(oDominated, oidDest));
            DelayCommand(0.5, SendCreature(oFamiliar, oidDest));
            DelayCommand(0.5, SendCreature(oHenchman1, oidDest));
            DelayCommand(0.5, SendCreature(oHenchman2, oidDest));
            DelayCommand(0.5, SendCreature(oSummoned, oidDest));
            //PlayAnimation(ANIMATION_PLACEABLE_CLOSE);


}
