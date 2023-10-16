void main()
{
if(GetIsPC(GetEnteringObject()) && GetLocalInt(GetObjectByTag("M2Q1CWYVERN"),"M2Q2WyvernDialogue") == 0)
    {
    SetLocalInt(GetObjectByTag("M2Q1CWYVERN"),"M2Q1WyvernDialogue",1);
    AssignCommand(GetObjectByTag("M2Q1CWYVERN"),ActionStartConversation(OBJECT_SELF));
    }
}
