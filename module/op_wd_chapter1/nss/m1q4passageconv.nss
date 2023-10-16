void main()
{
//    AssignCommand(GetEnteringObject(),ActionStartConversation(OBJECT_SELF,"M1Q4F20PASSAGE"));
    if(GetIsPC(GetEnteringObject()) &&
       GetLocalInt(OBJECT_SELF,"NW_L_Fired") == FALSE)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_Fired",TRUE);
        object oMouth = GetNearestObjectByTag("PO_" + GetTag(OBJECT_SELF));
        AssignCommand(oMouth,ActionStartConversation(oMouth));
    }
}
