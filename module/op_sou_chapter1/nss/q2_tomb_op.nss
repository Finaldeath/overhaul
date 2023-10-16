void main()
{
    object oPC = GetLastOpenedBy();

    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
         return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    object oNilmaldor = GetNearestObjectByTag("Q2_NILMALDOR");
    SetLocalInt(oNilmaldor, "Q2_NILMALDOR_WARNED_ONCE", 1);
    AssignCommand(oNilmaldor, ActionSpeakStringByStrRef(40298));
}
