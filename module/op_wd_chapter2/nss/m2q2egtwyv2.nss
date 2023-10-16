void main()
{
if(GetIsPC(GetEnteringObject()) && GetLocalInt(GetObjectByTag("M2Q1CWYVERN"),"M2Q1WyvernAmbush") == 0)
    {
    SetLocalInt(GetObjectByTag("M2Q1CWYVERN"),"M2Q1WyvernDialogue",2);
    SetLocalInt(GetObjectByTag("M2Q1CWYVERN"),"M2Q1WyvernAmbush",1);
    ActionDoCommand(AssignCommand(GetObjectByTag("M2Q1CWYVERN"),ActionStartConversation(OBJECT_SELF)));
    }
}
