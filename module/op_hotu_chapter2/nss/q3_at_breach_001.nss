
void AutoSave()
{
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_AUTOSAVE_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_AUTOSAVE_ONCE", 1);

    DoSinglePlayerAutoSave();
}


void main()
{
  object oClicker = GetClickingObject();
  object oTarget = GetTransitionTarget(OBJECT_SELF);

  SetAreaTransitionBMP(AREA_TRANSITION_RANDOM);
  //AutoSave();

  AssignCommand(oClicker,JumpToObject(oTarget));
}
