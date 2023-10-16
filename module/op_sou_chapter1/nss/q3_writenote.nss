// Glendir writes the note

void ActionCreateItem(string sResRef);

void main()
{
    object oPC = GetPCSpeaker();

    ClearAllActions();
    ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW, 0.7, 3.0);
    ActionPlayAnimation(ANIMATION_FIREFORGET_PAUSE_SCRATCH_HEAD, 0.7);
    ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW, 0.7, 3.0);
    ActionPlayAnimation(ANIMATION_FIREFORGET_READ, 0.7);
    ActionPlayAnimation(ANIMATION_FIREFORGET_PAUSE_SCRATCH_HEAD, 0.7);
    ActionPlayAnimation(ANIMATION_FIREFORGET_READ, 0.7);
    ActionDoCommand(SetFacingPoint(GetPosition(oPC)));
    ActionSpeakStringByStrRef(40279);
    ActionDoCommand(ActionCreateItem("q3_promissary"));
}

void ActionCreateItem(string sResRef)
{
    CreateItemOnObject(sResRef);
}
