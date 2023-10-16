// Have the door talk the kobold sergeant dialog

void main()
{
    object oPC = GetClickingObject();


    object oKobold = GetNearestObjectByTag("Q2_KOBOLD_SER");
    if(oKobold == OBJECT_INVALID)
        return;
    object oHench = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC);

    //object oTalker = GetNearestObjectByTag("Q2_KOBOLD_DOOR_TALKER");
    object oTalker = OBJECT_SELF;
    //DelayCommand(3.0, SetPlotFlag(OBJECT_SELF, FALSE));
    AssignCommand(oPC, ClearAllActions(TRUE));
    AssignCommand(oTalker, ActionStartConversation(oPC));

    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_STOP_HENCH_ONCE");
    if(nDoOnce == 1)
       return;
    SetLocalInt(OBJECT_SELF, "DO_STOP_HENCH_ONCE", 1);


    object oAnimal = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC);
    object oDominated = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oPC);
    object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC);
    object oSummoned = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPC);
    AssignCommand(oHench, ClearAllActions(TRUE));
    AssignCommand(oAnimal, ClearAllActions(TRUE));
    AssignCommand(oDominated, ClearAllActions(TRUE));
    AssignCommand(oFamiliar, ClearAllActions(TRUE));
    AssignCommand(oSummoned, ClearAllActions(TRUE));



}
