void main()
{
    if(GetLocalInt(OBJECT_SELF,"NW_L_M1Q5E08Fleeing"))
        SignalEvent(OBJECT_SELF,EventUserDefined(558));
}
