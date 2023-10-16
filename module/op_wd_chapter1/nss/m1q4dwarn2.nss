void main()
{
    object oLamp = GetNearestObjectByTag("M1Q4DWarning");
    AssignCommand(oLamp,ActionStartConversation(oLamp));
}
