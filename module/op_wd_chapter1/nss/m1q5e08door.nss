void main()
{
    object oJared = GetNearestObjectByTag("M1Q5E08Jared");
    SetLocalInt(GetModule(),"NW_L_M1Q5E08Fleeing",TRUE);
    AssignCommand(oJared,ActionStartConversation(oJared));
    SignalEvent(oJared,EventUserDefined(580));

}
