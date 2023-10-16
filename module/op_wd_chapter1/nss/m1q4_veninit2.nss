void main()
{
    string sTag = "m1Q04CVengaul";
    object oNPC = GetLocalObject(GetArea(OBJECT_SELF),"NW_G_" + sTag);
    object oPC = GetEnteringObject();
    if(GetIsPC(oPC) &&
       GetLocalInt(oPC,"NW_L_Init_" + GetTag(oNPC)) == FALSE &&
       IsInConversation(oNPC) == FALSE &&
       GetCurrentAction(oNPC) == ACTION_INVALID)
    {
        AssignCommand(oPC,ClearAllActions());
        AssignCommand(oNPC,ClearAllActions());
        AssignCommand(oNPC,ActionStartConversation(oPC));
    }
}
