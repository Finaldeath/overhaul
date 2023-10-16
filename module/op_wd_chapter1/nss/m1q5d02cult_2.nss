void main()
{
    object oTarget = GetLastPerceived();
    if (GetIsObjectValid(oTarget) &&
         GetLastPerceptionSeen() &&
         GetIsPC(oTarget) &&
         GetLocalInt(OBJECT_SELF,"NW_L_Interrupted") == FALSE)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_Interrupted", TRUE);
        //ActionStartConversation(oTarget);
        ActionAttack(oTarget);
        SignalEvent(GetArea(OBJECT_SELF),EventUserDefined(0));
    }
}
