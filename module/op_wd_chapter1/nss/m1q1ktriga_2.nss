void main()
{
    object oFenthick = GetLocalObject(GetArea(OBJECT_SELF),"NW_G_oFenthick");
    object oPC = GetEnteringObject();
    if(GetIsPC(oPC) &&
       GetLocalInt(oPC,"NW_L_M1Q1KFenthicInit") == FALSE &&
       IsInConversation(oFenthick) == FALSE)
    {
        AssignCommand(oPC,ClearAllActions());
        AssignCommand(oFenthick,ClearAllActions());
        AssignCommand(oFenthick,ActionStartConversation(oPC));
    }
}
