void main()
{
    object oPC = GetLastAttacker();

    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
         return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    DelayCommand(1.0, AssignCommand(oPC, ClearAllActions()));
    object oNilmaldor = GetNearestObjectByTag("Q2_NILMALDOR");
    SetLocalInt(oNilmaldor, "Q2_NILMALDOR_WARNED_ONCE", 1);
    AssignCommand(oNilmaldor, ClearAllActions());
    AssignCommand(oNilmaldor, ActionMoveToObject(oPC, TRUE));
    AssignCommand(oNilmaldor, ActionSpeakStringByStrRef(40298));
    AssignCommand(oNilmaldor, ActionPlayAnimation(ANIMATION_LOOPING_TALK_FORCEFUL, 1.0, 2.0));
}
