void main()
{
    if( (GetIsPC(GetEnteringObject())) && (GetLocalInt(GetModule(),"M2Q1MissusEisenDialogue") == 0))
    {
        SetLocalInt(GetModule(),"M2Q1MissusEisenInit",1);
        SetLocalInt(GetModule(),"M2Q1MissusEisenDialogue",1);
        AssignCommand(GetObjectByTag("M2Q1CEIS2"),ClearAllActions());
        AssignCommand(GetObjectByTag("M2Q1CEIS2"),ActionStartConversation(OBJECT_SELF));
    }
}
