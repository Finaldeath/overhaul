void main()
{
    object oPC = GetEnteringObject();
    object oAribeth = GetLocalObject(GetArea(OBJECT_SELF),"NW_G_oAribeth");
    if( GetIsPC(oPC) &&
        GetLocalInt(oPC,"NW_L_M1Q1FSpokeToArib") == FALSE &&
        IsInConversation(oAribeth) == FALSE)
    {
        AssignCommand(oPC,ClearAllActions());
        AssignCommand(oAribeth,ActionStartConversation(oPC));
    }
}
