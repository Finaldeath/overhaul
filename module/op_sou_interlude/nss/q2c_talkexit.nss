void main()
{
    object oPC = GetExitingObject();
    if(IsInConversation(oPC))
        AssignCommand(oPC, ClearAllActions());
}
