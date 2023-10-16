//at_siegetower
//Take associates and herald too
void main()
{
  object oClicker = GetClickingObject();


  object oHerald = GetObjectByTag("q2aherald");

  object oTarget = GetTransitionTarget(OBJECT_SELF);

  SetAreaTransitionBMP(AREA_TRANSITION_RANDOM);

  AssignCommand(oClicker,JumpToObject(oTarget));
  DelayCommand(1.0,  AssignCommand(oHerald, JumpToObject(oTarget)));

    int i = 1;
    effect eVis;
    object oHench = GetHenchman(oClicker, i);
    while(oHench != OBJECT_INVALID)
    {
        DelayCommand(1.0,  AssignCommand(oHench, JumpToObject(oTarget)));
        i++;
        oHench = GetHenchman(oClicker, i);
    }


    object oSummoned = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oClicker);
    if (GetIsObjectValid(oSummoned) == TRUE)
        DelayCommand(1.0,  AssignCommand(oSummoned, JumpToObject(oTarget)));

    object oAnimal = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oClicker);
    if (GetIsObjectValid(oAnimal) == TRUE)
        DelayCommand(1.0,  AssignCommand(oAnimal, JumpToObject(oTarget)));

    object oDominated = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oClicker);
    if (GetIsObjectValid(oDominated) == TRUE)
        DelayCommand(1.0,  AssignCommand(oDominated, JumpToObject(oTarget)));

    object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oClicker);
    if (GetIsObjectValid(oFamiliar) == TRUE)
        DelayCommand(1.0,  AssignCommand(oFamiliar, JumpToObject(oTarget)));



}
