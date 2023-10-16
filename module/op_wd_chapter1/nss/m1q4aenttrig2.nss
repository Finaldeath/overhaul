void main()
{
    if(!GetLocalInt(GetEnteringObject(),"NW_L_M1Q4AIdentified"))
    {
        object oGuard = GetNearestObjectByTag("m1Q04CGuard02");
        AssignCommand(oGuard,ActionStartConversation(oGuard));
    }
}
