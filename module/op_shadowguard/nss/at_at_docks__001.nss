
void main()
{
    object oClicker = GetClickingObject();
    object oTarget = GetTransitionTarget(OBJECT_SELF);

    SetAreaTransitionBMP(AREA_TRANSITION_RANDOM);

    if ((GetIsPossessedFamiliar(oClicker) == FALSE)
      && (GetIsPC(oClicker) == TRUE))
    {
        AssignCommand(oClicker,JumpToObject(oTarget));
    }
    else if (GetIsPossessedFamiliar(oClicker) == TRUE)
    {
        UnpossessFamiliar(oClicker);
    }
}
