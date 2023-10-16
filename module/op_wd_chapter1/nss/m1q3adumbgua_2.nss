void main()
// * July 2002: perception script will only fire if the PC
// * has not been identified previously
{   if (GetLocalInt(GetLastPerceived(),"NW_L_Init_" + GetTag(OBJECT_SELF)) == FALSE)
    if(GetIsPC(GetLastPerceived()) && GetLastPerceptionSeen())
    {
        SetLocalInt(OBJECT_SELF,"NW_L_M1Q3BWarn",1);
        ActionStartConversation(OBJECT_SELF);
    }
}
